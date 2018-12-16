<?php
class ControllerModuleNotifications extends Controller {
    
    public function index($value=''){
        echo "Hello World";
    }
    
    public function dashboard(){
        return $this->load->view('module/notifications_dashboard');
    }
}
?>