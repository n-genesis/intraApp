<?php
final class Loader {
	protected $registry;

	public function __construct($registry) {
		$this->registry = $registry;
	}
	
	public function controller($route, $data = array()) {
		// Sanitize the call
		$route = preg_replace('/[^a-zA-Z0-9_\/]/', '', (string)$route);
		
		$action = new Action($route);
		$output = $action->execute($this->registry, array(&$data));

		if (!($output instanceof Exception)) {
			return $output;
		} else {
			return false;
		}
	}
	
	public function model($route) {
		// Sanitize the call
		$route = preg_replace('/[^a-zA-Z0-9_\/]/', '', (string)$route);
		
		$file  = DIR_APPLICATION . 'model/' . $route . '.php';
		$class = 'Model' . preg_replace('/[^a-zA-Z0-9]/', '', $route);
		
		if (is_file($file)) {
			include_once($file);
			//echo $class;
			$proxy = new Proxy();

			foreach (get_class_methods($class) as $method) {
				$proxy->{$method} = $this->callback($this->registry, $route . '/' . $method);
			}

			$this->registry->set('model_' . str_replace(array('/', '-', '.'), array('_', '', ''), (string)$route), $proxy);
		} else {
			throw new \Exception('Error: Could not load model ' . $route . '!');
		}
	}

	public function view($route, $data = array()) {
		// Sanitize the call
		$route = str_replace('../', '', (string)$route);
		
		$template = new Template('basic');
		
		foreach ($data as $key => $value) {
			$template->set($key, $value);
		}
		
		$output = $template->render($route . '.tpl');
		
		return $output;
	}

	public function library($route) {
		// Sanitize the call
		$route = preg_replace('/[^a-zA-Z0-9_\/]/', '', (string)$route);
			
		$file = DIR_SYSTEM . 'library/' . $route . '.php';
		$class = str_replace('/', '\\', $route);

		if (is_file($file)) {
			include_once($file);

			$this->registry->set(basename($route), new $class($this->registry));
		} else {
			throw new \Exception('Error: Could not load library ' . $route . '!');
		}
	}
	
	public function helper($route) {
		$file = DIR_SYSTEM . 'helper/' . str_replace('../', '', (string)$route) . '.php';

		if (is_file($file)) {
			include_once($file);
		} else {
			throw new \Exception('Error: Could not load helper ' . $route . '!');
		}
	}
	
	public function config($route) {
		$this->registry->get('config')->load($route);
	}

	
	protected function callback($registry, $route) {
		return function($args) use($registry, &$route) {			
			// Trigger the pre events
			$result = $registry->get('event')->trigger('model/' . $route . '/before', array_merge(array(&$route), $args));
			
			if ($result) {
				return $result;
			}
			
			$file = DIR_APPLICATION . 'model/' .  substr($route, 0, strrpos($route, '/')) . '.php';
			$class = 'Model' . preg_replace('/[^a-zA-Z0-9]/', '', substr($route, 0, strrpos($route, '/')));
			$method = substr($route, strrpos($route, '/') + 1);
	
			if (is_file($file)) {
				include_once($file);
			
				$model = new $class($registry);
			} else {
				throw new \Exception('Error: Could not load model ' . substr($route, 0, strrpos($route, '/')) . '!');
			}
			
			if (method_exists($model, $method)) {
				$output = call_user_func_array(array($model, $method), $args);
			} else {
				throw new \Exception('Error: Could not call model/' . $route . '!');
			}
													
			// Trigger the post events
			$result = $registry->get('event')->trigger('model/' . $route . '/after', array_merge(array(&$route, &$output), $args));
			
			if ($result) {
				return $result;
			}
						
			return $output;
		};
	}	
}