<?php
class ControllerProfileProfileRecords extends Controller {

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
            $this->document->setTitle('Record Profile: '. $patient_info['fullname']);
            
            /**
             * System notifications
             */
            if($patient_info['status_id'] > 1 && $patient_info['status_id'] < 3){
               $system_notice['events'][] = array('type'=>'warning', 'message'=>'<strong>This profile is marked as  '.$patient_info['status'].'</strong>');
            }elseif($patient_info['status_id'] > 2){
                $system_notice['events'][] = array('type'=>'danger', 'message'=>'<strong>This profile is marked as '.$patient_info['status'].'</strong>');
            }
            
            //Form action
            $view_data['record_action'] = $this->url->link('profile/profile_records/updaterecord');
            
            $view_data['print_action'] = $this->url->link('profile/print_profile','patient_id='.$this->request->get['patient_id']);
            $view_data['print_record_action'] = $this->url->link('profile/print_records','patient_id='.$this->request->get['patient_id']);
            
            //dump notice
            if(!empty($system_notice)){
                $view_data['system_notice'] = $this->load->view('document/notice',$system_notice); 
            }
            
            /**
             * Check if profile in primary policy holder
             * If so use associated insurance information
             * If NOT use policy holder insurance information
             */
            $this->load->model('profile/insurance');
            $patient_insurance = $this->model_profile_patient->getPatientInsurance($this->request->get['patient_id']);
            
            //Check $patient_inser and policy_holder_id
            if(empty($patient_insurance) && !empty($patient_info['policy_holder_id']) && $patient_info['policy_holder_id'] != $this->request->get['patient_id']){
                //If so show template alert
                $policy_holder_info = $this->model_profile_patient->getPolicyHolder($patient_info['policy_holder_id']);
                $patient_insurance = $this->model_profile_patient->getPatientInsurance($patient_info['policy_holder_id']);
                $data['shared_record'] = true;
                $data['policy_holder_name'] = $policy_holder_info['first_name']. ' '.$policy_holder_info['last_name'];
                $data['policy_holder_profile_link'] = $this->url->link('profile/profile_information','patient_id='.$policy_holder_info['patient_id']);
            }
            
            $record = $this->model_profile_insurance->getInsuranceRecord($patient_insurance['insurance_id']);
            //Controller Options
            $view_data['record']  = unserialize($record['record']);

        }else{
            $view_data['system_notice'] = $this->load->view('document/notice');
            $view_data['page_notice'] = 'Oh no, patient profile not found';
        }
        
        
        //Page view data
        $page_data['header'] = $this->load->controller('document/header');
        $page_data['footer'] = $this->load->controller('document/footer');
        $page_data['navigation'] = $this->load->controller('document/navigation');
        
        $page_data['content'][] = $this->load->view('profile/profile_records',$view_data);
        
        $this->response->setOutput($this->load->controller('document/document',$page_data));
	}
    
    public function updateRecord() {
        //Load patient model
        $this->load->model('profile/record');
        
        if($this->model_profile_record->getRecordById($this->request->post['patient_id'])){
            if($this->model_profile_record->editRecord($this->request->post['patient_id'],$this->request->post)){
                $json = array('status'=>'true','response'=>'Profile record updated');
            }else{
                $json = array('status'=>'false','response'=>'Unable to update record. Please try again.');
            }
        }else{
            if($this->model_profile_record->addRecord($this->request->post['patient_id'],$this->request->post)){
                $json = array('status'=>'true','response'=>'Profile record updated');
            }else{
                $json = array('status'=>'false','response'=>'Unable to update record. Please try again.');
            }
        }

        echo json_encode($json);
    }
}