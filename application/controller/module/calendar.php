<?php
class ControllerModuleCalendar extends Controller {
    
    public function index(){
        //Set header title
        $this->document->setTitle('Calendar');
        
        $page_data['content'][] = $this->load->view('module/calendar');
        
        //Add script and styles
        $this->document->addStyle('application/view/vendors/bower_components/fullcalendar/dist/fullcalendar.min.css');
        $this->document->addScript('application/view/vendors/bower_components/moment/min/moment.min.js');
        $this->document->addScript('application/view/vendors/bower_components/fullcalendar/dist/fullcalendar.min.js');
        $this->document->addScript('application/view/js/sandbox/calendar.js');
        
        
        //Page view data
        $page_data['header'] = $this->load->controller('document/header');
        $page_data['footer'] = $this->load->controller('document/footer');
        $page_data['navigation'] = $this->load->controller('document/navigation');
        
        $this->response->setOutput($this->load->controller('document/document',$page_data));
    }
    
    public function dashboard(){
        $data['view_events'] = $this->url->link('module/calendar');
        
        return $this->load->view('module/calendar_dashboard',$data);
    }
}
?>