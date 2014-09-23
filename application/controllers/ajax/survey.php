<?php
	class Survey extends MY_Controller
	{
		public function __construct()
		{
			parent::__construct();
			$this->load->model('survey_model');
		}
		
		public function get_customer($custNo=false)
		{
			$parms = json_decode(rawurldecode($this->input->post('parm')),true);
			
			$custNo = $parms['custNo'];
			
			$result = $this->survey_model->get_customer_by_customerNo($custNo);
			
			echo json_encode(array('Result'=>$result['Result'], 'Customer'=>$result['Customer'], 'Message'=>$result['Message']));
		}
	}
?>