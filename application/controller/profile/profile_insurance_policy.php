<?php
class ControllerProfileProfileInsurancePolicy extends Controller {

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
            $this->document->setTitle('Insurance Profile: '. $patient_info['fullname']);
            
            /**
             * System notifications
             */
            if($patient_info['status_id'] > 1 && $patient_info['status_id'] < 3){
               $system_notice['events'][] = array('type'=>'warning', 'message'=>'<strong>This profile is marked as  '.$patient_info['status'].'</strong>');
            }elseif($patient_info['status_id'] > 2){
                $system_notice['events'][] = array('type'=>'danger', 'message'=>'<strong>This profile is marked as '.$patient_info['status'].'</strong>');
            }
            
            $view_data['print_action'] = $this->url->link('profile/print_profile','patient_id='.$this->request->get['patient_id']);
            
            //Get insurance information
            $insurance_info = $this->model_profile_patient->getPatientInsurance($patient_info['patient_id']);
            $view_data['insurance_info'] = $insurance_info;
            
            //Form action
            $view_data['patient_insurance_action'] = $this->url->link('profile/profile_insurance_policy/updatepatientinsurance');
            $view_data['insurance_search_action'] = $this->url->link('profile/profile_insurance_policy/findinsurance');
            
            //controller
            $view_data['remove_insurace'] = $this->url->link('profile/profile_insurance_policy/removeinsurance');
            
            //Get Policy holder
            $view_data['patient_make_primary'] = $this->url->link('profile/profile_insurance_policy/makepatientprimary');
            $view_data['policy_action'] = $this->url->link('profile/profile_insurance_policy/updatepolicydate');
            $view_data['policy_change'] = $this->url->link('profile/profile_insurance_policy/searchforpatient');
            $view_data['policy_remove'] = $this->url->link('profile/profile_insurance_policy/removepolicy');
            $view_data['new_claim'] = $this->url->link('profile/profile_insurance_policy/newclaimform');
            
            $policy_holder_info = $this->model_profile_patient->getPolicyHolder($patient_info['policy_holder_id']);
            $view_data['policy_holder_info'] = $policy_holder_info;
            
            $view_data['policy_claims'] = $this->load->controller('profile/profile_policy_claims',array('policy_holder_id'=>$patient_info['policy_holder_id']));
             
            //dump notice
            if(!empty($system_notice)){
               $view_data['system_notice'] = $this->load->view('document/notice',$system_notice); 
            }         
            
        }else{
            $view_data['system_notice'] = $this->load->view('document/notice');
            $view_data['page_notice'] = 'Oh no, patient profile not found';
        }
        
        if (isset($this->request->get['profile_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
        }
        
        //Page view data
        $page_data['header'] = $this->load->controller('document/header');
        $page_data['footer'] = $this->load->controller('document/footer');
        $page_data['navigation'] = $this->load->controller('document/navigation');
        
        $page_data['content'][] = $this->load->view('profile/profile_insurance_policy',$view_data);
        
        $this->response->setOutput($this->load->controller('document/document',$page_data));

	}
    
    public function updatePatientInsurance() {
        //Load patient and insurance model
        $this->load->model('profile/patient');
        $this->load->model('profile/insurance');
        $patient_info = $this->model_profile_patient->getPatientById($this->request->post['patient_id']);
        $insurance_info = $this->model_profile_insurance->getInsuranceById($this->request->post['insurance_id']);
if(!empty($this->request->post['insurance_id'])){
    
                $this->model_profile_patient->updatePatientInsurance($this->request->post['patient_id'],$this->request->post['insurance_id']);
                
                //trigger logUserActivity event
                $this->event->trigger('profile/activity',array('Added insurace ['.$insurance_info['name'].'] to Profile ID['. $this->request->post['patient_id'] .'] : '.$patient_info['fullname'],$this->request->post['patient_id']));
                
                $json = array('status'=>'true','response'=>'You would like to update profile insurace information.','action'=>'exists','title'=>'Are you Sure?','controller'=>$this->url->link('profile/profile_insurance_policy/updateinsurance'),'insurance_id'=>$insurance_info['insurance_id']);
            
        }else{
            $json = array('status'=>'false','response'=>'For profile with no insurace info use the search feature.');
        }
        echo json_encode($json);
    }

    public function updateInsurance() {
        //Load patient model
        $this->load->model('profile/patient');
        if(!empty($this->request->post)){
            /**Check if insurance data exists
            if($this->model_profile_patient->editInsurance($this->request->post['insurance_id'],$this->request->post)){
                $json = array('status'=>'true','response'=>'Insurance information updated','insurance_id'=>$this->request->post['insurance_id']);
            }else{
                $json = array('status'=>'false','response'=>'Unable to update insurance information. Please try again.');
            }
             **/
             $json = array('status'=>'true','response'=>'Insurance information updated','insurance_id'=>$this->request->post['insurance_id']);
        }else{
            //Make sure to look and this condition
        }
        echo json_encode($json);
    }
    
    public function findInsurance() {
        //Load patient and insurance model
        $this->load->model('profile/patient');
        $this->load->model('profile/insurance');
        if(!empty($this->request->post['name']) || !empty($this->request->post['payor_id']) || $this->request->post['ins_id']){
            if(($insuracne_info = $this->model_profile_insurance->insuranceExists($this->request->post))){
                $json = array('status'=>'true','action'=>'found','response'=>'<strong>Name: '.$insuracne_info['name'].'</strong> <br /> Payor ID: '.$insuracne_info['payor_id'].' <br /> Ins Co ID: '.$insuracne_info['ins_id'],'insure_data'=> $insuracne_info);
            }else{
                $json = array('status'=>'true','action'=>'notfound','response'=>'No insurance entries match the search query');
            }
        }else{
            $json = array('status'=>'false','response'=>'A search query must be entered');
        }
        echo json_encode($json);
    }
    
    public function removeInsurance(){
        //Load patient and insurance model
        $this->load->model('profile/patient');
        $this->load->model('profile/insurance');
        $patient_info = $this->model_profile_patient->getPatientById($this->request->post['patient_id']);
        
        if(!empty($this->request->post['patient_id'])){
            if(($insurance_id = $this->model_profile_patient->removePatientInsurance($this->request->post['patient_id']))){
                $insurance = $this->model_profile_insurance->getInsuranceById($insurance_id);
                $json = array('status'=>'true','response'=>'Pantient insurace record cleared.');
                //trigger logUserActivity event
                $this->event->trigger('profile/activity',array('Removed insurance ['.$insurance['name'].'] for Profile ID['. $this->request->post['patient_id'] .'] : '.$patient_info['fullname'],$this->request->post['patient_id']));
            }else{
                $json = array('status'=>'true','action'=>'notfound','response'=>'Unable to clear insurance record');
            }
        }else{
            $json = array('status'=>'false','response'=>'An error occurred. Please try again.');
        }
        echo json_encode($json);
    }
    
    /**
     * Search for insurance name, and ID's
     */
    public function getSearchInfo(){
        //Load patient model
        $this->load->model('profile/patient');
        $search = $this->model_profile_patient->search('insurance',$this->request->get['for'],$this->request->get['search']);
        //Check if returned query is an array
        if(is_array($search)){
            //Work with results to format a usable JSON
            $group = array();
            foreach ($search as $array) {
                foreach ($array as $value) {
                   $group[] = $value; 
                }
            }
            //Remove duplicate values
            $group = array_unique($group);
            echo json_encode($group);
        }
    }

    public function makePatientPrimary() {
        //Load patient model
        $this->load->model('profile/patient');

        if(!empty($this->request->post)){
            //Check if insurance data exists
            if($this->model_profile_patient->updatePolicy($this->request->post['patient_id'],$this->request->post['insurance_id'])){
                $policy_holder_id = $this->model_profile_patient->getPatientById($this->request->post['patient_id']);
                $json = array('status'=>'true','response'=>'Policy information updated','form_data'=>$this->model_profile_patient->getPolicyHolder($policy_holder_id['policy_holder_id']));
            }else{
                $json = array('status'=>'false','response'=>'Unable to update policy information. Please try again.');
            }
        }else{
            
        }
        echo json_encode($json);
    }
    
    public function updatePolicyDate() {
        //Load patient model
        $this->load->model('profile/patient');

        if(!empty($this->request->post['patient_id'])){
            //Check if insurance data exists
            if($this->model_profile_patient->updatePolicyDate($this->request->post['patient_id'],$this->request->post['policy_eff_date'])){
                $json = array('status'=>'true','response'=>'Policy date updated');
            }else{
                $json = array('status'=>'false','response'=>'Unable to update policy date. Please try again.');
            }
        }else{
            
        }
        echo json_encode($json);
    }
    

    public function updatePolicyHolder() {
        //Load patient model
        $this->load->model('profile/patient');

        if(!empty($this->request->post['patient_id']) && !empty($this->request->post['policy_holder_id'])){
            //Check if insurance data exists
            if($this->model_profile_patient->updatePolicy($this->request->post['patient_id'],$this->request->post['policy_holder_id'])){
                $policy_holder_id = $this->model_profile_patient->getPatientById($this->request->post['patient_id']);
                $json = array('status'=>'true','response'=>'Policy information updated','form_data'=>$this->model_profile_patient->getPolicyHolder($policy_holder_id['policy_holder_id']));
            }else{
                $json = array('status'=>'false','response'=>'Unable to update policy information. Please try again.');
            }
        }else{
            
        }
        echo json_encode($json);
    }
    
    public function removePolicy() {
        //Load patient model
        $this->load->model('profile/patient');

        if(!empty($this->request->post['patient_id'])){
            //Check if insurance data exists
            if($this->model_profile_patient->updatePolicy($this->request->post['patient_id'],0)){
                $json = array('status'=>'true','response'=>'Policy information removed');
            }else{
                $json = array('status'=>'false','response'=>'Unable to update policy information. Please try again.');
            }
        }else{
            
        }
        echo json_encode($json);
    }

    public function newClaimForm() {
        echo $this->load->controller('profile/new_claim',array('patient_id'=>$this->request->post['patient_id']));;
    }
    
    public function addClaim() {
        //Load patient model
        $this->load->model('profile/patient');

        if(!empty($this->request->post['patient_id'])){
            //Check if insurance data exists
            if($this->model_profile_patient->addclaim($this->request->post)){
                $json = array('status'=>'true','response'=>'Claim added to profile');
            }else{
                $json = array('status'=>'false','response'=>'Unable to add claim. Please try again.');
            }
        }
        echo json_encode($json);
    }
    
    public function deleteClaim(){
        //Load patient model
        $this->load->model('profile/patient');

        if(!empty($this->request->post['claim_id'])){
            //Check if insurance data exists
            if($this->model_profile_patient->deleteClaim($this->request->post['claim_id'])){
                $json = array('status'=>'true','response'=>'Claim delete from profile');
            }else{
                $json = array('status'=>'false','response'=>'Unable to delete claim. Please try again.');
            }
        }
        echo json_encode($json);
    }
    
    public function viewClaim(){
        //Load patient model
        $this->load->model('profile/patient');

        if(!empty($this->request->post['claim_id'])){
            //Check if insurance data exists
            if(($claim = $this->model_profile_patient->getClaims($this->request->post['claim_id']))){
                $json = array('status'=>'true','response'=>'Opening claim record');
                $json = array_merge($claim,$json);
            }else{
                $json = array('status'=>'false','response'=>'Unable to open claim. Please try again.');
            }
        }else{
            $json = array('status'=>'false','response'=>'Unable to open claim. Please try again.');
        }
        echo json_encode($json);
    }
    
    public function claimsAjax() {
        echo $this->load->controller('profile/profile_policy_claims',array('policy_holder_id'=>$this->request->post['policy_holder_id']));
    }
    
    public function searchForPatient(){
        //Load patient model
        $this->load->model('profile/patient');
        if(!empty($this->request->post['first_name']) || !empty($this->request->post['last_name']) || !empty($this->request->post['ssn'])){
           $search = $this->model_profile_patient->findPatient($this->request->post);
            
            if(!empty($search)){
               $json = array('status'=>'true','response'=>'<strong>Name: '.$search['first_name'].' '.$search['last_name'].'</strong> <br /> <strong>SSN: '.$search['ssn'].'</strong>','operation'=>'found','action'=>$this->url->link('profile/profile_insurance_policy/updatepolicyholder'));
               $result = array(
                    'patient_id' => $search['patient_id'],
                    'first_name' => $search['first_name'],
                    'last_name' => $search['last_name'],
                    'ssn' => $search['ssn'],
                    'dob' =>  date('m/d/Y',strtotime($search['dob'])),
                    'policy_eff_date' =>  date('m/d/Y',strtotime($search['policy_eff_date']))
               );
                $json = array_merge($result,$json);  
            }else{
                $json = array('status'=>'true','response'=>'Not Found Entry','operation'=>'notfound');
            }
            
        }else{
            $json = array('status'=>'true','response'=>'No search parameter entered. Please try again.','operation'=>'notfound');
        }
        echo json_encode($json);
    }
}
?>