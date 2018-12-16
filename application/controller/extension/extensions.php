<?php
class ControllerExtensionExtensions extends Controller {
	private $error = array();

	public function index() {

		$this->document->setTitle('Extensions');

		$this->load->model('extension/extension');

		$this->load->model('extension/module');

		$this->getList();
	}

	public function install() {

		$this->document->setTitle('Installing');

		$this->load->model('extension/extension');

		$this->load->model('extension/module');

		if ($this->validate()) {
			$this->model_extension_extension->install('module', $this->request->get['extension']);

			// Call install method if it exsits
			$this->load->controller('module/' . $this->request->get['extension'] . '/install');

			$this->session->data['success'] = '<strong>Extension '.ucwords(str_replace('_', ' ', $this->request->get['extension'])).' succesfuly installed</strong>';

			$this->response->redirect($this->url->link('extension/extensions'));
		}

		$this->getList();
	}

	public function uninstall() {

		$this->document->setTitle("Uninstalling");

		$this->load->model('extension/extension');

		$this->load->model('extension/module');

		if ($this->validate()) {
			$this->model_extension_extension->uninstall('module', $this->request->get['extension']);

			$this->model_extension_module->deleteModulesByCode($this->request->get['extension']);

			// Call uninstall method if it exsits
			$this->load->controller('module/' . $this->request->get['extension'] . '/uninstall');

			$this->session->data['success'] = '<strong>Extension '.ucwords(str_replace('_', ' ', $this->request->get['extension'])).' succesfuly uninstalled</strong>';

			$this->response->redirect($this->url->link('extension/extensions'));
		}

		$this->getList();
	}

	public function delete() {

		$this->document->setTitle("Deleting");

		$this->load->model('extension/extension');

		$this->load->model('extension/module');

		if (isset($this->request->get['module_id']) && $this->validateDelete()) {
			$this->model_extension_module->deleteModule($this->request->get['module_id']);

			$this->session->data['success'] = ucwords(str_replace('/', ' ', $extension));

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], true));
		}

		$this->getList();
	}

	public function getList() {
	    
        if(isset($this->session->data['success'])){
           $system_notice['events'][] = array('type'=>'success', 'message'=>$this->session->data['success']);
           unset($this->session->data['success']);
        }
        
        if(isset($this->error['warning'])){
            $system_notice['events'][] = array('type'=>'danger', 'message'=>'<strong>'.$this->error['warning'].'</strong>');
        }
        
        
        //dump system notices
        if(!empty($system_notice)){
            $data['system_notice'] = $this->load->view('document/notice',$system_notice);
        }
        
        /**
         * Look into what I can do with this
         */
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['delete'] = $this->url->link('extension/module/delete');

		$extensions = $this->model_extension_extension->getInstalled('module');

		foreach ($extensions as $key => $value) {
			if (!file_exists(DIR_APPLICATION . 'controller/module/' . $value . '.php')) {
				$this->model_extension_extension->uninstall('module', $value);
				unset($extensions[$key]);

				$this->model_extension_module->deleteModulesByCode($value);
			}
		}

		$data['extensions'] = array();

		$files = glob(DIR_APPLICATION . 'controller/module/*.php');

		if ($files) {
			foreach ($files as $file) {
				$extension = basename($file, '.php');


				$module_data = array();

				$modules = $this->model_extension_module->getModulesByCode($extension);

				foreach ($modules as $module) {
					$module_data[] = array(
						'module_id' => $module['module_id'],
						'name'      => $module['name'],
						'edit'      => $this->url->link('module/' . $extension, 'module_id=' . $module['module_id']),
						'delete'    => $this->url->link('extension/extensions/delete', 'module_id=' . $module['module_id'])
					);
				}

				$data['extensions'][] = array(
					'name'      => ucwords(str_replace('_', ' ', $extension)),
					'module'    => $module_data,
					'install'   => $this->url->link('extension/extensions/install', 'extension=' . $extension),
					'uninstall' => $this->url->link('extension/extensions/uninstall', 'extension=' . $extension),
					'installed' => in_array($extension, $extensions),
					'edit'      => $this->url->link('module/' . $extension.'/settings')
				);
			}
		}

		$sort_order = array();

		foreach ($data['extensions'] as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $data['extensions']);

        
        $page_data['content'][] = $this->load->view('extension/extension_list', $data);
        
        //Page view data
        $page_data['header'] = $this->load->controller('document/header');
        $page_data['footer'] = $this->load->controller('document/footer');
        $page_data['navigation'] = $this->load->controller('document/navigation');
                
        $this->response->setOutput($this->load->controller('document/document',$page_data));
	}

	protected function validate() {
		if ($this->user->getUserLevel() < $this->config->get('administrator')) {
			$this->error['warning'] = 'User does not permission to take this action';
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if ($this->user->getUserLevel() < $this->config->get('administrator')) {
			$this->error['warning'] = 'User does not permission to delete this extension';
		}

		return !$this->error;
	}
}
