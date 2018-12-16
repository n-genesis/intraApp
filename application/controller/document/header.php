<?php
class ControllerDocumentHeader extends Controller {
	public function index() {
        //Header view data
        $view_data['base'] = $this->server;
        $view_data['title'] = $this->document->getTitle();
        $view_data['description'] = $this->document->getDescription();
        $view_data['keywords'] = $this->document->getKeywords();
        $view_data['links'] = $this->document->getLinks();
        $view_data['styles'] = $this->document->getStyles();
        $view_data['scripts'] = $this->document->getScripts();

        return $this->load->view('document/header', $view_data);
	}
}
?>