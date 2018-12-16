<?php
class ControllerDocumentFooter extends Controller {
    /**
     * Note: When adding a script to the footer
     * template the method `addScript()` must come
     * before the instantiation of the to footer controller
     */
	public function index() {
        //footer view data
        $view_data['scripts'] = $this->document->getScripts();
        
        return $this->load->view('document/footer', $view_data);
	}
}
?>