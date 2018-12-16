<?php
class ControllerDocumentPreviouslyViewed extends Controller {
    public function index() {
        if(isset($this->session->data['profile'])){
            $profiles = array_reverse($this->session->data['profile']);
            $data['profiles'] = array_slice($profiles,0,$this->config->get('pre_viewed_num'));
            $data['profile_link'] = $this->url->link('profile/profile_information','patient_id=');
            $data['previously_viewed'] = $this->url->link('profile/previously_viewed_profiles');
            return $this->load->view('document/previously_viewed',$data);
        }else{
            return false;
        }
    }
}
?>