<?php
class ControllerDashboardDashboard extends Controller {
	public function index() {
	    
        //Set header title
        $this->document->setTitle('Dashboard');
        
        //Dashboard links
        $dashboard_data['search_person'] = $this->url->link('profile/profile_search','#tab-1');
        $dashboard_data['search_insurance'] = $this->url->link('profile/profile_search','#tab-2');
        $dashboard_data['search_employer'] = $this->url->link('profile/profile_search','#tab-3');
        $dashboard_data['new'] = $this->url->link('profile/new_profile');
        
        //Show extension block on dashboard
        $dashboard_data['extension_block'] = $this->load->controller('dashboard/extensions');
        
        $page_data['content'][] = $this->load->view('dashboard/dashboard',$dashboard_data);
        
        //Page view data
        $page_data['header'] = $this->load->controller('document/header');
        $page_data['navigation'] = $this->load->controller('document/navigation');
        $page_data['footer'] = $this->load->controller('document/footer');
        
        
        
        $this->response->setOutput($this->load->controller('document/document',$page_data));
	}

}