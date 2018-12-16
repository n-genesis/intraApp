<?php
class ControllerProfileProfileNotesAction extends Controller {
	public function index() {
	    //Load patient model
        $this->load->model('profile/patient');
        
        if(isset($this->request->get['patient_id']) && ($patient_info = $this->model_profile_patient->getPatientById($this->request->get['patient_id']))){
            
            //Get profile information
            $view_data['patient_info'] = $patient_info;
            
            //Set page title
            $this->document->setTitle('Notes/Action Profile: '. $patient_info['fullname']);
            
            if($patient_info['status_id'] > 1 && $patient_info['status_id'] < 3){
               $system_notice['events'][] = array('type'=>'warning', 'message'=>'<strong>This profile is marked as '.$patient_info['status'].'</strong>');
            }elseif($patient_info['status_id'] > 2){
                $system_notice['events'][] = array('type'=>'danger', 'message'=>'<strong>This profile is marked as '.$patient_info['status'].'</strong>');
            }
            
            //Profile menu action
            $view_data['print_action'] = $this->url->link('profile/print_profile','patient_id='.$this->request->get['patient_id']);
            
            //note controller
            $view_data['note_controller'] = $this->url->link('profile/profile_notes_action/newnoteform');
            //Call controller
            $view_data['call_controller'] = $this->url->link('profile/profile_notes_action/newcallform');
            
            //Profile links
            $view_data['link']['general'] = $this->url->link('profile/profile_information','patient_id='.$this->request->get['patient_id']);
            $view_data['link']['insurance_policy'] = $this->url->link('profile/profile_insurance_policy','patient_id='.$this->request->get['patient_id']);
            $view_data['link']['employer'] = $this->url->link('profile/profile_employer','patient_id='.$this->request->get['patient_id']);
            $view_data['link']['records'] = $this->url->link('profile/profile_records','patient_id='.$this->request->get['patient_id']);
            $view_data['link']['notes_action'] = $this->url->link('profile/profile_notes_action','patient_id='.$this->request->get['patient_id']);
            
            //dump notice
            if(!empty($system_notice)){
               $view_data['system_notice'] = $this->load->view('document/notice',$system_notice); 
            }

            //Load note model
            $this->load->model('profile/notes');
            if(($note_info = $this->model_profile_notes->getNotesList($patient_info['patient_id']))){
                $view_data['notes'] = $note_info;
                
                //Note controllers
                $view_data['view_note'] = $this->url->link('profile/profile_notes_action/viewnote','');
                $view_data['delete_note'] = $this->url->link('profile/profile_notes_action/deletenote','');
            }

            //Load call model
            $this->load->model('profile/calls');
            if(($call_info = $this->model_profile_calls->getCallList($patient_info['patient_id']))){
                $view_data['calls'] = $call_info;
                
                //Call controllers
                $view_data['view_call'] = $this->url->link('profile/profile_notes_action/viewcall','');
                $view_data['delete_call'] = $this->url->link('profile/profile_notes_action/deletecall','');
            }
            
            
        }else{
            $view_data['page_notice'] = 'Oh no, patient profile not found';
        }
        
        //Page view data
        $page_data['header'] = $this->load->controller('document/header');
        $page_data['footer'] = $this->load->controller('document/footer');
        $page_data['navigation'] = $this->load->controller('document/navigation');
        
        $page_data['content'][] = $this->load->view('profile/profile_notes_action',$view_data);
        
        $this->response->setOutput($this->load->controller('document/document',$page_data));

	}
    
    public function latestNote($param) {
        //Load note model
        $this->load->model('profile/notes');
        $data['add_note_controller'] = $this->url->link('base/helloworld');
        $note_info = $this->model_profile_notes->getLatestNote($param['patient_id']);
        if($note_info){
            $data['add_note'] = $this->url->link('profile/profile_notes_action','patient_id='.$this->request->get['patient_id']);
        
            $view_data = array_merge($note_info,$data);
            return $this->load->view('profile/profile_note',$view_data);
        }
        
    }
    
    public function addNote() {
        //Load patient model
        $this->load->model('profile/notes');

        if(!empty($this->request->post['patient_id'])){
            //Check if insurance data exists
            if($this->model_profile_notes->newNote($this->request->post['patient_id'],$this->request->post)){
                $json = array('status'=>'true','response'=>'Note added to profile');
            }else{
                $json = array('status'=>'false','response'=>'Unable to add Note. Please try again.');
            }
        }
        echo json_encode($json);
    }

    public function viewNote(){
        //Load note model
        $this->load->model('profile/notes');
        if(($note = $this->model_profile_notes->getNote($this->request->post['note_id']))){
            $json = array('status'=>'true');
            $json = array_merge($json,$note);
        }else{
            $json = array('status'=>'true','response'=>'Unable to retrieve note. Please try again.','action'=>'notfound');
        }
        echo json_encode($json);
    }
    
    
    public function deleteNote(){
        //Load model
        $this->load->model('profile/notes');
        if(($this->model_profile_notes->deleteNote($this->request->post['item_id']))){
            $json = array('status'=>'true','response'=>'Note deleted');
        }else{
            $json = array('status'=>'false','response'=>'Unable to delete note. Please try again.');
        }
        echo json_encode($json);
    }
    
    public function newNoteForm() {
        echo $this->load->controller('profile/new_note',array('patient_id'=>$this->request->post['patient_id']));;
    }
    
    public function viewCall(){
        //Load note model
        $this->load->model('profile/calls');
        if(($call = $this->model_profile_calls->getCall($this->request->post['call_id']))){
            $json = array('status'=>'true');
            $json = array_merge($json,$call);
        }else{
            $json = array('status'=>'true','response'=>'Unable to retrieve note. Please try again.','action'=>'notfound');
        }
        echo json_encode($json);
    }
    
    public function deleteCall(){
        //Load model
        $this->load->model('profile/calls');
        if(($this->model_profile_calls->deleteCall($this->request->post['item_id']))){
            $json = array('status'=>'true','response'=>'Call deleted');
        }else{
            $json = array('status'=>'false','response'=>'Unable to delete call. Please try again.');
        }
        echo json_encode($json);
    }
    
    public function addCall() {
        //Load patient model
        $this->load->model('profile/calls');

        if(!empty($this->request->post['patient_id'])){
            //Check if insurance data exists
            if($this->model_profile_calls->newCall($this->request->post['patient_id'],$this->request->post)){
                $json = array('status'=>'true','response'=>'Note added to profile');
            }else{
                $json = array('status'=>'false','response'=>'Unable to add Note. Please try again.');
            }
        }
        echo json_encode($json);
    }
    
    public function newCallForm() {
        echo $this->load->controller('profile/new_call',array('patient_id'=>$this->request->post['patient_id']));;
    }
    
}