<?php
class ControllerHelpdocProfile extends Controller {

    public function general() {
        //Set header title
        $this->document->setTitle('Help Document');
        
        $view_data['link']['main'] = $this->url->link('helpdoc/main');
        
        $page_data['content'][] = $this->load->view('helpdoc/profile_general',$view_data);
        
        //Add script to footer
        $this->document->addScript('application/view/vendors/featherlight/featherlight.min.js');
        $this->document->addStyle('application/view/vendors/featherlight/featherlight.min.css');
        
        //Page view data
        $page_data['header'] = $this->load->controller('document/header');
        $page_data['footer'] = $this->load->controller('document/footer');
        $page_data['navigation'] = $this->load->controller('document/navigation');
        
        $this->response->setOutput($this->load->controller('document/document',$page_data));

	}
}
?>