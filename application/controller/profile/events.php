<?php
class ControllerProfileEvents extends Controller {
	public function logUser($action) {
	    $this->user->logUser($action);
	}
    public function logUserActivity($action,$patient_id){
        $this->user->logUserActivity($action,$patient_id);
    }
    /**
     * It might be better to move this method over to
     * the profile_information controller
     */
    public function changeStatus(){
        $this->load->model('profile/patient');
        $this->model_profile_patient->changePatientStatus($this->request->post['patient_id'],$this->request->post);
        
        $status_value = $this->db->query("SELECT `value` FROM `patient_status` WHERE `status_id` = '".(int)$this->request->post['status_id']."'")->row;
        
        if(!empty($status_value)){
            if($this->request->post['status_id'] > 1 && $this->request->post['status_id'] < 3){
                   $system_notice['events'][] = array('type'=>'warning', 'message'=>'<strong>This profile is marked as  '.$status_value['value'].'</strong>');
                }elseif($this->request->post['status_id'] > 2){
                    $system_notice['events'][] = array('type'=>'danger', 'message'=>'<strong>This profile is marked as '.$status_value['value'].'</strong>');
            }
            $html_response = $this->load->view('document/notice',$system_notice);
        }else {
            $html_response = '';
        }   
        $json = array('status'=>'true','response'=>'Profile status updated','html'=>$html_response);
        
        echo json_encode($json);
    }
}