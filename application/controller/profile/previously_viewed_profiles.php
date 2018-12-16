<?php
class ControllerProfilePreviouslyViewedProfiles extends Controller {
    
    public function index() {
        $this->document->setTitle('Previously Viewed Profiles');
        
        //Page view data
        $page_data['header'] = $this->load->controller('document/header');
        $page_data['footer'] = $this->load->controller('document/footer');
        $page_data['navigation'] = $this->load->controller('document/navigation');
        
        //Load search model
        $this->load->model('profile/patient');
        
        if(isset($this->session->data['profile'])){
            $patient_array = array();
            $profiles = array_reverse($this->session->data['profile']);
            foreach ($profiles as $value) {
                $patient_array['previously_viewed'][] = $this->model_profile_patient->getPatientById($value['patient_id']);
            }
        }else{
            $patient_array['previously_viewed'] = array();
        }
        $patient_array['profile_link'] = $this->url->link('profile/profile_information','patient_id=');
        $page_data['content'][] = $this->load->view('profile/previously_viewed_profiles',$patient_array);
        
        $this->response->setOutput($this->load->controller('document/document',$page_data));
    }

}
?>