<?php
class ControllerOnstartupLogin extends Controller {
	public function index() {

		$route = isset($this->request->get['route']) ? $this->request->get['route'] : '';

		$ignore = array(
			'base/login',
			'base/logout',
			'base/login/validate',
			'error/not_found'
		);

		// User
		$this->registry->set('user', new User\User($this->registry));
        
        
		if (!$this->user->isLogged() && !in_array($route, $ignore)) {
			return new Action('base/login');
		}
        
	}
}