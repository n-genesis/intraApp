<?php
class ControllerHelpdocMain extends Controller {

    public function index() {
        //Load patient model
        $this->load->model('profile/patient');
        //Set header title
        $this->document->setTitle('Help Document');
        
        $view_data['link']['main'] = $this->url->link('helpdoc/main');
        $view_data['link']['general'] = $this->url->link('helpdoc/profile/general');
        $page_data['content'][] = $this->load->view('helpdoc/main',$view_data);
        
        //Page view data
        $page_data['header'] = $this->load->controller('document/header');
        $page_data['footer'] = $this->load->controller('document/footer');
        $page_data['navigation'] = $this->load->controller('document/navigation');
                
        $this->response->setOutput($this->load->controller('document/document',$page_data));

	}
}
?>