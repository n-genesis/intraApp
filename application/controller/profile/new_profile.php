<?php
class ControllerProfileNewProfile extends Controller {

    public function index() {
        //Set header title
        $this->document->setTitle('Create New Profile');
            
        $new_profile_data['new_profile'] = $this->url->link('profile/new_profile/addprofile');
        
        //Page view data
        $page_data['header'] = $this->load->controller('document/header');
        $page_data['footer'] = $this->load->controller('document/footer');
        $page_data['navigation'] = $this->load->controller('document/navigation');
        
        $page_data['content'][] = $this->load->view('profile/new_profile',$new_profile_data);
        
        $this->response->setOutput($this->load->controller('document/document',$page_data));

	}
    
    
    public function addProfile() {
        //Load patient model
        $this->load->model('profile/patient');
            
        if (!empty($this->request->post['first_name'])) {
            $new_id = $this->model_profile_patient->addNewPatient($this->request->post);
            
            $this->response->redirect($this->url->link('profile/profile_information','patient_id='.$new_id));
        }else{
            //Add operation if something goes wrong
        }

    }
    
    
}
?>