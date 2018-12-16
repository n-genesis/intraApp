<?php
class ControllerErrorNotFound extends Controller {
	public function index() {
	    //Set header values
        $this->document->setTitle('Page not found');
        
        //Page view data
        $page_data['header'] = $this->load->controller('document/header');
        $page_data['footer'] = $this->load->controller('document/footer');
        $page_data['navigation'] = $this->load->controller('document/navigation');

        $error_data['page_notice'] = "<code>[".(isset($this->request->get['route'])?$this->request->get['route']:'Router Not Given')."]Controller Not found</code>";
        $error_data['button_link'] = (isset($this->request->server['HTTP_REFERER'])?$this->request->server['HTTP_REFERER']:$this->url->link('dashboard/dashboard'));
        
        $page_data['content'][] = $this->load->view('error/not_found',$error_data);

        $this->response->setOutput($this->load->controller('document/document',$page_data));

	}
}
?>