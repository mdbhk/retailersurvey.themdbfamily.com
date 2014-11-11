<?php
	class Survey extends MY_Controller{
		public function __construct()
		{			
			parent::__construct();
			$this->load->model('survey_model');
		}
		
		public function index()
		{
			$tpl=getTPL('index');
			$this->smarty_tpl->displaytpl($tpl,@$this->smarty_data);
		}
		
		public function post()
		{
			$result = $this->survey_model->post_survey();
			
			if ($result['Result'])
			{
				$this->session->set_userdata('success', true);
				$this->session->set_userdata('data', $result['Data']);
				$this->session->set_userdata('rdata', $result['RData']);
				
				redirect('/survey/success', 301);
			}
			else
			{
				$this->session->set_userdata('error', !$result['Result']);
				$this->session->set_userdata('errors', $result['Errors']);
				$this->session->set_userdata('data', $result['Data']);
				$this->session->set_userdata('message', $result['Message']);
				
				redirect('/survey/error', 301);
			}
		}
		
		public function success()
		{
			if ($this->session->userdata('success'))
			{
				$this->smarty_data['Data'] = $this->session->userdata('data');
				$this->smarty_data['RData'] = $this->session->userdata('rdata');
			
				$this->session->unset_userdata('success');
				$this->session->unset_userdata('error');
				$this->session->unset_userdata('errors');
				$this->session->unset_userdata('data');
				$this->session->unset_userdata('rdata');
			
				$tpl=getTPL('success');
				$this->smarty_tpl->displaytpl($tpl,@$this->smarty_data);
			}
			else
			{
				show_404();
			}
		}
		
		public function error()
		{
			if ($this->session->userdata('error'))
			{
				$this->smarty_data['Error'] = $this->session->userdata('error');
				$this->smarty_data['Errors'] = $this->session->userdata('errors');
				$this->smarty_data['Data'] = $this->session->userdata('data');
				$this->smarty_data['Message'] = $this->session->userdata('message');
				
				$this->session->unset_userdata('error');
				$this->session->unset_userdata('errors');
				$this->session->unset_userdata('data');
				$this->session->unset_userdata('message');
				
				$tpl=getTPL('error');
				$this->smarty_tpl->displaytpl($tpl,@$this->smarty_data);
			}
			else
			{
				$this->session->unset_userdata('error');
				$this->session->unset_userdata('errors');
				$this->session->unset_userdata('data');
				$this->session->unset_userdata('message');
			
				show_404();
			}
		}
	}
?>
