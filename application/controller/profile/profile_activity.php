<?php
class ControllerProfileProfileActivity extends Controller {

    public function index() {
        //Load patient model
        $this->load->model('profile/profile_activity');
        $this->load->model('profile/patient');
        
        if(isset($this->request->get['patient_id']) && ($patient_info = $this->model_profile_patient->getPatientById($this->request->get['patient_id'])) && $this->user->getUserLevel() >= $this->config->get('moderator')){
            
            //Get profile information
            $profile_data['patient_info'] = $patient_info;
            
            //Set header title
            $this->document->setTitle('Profile Activity For: '.$patient_info['fullname']);
            
            if (isset($this->request->get['page'])) {
                $page = $this->request->get['page'];
            } else {
                $page = 1;
            }
            
            //Profile links
            $profile_data['link']['general'] = $this->url->link('profile/profile_information','patient_id='.$this->request->get['patient_id']);
            $profile_data['link']['insurance_policy'] = $this->url->link('profile/profile_insurance_policy','patient_id='.$this->request->get['patient_id']);
            $profile_data['link']['employer'] = $this->url->link('profile/profile_employer','patient_id='.$this->request->get['patient_id']);
            $profile_data['link']['records'] = $this->url->link('profile/profile_records','patient_id='.$this->request->get['patient_id']);
            $profile_data['link']['notes_action'] = $this->url->link('profile/profile_notes_action','patient_id='.$this->request->get['patient_id']);
            
            //Form action
            $profile_data['title'] = $patient_info['fullname'].'\'s Profile Activity';
            
            $filter = array(
                'patient_id' => $this->request->get['patient_id'],
                'start' => ($page - 1) * $this->config->get('config_limit'),
                'limit' => $this->config->get('config_limit')
            );
            
            //profile activity
            $profile_data['profile_activity'] = $this->model_profile_profile_activity->getActivity($filter);
            
            $pagination = new Pagination();
            $pagination->total = $this->model_profile_profile_activity->numActivity($this->request->get['patient_id']);
            $pagination->page = $page;
            $pagination->limit = $this->config->get('config_limit');
            $pagination->url = $this->url->link('profile/profile_activity', 'patient_id='.$this->request->get['patient_id'] . '&page={page}');
    
            $profile_data['pagination'] = $pagination->render();
            
        }else{
            $this->response->redirect($this->url->link('profile/profile_information','patient_id='.$this->request->get['patient_id']));
            $profile_data['page_notice'] = 'Oh no, profile activity not found';
        }
        
        //Page view data
        $page_data['header'] = $this->load->controller('document/header');
        $page_data['footer'] = $this->load->controller('document/footer');
        $page_data['navigation'] = $this->load->controller('document/navigation');
        
        $page_data['content'][] = $this->load->view('profile/profile_activity',$profile_data);
        
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