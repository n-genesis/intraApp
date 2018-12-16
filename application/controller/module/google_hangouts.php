<?php
class ControllerModuleGoogleHangouts extends Controller {
	private $error = array();

    public function index($value=''){
        
    }
    
	public function settings() {

		$this->document->setTitle('Google Hangouts');

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('google_hangouts', $this->request->post);

			$this->session->data['success'] = '<strong>Extension '.ucwords(str_replace('_', ' ', $this->request->get['extension'])).' succesfuly Updated</strong>';

			$this->response->redirect($this->url->link('extension/extensions'));
		}


		if (isset($this->error['warning'])) {
			$system_notice['events'][] = array('type'=>'danger', 'message'=>'<strong>'.$this->error['warning'].'</strong>');
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['code'])) {
			$data['error_code'] = $this->error['code'];
		} else {
			$data['error_code'] = '';
		}

        
        //dump system notices
        if(!empty($system_notice)){
            $data['system_notice'] = $this->load->view('document/notice',$system_notice);
        }

		$data['action'] = $this->url->link('module/google_hangouts/settings');

		$data['cancel'] = $this->url->link('extension/extensions');

		if (isset($this->request->post['google_hangouts_code'])) {
			$data['google_hangouts_code'] = $this->request->post['google_hangouts_code'];
		} else {
			$data['google_hangouts_code'] = $this->config->get('google_hangouts_code');
		}
        
        
		if (isset($this->request->post['google_hangouts_status'])) {
			$data['google_hangouts_status'] = $this->request->post['google_hangouts_status'];
		} else {
			$data['google_hangouts_status'] = $this->config->get('google_hangouts_status');
		}

	    $page_data['content'][] = $this->load->view('module/google_hangouts', $data);
        
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

		if (!$this->request->post['google_hangouts_code']) {
			$this->error['code'] = 'Code must be enter before saving';
		}

		return !$this->error;
	}
}