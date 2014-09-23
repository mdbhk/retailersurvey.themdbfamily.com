<?php
class MY_Controller extends CI_Controller
{
	public $smarty_data;
	public function __construct()
	{
		parent::__construct();
		$this->load->model('permission_model');				
		
        $this->session->set_userdata('last_page', current_url());	
		$this->smarty_data=array();
		$this->smarty_data['brandID'] = $this->uri->segment(1);
		$this->smarty_data['modelID'] = $this->uri->segment(2);
		$this->smarty_data['functionID'] = $this->uri->segment(3);
		$this->smarty_data['actionID'] = $this->uri->segment(4);
		
		$this->smarty_data['url']=current_url();
		
		$this->smarty_data['GroupID']=$this->session->userdata('GroupID');
				
		//$this->smarty_data['message'] = $this->message->set_message();
	
	}
}
?>