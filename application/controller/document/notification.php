<?php
class ControllerDocumentNotification extends Controller {
	public function index() {
	    return $this->load->view('document/notification');
	}
}