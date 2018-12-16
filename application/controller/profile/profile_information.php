<?php
class ControllerProfileProfileInformation extends Controller {

    public function index() {
        //Load patient model
        $this->load->model('profile/patient');
        
        if(isset($this->request->get['patient_id']) && ($patient_info = $this->model_profile_patient->getPatientById($this->request->get['patient_id']))){
            
            //Get profile information
            $profile_data['patient_info'] = $patient_info;
            
            //Set header title
            $this->document->setTitle('Profile: '.$patient_info['fullname']);
            
            /**
             * Add profile to session for previously view controller
             */
            if(isset($this->session->data['profile'])){
                $stored = false;
                foreach ($this->session->data['profile'] as $value) {
                    if($value['patient_id'] == $patient_info['patient_id']){
                        $stored = true;
                        break;
                    }  
                }
                if(!$stored){
                    $this->session->data['profile'][] = array(
                        'patient_id' => $patient_info['patient_id'],
                        'image' => $patient_info['image'],
                        'name' => $patient_info['first_name'].' '.$patient_info['last_name'],
                        'ssn' => $patient_info['ssn']
                    );
                }
                }else{
                    $this->session->data['profile'][] = array(
                        'patient_id' => $patient_info['patient_id'],
                        'image' => $patient_info['image'],
                        'name' => $patient_info['first_name'].' '.$patient_info['last_name'],
                        'ssn' => $patient_info['ssn']
                    );    
            }
            /**
             * System notifications
             */    
            if($patient_info['status_id'] > 1 && $patient_info['status_id'] < 3){
               $system_notice['events'][] = array('type'=>'warning', 'message'=>'<strong>This profile is marked as  '.$patient_info['status'].'</strong>');
            }elseif($patient_info['status_id'] > 2){
                $system_notice['events'][] = array('type'=>'danger', 'message'=>'<strong>This profile is marked as '.$patient_info['status'].'</strong>');
            }
            
            //Profile menu action
            $profile_data['print_action'] = $this->url->link('profile/print_profile','patient_id='.$this->request->get['patient_id']);
            
            //admin level menu actions
            if($this->user->getUserLevel() >= $this->config->get('moderator')){
                $profile_data['profile_activity'] = $this->url->link('profile/profile_activity','patient_id='.$this->request->get['patient_id']);
                $profile_data['profile_status'] = $this->url->link('profile/events/changestatus');
            }
            
            //Profile links
            $profile_data['link']['general'] = $this->url->link('profile/profile_information','patient_id='.$this->request->get['patient_id']);
            $profile_data['link']['insurance_policy'] = $this->url->link('profile/profile_insurance_policy','patient_id='.$this->request->get['patient_id']);
            $profile_data['link']['employer'] = $this->url->link('profile/profile_employer','patient_id='.$this->request->get['patient_id']);
            $profile_data['link']['records'] = $this->url->link('profile/profile_records','patient_id='.$this->request->get['patient_id']);
            $profile_data['link']['notes_action'] = $this->url->link('profile/profile_notes_action','patient_id='.$this->request->get['patient_id']);
            
            //Form action
            $profile_data['patient_contact_action'] = $this->url->link('profile/profile_information/updatepatientcontact');
            $profile_data['patient_basic_info_action'] = $this->url->link('profile/profile_information/updatepatientbasicinfo');
            $profile_data['patient_info_action'] = $this->url->link('profile/profile_information/updatepatientinfo');
            
            //dump system notices
            if(!empty($system_notice)){
               $profile_data['system_notice'] = $this->load->view('document/notice',$system_notice); 
            }
            
            //Get profile notes
            $profile_data['patient_info']['patient_note'] = $this->load->controller('profile/profile_notes_action/latestNote',array('patient_id'=>$patient_info['patient_id']));
            
            
        }else{
            $profile_data['page_notice'] = 'Oh no, patient profile not found';
        }
        
        
        //Page view data
        $page_data['header'] = $this->load->controller('document/header');
        $page_data['footer'] = $this->load->controller('document/footer');
        $page_data['navigation'] = $this->load->controller('document/navigation');
        
        $page_data['content'][] = $this->load->view('profile/profile_information',$profile_data);
        
        $this->response->setOutput($this->load->controller('document/document',$page_data));

	}

    public function updatePatientBasicInfo() {
        //Load patient model
        $this->load->model('profile/patient');
        
        if (!empty($this->request->post['first_name']) && !empty($this->request->post['last_name']) && !empty($this->request->post['dob']) && !empty($this->request->post['ssn']) && !empty($this->request->post['patient_id'])) {
            if($this->model_profile_patient->editPatient($this->request->post['patient_id'],$this->request->post)){
               $json = array('status'=>'true','response'=>'Profile information updated');
               
               $patient_info = $this->model_profile_patient->getPatientById($this->request->post['patient_id']);
               //trigger logUserActivity event
               $this->event->trigger('profile/activity',array('Edited basic info for Profile ID['. $this->request->post['patient_id'] .'] : '.$patient_info['fullname'],$this->request->post['patient_id']));
               
            }else{
                $json = array('status'=>'false','response'=>"Unable to update profile info. Please try again");
            }
        }else{
            $json = array('status'=>'false','response'=>"The name, dob, and ssn fields must be filled in.");
        }
        echo json_encode($json);

    }
    
    public function updatePatientContact() {
        //Load patient model
        $this->load->model('profile/patient');
        
        
        if (!empty($this->request->post['address']) && !empty($this->request->post['city']) && !empty($this->request->post['state']) && !empty($this->request->post['zipcode']) && !empty($this->request->post['phone']) && !empty($this->request->post['email']) && !empty($this->request->post['patient_id'])) {
            if($this->model_profile_patient->editPatientContact($this->request->post['patient_id'],$this->request->post)){
               $json = array('status'=>'true','response'=>'Profile contact information updated');
                
               $patient_info = $this->model_profile_patient->getPatientById($this->request->post['patient_id']);
               //trigger logUserActivity event
               $this->event->trigger('profile/activity',array('Edited contact info for Profile ID['. $this->request->post['patient_id'] .'] : '.$patient_info['fullname'],$this->request->post['patient_id']));
               
            }else{
                $json = array('status'=>'false','response'=>"Unable to update profile info. Please try again");
            }
             
            
        }else{
            $json = array('status'=>'false','response'=>"The phone, email, and address fields must be filled in.");
        }
        echo json_encode($json);

    }

    public function updatePatientInfo() {
        //Load patient model
        $this->load->model('profile/patient');
        $patient_info = $this->model_profile_patient->getPatientById($this->request->post['patient_id']);
        
        if (!empty($this->request->post['spoke_to']) && !empty($this->request->post['verified_by']) && !empty($this->request->post['ref_number']) && !empty($this->request->post['patient_id'])) {
            if($this->model_profile_patient->getPatientInfo($this->request->post['patient_id'])){
                if($this->model_profile_patient->editPatientInfo($this->request->post['patient_id'],$this->request->post)){
                   $json = array('status'=>'true','response'=>'Profile patient information updated');
                    
                    //trigger logUserActivity event
                    $this->event->trigger('profile/activity',array('Edited patient info for Profile ID['. $this->request->post['patient_id'] .'] : '.$patient_info['fullname'],$this->request->post['patient_id']));
                    
                }else{
                    $json = array('status'=>'false','response'=>"Unable to update profile info. Please try again");
                }
            }else{
                if($this->model_profile_patient->insertPatientInfo($this->request->post['patient_id'],$this->request->post)){
                    $json = array('status'=>'true','response'=>'Profile patient information updated');  
                    
                    //trigger logUserActivity event
                    $this->event->trigger('profile/activity',array('Created patient info for Profile ID['. $this->request->post['patient_id'] .'] : '.$patient_info['fullname'],$this->request->post['patient_id']));
                    
                }else{
                    $json = array('status'=>'false','response'=>"Unable to update profile info. Please try again");
                }
            }
        }elseif(empty($this->request->post['spoke_to']) && empty($this->request->post['verified_by']) && empty($this->request->post['ref_number']) && !empty($this->request->post['patient_id'])){
            $this->model_profile_patient->deletePatientInfo($this->request->post['patient_id']);
            $json = array('status'=>'true','response'=>'Profile information Removed'); 
            
            //trigger logUserActivity event
            $this->event->trigger('profile/activity',array('Removed patient info for Profile ID['. $this->request->post['patient_id'] .'] : '.$patient_info['fullname'],$this->request->post['patient_id']));
            
        }
        echo json_encode($json);

    }
}
?>