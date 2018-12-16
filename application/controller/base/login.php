<?php
class ControllerBaselogin extends Controller {

    public function index() {
	    $data['base'] = $this->server;
        $data['description'] = $this->document->getDescription();
        $data['keywords'] = $this->document->getKeywords();
        $data['links'] = $this->document->getLinks();
        $data['styles'] = $this->document->getStyles();
        $data['scripts'] = $this->document->getScripts();
        
        $data['action'] = $this->url->link('base/login/validate');
        $data['version'] = VERSION;
        
        $this->response->setOutput($this->load->view('document/login',$data));

	}
    
    public function validate() {
        if (!empty($this->request->post['username']) && !empty($this->request->post['user_password']) && $this->user->login($this->request->post['username'], html_entity_decode($this->request->post['user_password'], ENT_QUOTES, 'UTF-8'))) {
            $json = array('status'=>'true','response'=>"Logging In",'location'=>$this->url->link('dashboard/dashboard'));
            //trigger logUser event
            $this->event->trigger('profile/log',array('login'));
        }elseif(!isset($this->request->post['username']) && !isset($this->request->post['user_password']) && $this->user->login($this->config->get('default_user'), html_entity_decode($this->config->get('default_passwrd'), ENT_QUOTES, 'UTF-8'))) {
            $json = array('status'=>'true','response'=>"Logging In",'location'=>$this->url->link('dashboard/dashboard'));
            //trigger logUser event
            $this->event->trigger('profile/log',array('login'));
        }else{
            $json = array('status'=>'false','response'=>"Username or Password not correct");
        }

        echo json_encode($json);
    }
}
?>