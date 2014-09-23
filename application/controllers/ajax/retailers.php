<?php
	class Retailers extends MY_Controller
	{
		public function __construct()
		{
			parent::__construct();				
			$this->load->model('retailer_model');
			$this->load->model('products_model');
			$this->load->model('users_model');
		}
		
		public function get_products()
		{	
			$CollectionID=$this->input->post('CollectionID');	
			echo json_encode($this->retailer_model->get_products($CollectionID));
			
		}
		public function get_collections(){
			$WebsiteID = $this->input->post('WebSiteID');
			//$WebsiteID = 'dv';
			//echo '123';
			//print_r($this->input->post());
			//echo $WebsiteID;
			echo json_encode($this->products_model->get_collections_retailers('PORTALDB.dbo',$WebsiteID));
		}
		

	}
?>