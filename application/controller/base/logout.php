<?php
class ControllerBaseLogout extends Controller {
	public function index() {
	    //trigger logUser event
        $this->event->trigger('profile/log',array('log out'));
		$this->user->logout();
		$this->response->redirect($this->url->link('base/login'));
	}
}