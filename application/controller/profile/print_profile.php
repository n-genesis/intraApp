<?php
class ControllerProfilePrintProfile extends Controller {

    public function index() {
        $data['base'] = $this->server;
        //Load patient model
        $this->load->model('profile/patient');
        $this->load->model('profile/employer');
        $this->load->model('profile/notes');
        
        if(isset($this->request->get['patient_id'])){
            $patient_info = $this->model_profile_patient->getPatientById($this->request->get['patient_id']);
            $patient_gen_info = $this->model_profile_patient->getPatientInfo($this->request->get['patient_id']);
            $employer_info = $this->model_profile_employer->getPatientEmployer($this->request->get['patient_id']);
            $insurance_info = $this->model_profile_patient->getPatientInsurance($this->request->get['patient_id']);
            if(empty($insurance_info)){
                $insurance_info = $this->model_profile_patient->getPatientInsurance($patient_info['policy_holder_id']);
            }
            $shared_policy_holders = $this->model_profile_patient->getPatientsPolicyHolders($this->request->get['patient_id']);
            $note_info = $this->model_profile_notes->getLatestNote($this->request->get['patient_id']);
            
            //Set header title
            $data['title'] = 'Print Profile: '.$patient_info['fullname'];
            //Get profile, employer, and insurance information
            $data['patient_info'] = $patient_info;
            $data['patient_gen_info'] = $patient_gen_info;
            $data['employer_info'] = $employer_info;
            $data['insurance_info'] = $insurance_info;
            $policy_holder_info = $this->model_profile_patient->getPolicyHolder($patient_info['policy_holder_id']);
            $data['policy_holder_info'] = $policy_holder_info;
            $data['sharded_policy_holders'] = $shared_policy_holders;
            $data['shared_profile_link'] = $profile_data['print_action'] = $this->url->link('profile/profile_information','patient_id=');
            $data['profile_note'] = $note_info;
            
            $this->response->setOutput($this->load->view('profile/print_profile',$data));
        }else{
            
        }

	}
}
?>