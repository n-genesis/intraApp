<?php
class ControllerDocumentDocument extends Controller {
	public function index($parameter_data = array()) {
        $data['notification'] = $this->load->controller('document/notification');
        $data['previously_viewed'] = $this->load->controller('document/previously_viewed');
        
        $data['logout'] = $this->url->link('base/logout');
        $data['dashboard'] = $this->url->link('dashboard/dashboard');
        
        //data for the view
        $data['base'] = $this->server;
        $data['title'] = $this->document->getTitle();
        $data['description'] = $this->document->getDescription();
        $data['keywords'] = $this->document->getKeywords();
        $data['links'] = $this->document->getLinks();
        $data['styles'] = $this->document->getStyles();
        $data['scripts'] = $this->document->getScripts();
        
        //Merge parameter data to send to view
        $view_data = array_merge($data,$parameter_data);
        
        return $this->load->view('document/document', $view_data);
	}
}
?>