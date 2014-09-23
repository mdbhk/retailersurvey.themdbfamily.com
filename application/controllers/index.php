<?php
	class Index extends MY_Controller{
	
	public function __construct()
	{
		parent::__construct();
		$this->restriction_model->check_BanIP($this->input->ip_address());
	}

	public function index()
	{						
///// Customize router //////
		$this->index_model->set_route();
	}
}
?>