<?php
	class Dashboard extends MY_Controller{
		public function __construct()
		{
			parent::__construct();	
			$this->load->model('dashboard_model');
		}
		
		public function index()
		{		
			////// Check and get the template file ////////			
			$tpl=getTPL('dashboard/index');
			$this->smarty_tpl->displaytpl($tpl,@$this->smarty_data);							
		}
	}
?>