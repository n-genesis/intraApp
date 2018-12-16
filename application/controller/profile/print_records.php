<?php
class ControllerProfilePrintRecords extends Controller {

    public function index() {
        $data['base'] = $this->server;
        //Load patient model
        $this->load->model('profile/patient');
        
        if(isset($this->request->get['patient_id']) && ($patient_info = $this->model_profile_patient->getPatientById($this->request->get['patient_id']))){
            //Get profile information
            $data['patient_info'] = $patient_info;
            
            //Get insurance information
            //$insurance_info = $this->model_profile_patient->getPatientInsurance($patient_info['insurance_id']);
            //$data['insurance_info'] = $insurance_info;
            
            $policy_holder_info = $this->model_profile_patient->getPolicyHolder($patient_info['policy_holder_id']);
            $data['policy_holder_info'] = $policy_holder_info;
            
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
                $patient_insurance = $this->model_profile_patient->getPatientInsurance($patient_info['policy_holder_id']);
                $data['shared_record'] = true;
                $data['policy_holder_name'] = $policy_holder_info['first_name']. ' '.$policy_holder_info['last_name'];
                $data['policy_holder_profile_link'] = $this->url->link('profile/profile_information','patient_id='.$policy_holder_info['patient_id']);
            }
            
            $record = $this->model_profile_insurance->getInsuranceRecord($patient_insurance['insurance_id']);
            //Controller Options
            $data['record']  = unserialize($record['record']);
            
            $this->response->setOutput($this->load->view('profile/print_records',$data));
        }else{
            
        }

	}
    
}
?>