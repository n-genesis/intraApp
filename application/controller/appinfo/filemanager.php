<?php
class ControllerAppinfoFilemanager extends Controller {
    
    public function index(){
        //Set header title
        $this->document->setTitle('Application Files');
        
        //get folders
        //root link
        $view_data['root_link'] = $this->url->link('appinfo/files','directory=root');
        $view_data['directory'] = $this->directories();
        $view_data['current_dir'] = (isset($this->request->get['directory'])?$this->request->get['directory']:'');
        //Get files
        $view_data['file_list'] = $this->files();
        
        $page_data['content'][] = $this->load->view('appinfo/file_manager',$view_data);
        
        //Add script and styles
        $this->document->addScript('application/view/vendors/bootstrap-menu/bootstrap-menu.min.js');
        
        $this->document->addScript('application/view/js/sandbox/sandboxfileopts.js');
        
        //Page view data
        $page_data['header'] = $this->load->controller('document/header');
        $page_data['footer'] = $this->load->controller('document/footer');
        $page_data['navigation'] = $this->load->controller('document/navigation');
        
        $this->response->setOutput($this->load->controller('document/document',$page_data));
    }
    
    public function files($dir = 'files'){
        
        if(isset($this->request->get['directory']) && $this->request->get['directory'] !== 'root'){
            $dir = $dir.'/'.$this->request->get['directory'];
        }elseif(isset($this->request->post['directory'])){
            if($this->request->post['directory'] != 'root'){
                $dir = $dir.'/'.$this->request->post['directory'];
            }else{
                $dir = $dir;
            }
            $html = true;
        }
        try{
           $directory = new \DirectoryIterator($dir.'/');
           foreach ($directory as $file) {
               if($file->isFile()){
                $view_data['files'][$file->getFilename()] = array('ex'=>$file->getExtension(),'create'=>date('M j, Y',$file->getCTime())) ;
            }         
        }
            $output = $this->load->view('appinfo/file',$view_data);  
        }catch(Exception $e){
           $output = '<h1 class="text-center"><code>Unknown Directory</code></h1>';
        }
        if(!isset($html)){
            return $output;
        }else{
            echo $output;
        }
    }
    
    public function directories(){
        $directory = new \DirectoryIterator('files/');
        foreach ($directory as $dir) {
            if($dir->isDir() && !$dir->isDot()){
               $directory_list[$dir->getFilename()] = $this->url->link('appinfo/filemanager','directory='.urlencode($dir->getFilename()));
            }
            
        }

      return $directory_list;
    }
}
?>