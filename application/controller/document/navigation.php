<?php
class ControllerDocumentNavigation extends Controller {
	public function index() {
	    $data['username'] = $this->user->getUsername();
        $data['logout'] = $this->url->link('base/logout');
        
        $data['dashboard'] = $this->url->link('dashboard/dashboard');
        
        //Extension menu options
        $this->load->model('extension/extension');
        $modules = $this->model_extension_extension->getInstalled('module');
        foreach ($modules as $module) {
            $data['extensions_links'][] = array(
            'name'      => ucwords(str_replace('_', ' ', $module)),
            'link'      => $this->url->link('module/'.$module),
            );
        }
        //Application information
        $data['appinfo_files'] = $this->url->link('appinfo/filemanager');
        
        //Extension
        $data['extensions'] = $this->url->link('extension/extensions');
        $data['helpdoc'] = $this->url->link('helpdoc/main');
        
        
        $data['search_person'] = $this->url->link('profile/profile_search','#tab-1');
        $data['search_insurance'] = $this->url->link('profile/profile_search','#tab-2');
        $data['search_employer'] = $this->url->link('profile/profile_search','#tab-3');
        
        
        
        return $this->load->view('document/navigation',$data);
	}
}