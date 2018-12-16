<?php
class ControllerProfileProfileEmployer extends Controller {

    public function index() {
        //Load patient model
        $this->load->model('profile/patient');
        
        $patient_info = $this->model_profile_patient->getPatientById($this->request->get['patient_id']);
        
        if(isset($this->request->get['patient_id']) && $patient_info){
            
            //Profile links
            $view_data['link']['general'] = $this->url->link('profile/profile_information','patient_id='.$this->request->get['patient_id']);
            $view_data['link']['insurance_policy'] = $this->url->link('profile/profile_insurance_policy','patient_id='.$this->request->get['patient_id']);
            $view_data['link']['employer'] = $this->url->link('profile/profile_employer','patient_id='.$this->request->get['patient_id']);
            $view_data['link']['records'] = $this->url->link('profile/profile_records','patient_id='.$this->request->get['patient_id']);
            $view_data['link']['notice_action'] = $this->url->link('profile/profile_notes_action','patient_id='.$this->request->get['patient_id']);
            
            //Get profile information
            $view_data['patient_info'] = $patient_info;
            
            //Set page title
            $this->document->setTitle('Employer Profile: '. $patient_info['fullname']);
            
            if($patient_info['status_id'] > 1 && $patient_info['status_id'] < 3){
               $system_notice['events'][] = array('type'=>'warning', 'message'=>'<strong>This profile is marked as '.$patient_info['status'].'</strong>');
            }elseif($patient_info['status_id'] > 2){
                $system_notice['events'][] = array('type'=>'danger', 'message'=>'<strong>This profile is marked as '.$patient_info['status'].'</strong>');
            }
            
            $view_data['print_action'] = $this->url->link('profile/print_profile','patient_id='.$this->request->get['patient_id']);
            
            //Get employer information
            $this->load->model('profile/employer');
            $employer_info = $this->model_profile_employer->getPatientEmployer($patient_info['patient_id']);
            $view_data['employer_info'] = $employer_info;
            
            //Form action
            $view_data['employer_action'] = $this->url->link('profile/profile_employer/updateEmployer');
            $view_data['employer_search_action'] = $this->url->link('profile/profile_employer/findEmployer');
            //Controller
            $view_data['remover_employer_action'] = $this->url->link('profile/profile_employer/removeEmployer');
            
            //dump notice
            if(!empty($system_notice)){
               $view_data['system_notice'] = $this->load->view('document/notice',$system_notice); 
            }         
            
        }else{
            $view_data['system_notice'] = $this->load->view('document/notice');
            $view_data['page_notice'] = 'Oh no, patient profile not found';
        }

        //Page view data
        $page_data['header'] = $this->load->controller('document/header');
        $page_data['footer'] = $this->load->controller('document/footer');
        $page_data['navigation'] = $this->load->controller('document/navigation');
        
        $page_data['content'][] = $this->load->view('profile/profile_employer',$view_data);
        
        $this->response->setOutput($this->load->controller('document/document',$page_data));

	}
    
    public function updateEmployer() {
        //Load patient model
        $this->load->model('profile/employer');
        
        $employer_info = $this->model_profile_employer->getEmployerById($this->request->post['employer_id']);
        //Remove employer row for patient
        if (!empty($this->request->post['patient_id']) || !empty($this->request->post['employer_id'])) {
            if($this->model_profile_employer->updatePatientEmployer($this->request->post['patient_id'],$this->request->post['employer_id'])){
                $json = array('status'=>'true','response'=>'Profile employer updated.','employer_data'=> $employer_info);
            }else{
                $json = array('status'=>'false','response'=>'All form fields must be fill in.');
            }
        }
        echo json_encode($json);
    }

    public function removeEmployer() {
        //Load patient model
        $this->load->model('profile/employer');

        //Remove employer row for patient
        if (!empty($this->request->post['patient_id'])) {
            if($this->model_profile_employer->removePatientEmployer($this->request->post['patient_id'])){
                $json = array('status'=>'true','response'=>'Employer record cleared.');
            }else{
                $json = array('status'=>'false','response'=>'All form fields must be fill in.');
            }
        }
        echo json_encode($json);
    }
    
    public function findEmployer() {
        //Load patient and insurance model
        $this->load->model('profile/patient');
        $this->load->model('profile/employer');
        if(!empty($this->request->post['name']) || !empty($this->request->post['group_id'])){
            if(($employer_info = $this->model_profile_employer->employerExists($this->request->post))){
                $json = array('status'=>'true','action'=>'found','response'=>'<strong>Name: '.$employer_info['name'].'</strong> <br /> Group ID: '.$employer_info['group_id'],'employer_data'=> $employer_info);
            }else{
                $json = array('status'=>'true','action'=>'notfound','response'=>'No insurance entries match the search query');
            }
        }else{
            $json = array('status'=>'false','response'=>'A search query must be entered');
        }
        echo json_encode($json);
    }
    
    public function getSearchInfo(){
        //Load patient model
        $this->load->model('profile/patient');
        $search = $this->model_profile_patient->search('employer',$this->request->get['for'],$this->request->get['search']);
        //Work with results to format a usable JSON
        $group = array();
        foreach ($search as $array) {
            foreach ($array as $value) {
               $group[] = $value; 
            }
             
        }
        echo json_encode($group);
    }

}
?>