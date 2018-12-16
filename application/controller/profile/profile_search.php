<?php
class ControllerProfileProfileSearch extends Controller {

    public function index() {
        $this->document->setTitle('Profile Search');
        
        //Load patient model
        $this->load->model('profile/patient');

        //Page view data
        $page_data['header'] = $this->load->controller('document/header');
        /*
         * Patient JS script is incorporated
         * at this time since it would be more work
         * to switch search  method from POST to GET
         */
        $this->document->addScript('application/view/js/sandbox/patientsearch.js');-
        $page_data['footer'] = $this->load->controller('document/footer');
        $page_data['navigation'] = $this->load->controller('document/navigation');
        
        $search_data['search_action'] = $this->url->link('profile/profile_search/results');
        $page_data['content'][] = $this->load->view('profile/profile_search',$search_data);
        
        $this->response->setOutput($this->load->controller('document/document',$page_data));
        
        

	}
    
    public function results() {
        $this->document->setTitle('Search Results');
        
        //Page view data
        $page_data['header'] = $this->load->controller('document/header');
        $page_data['footer'] = $this->load->controller('document/footer');
        $page_data['navigation'] = $this->load->controller('document/navigation');
        
        //Load search model
        $this->load->model('profile/search');
        
        if($this->request->post['type'] == 'patient' && !empty($this->request->post['first_name']) || !empty($this->request->post['last_name']) || !empty($this->request->post['ssn'])) {
            unset($this->request->post['type']);
            $search_data['result'] = $this->model_profile_search->findPatient($this->request->post);

        }elseif($this->request->post['type'] == 'insurance' && !empty($this->request->post['name']) || !empty($this->request->post['ins_id']) || !empty($this->request->post['payor_id'])){
            unset($this->request->post['type']);
            $search_data['result'] = $this->model_profile_search->findByInsurance($this->request->post);
            
        }elseif($this->request->post['type'] == 'employer' && !empty($this->request->post['name']) || !empty($this->request->post['group_id'])){
            unset($this->request->post['type']);
            $search_data['result'] = $this->model_profile_search->findByEmployer($this->request->post);
        }else{
            $search_data['search_link'] = $this->url->link('profile/profile_search');
        }
        
        $search_data['profile_link'] = $this->url->link('profile/profile_information','patient_id=');
        $page_data['content'][] = $this->load->view('profile/search_results',$search_data);
        
        $this->response->setOutput($this->load->controller('document/document',$page_data));
    }

}
?>