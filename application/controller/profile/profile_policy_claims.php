<?php
class ControllerProfileProfilePolicyClaims extends Controller {
	public function index($param) {
        //Load patient model
        $this->load->model('profile/patient');

        $policy_claim_info = $this->model_profile_patient->getPolicyClaimsList($param['policy_holder_id']);
        
        $data['claims'] = $policy_claim_info;
        $data['delete_claim'] = $this->url->link('profile/profile_insurance_policy/deleteclaim');
        
        return $this->load->view('profile/profile_policy_claims',$data);
	}
}