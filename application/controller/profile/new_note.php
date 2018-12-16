<?php
class ControllerProfileNewNote extends Controller {
	public function index($param) {
        //Load patient model
        $this->load->model('profile/patient');

        $patient_info = $this->model_profile_patient->getPatientById($param['patient_id']);
        
        $data['date'] = date('m/d/Y',time());
        $data['username'] = $this->user->getUsername();
        $data['user_id'] = $this->user->getId();
        $data['patient_info'] = $patient_info;
        $data['action'] = $this->url->link('profile/profile_notes_action/addnote');
        
        
        return $this->load->view('profile/new_note',$data);
	}
}