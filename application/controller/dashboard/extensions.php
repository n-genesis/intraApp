<?php
class ControllerDashboardExtensions extends Controller {
	public function index() {
	    
        $this->load->model('extension/extension');
        
        $extensions = $this->model_extension_extension->getInstalled('module');

        foreach ($extensions as $key => $value) {
            
            if (file_exists(DIR_APPLICATION . 'controller/module/' . $value . '.php')) {
             
                $dashboard_method[] = $this->load->controller('module/'. $value.'/dashboard');
                
            }
        }
        return array_filter($dashboard_method);
    }
}
