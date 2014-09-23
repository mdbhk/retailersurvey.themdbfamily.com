<?php
	class Grid extends MY_Controller{
	
		public $masterDB = 'WebSiteDB';
	
		public function __construct()
		{
			parent::__construct();
			$this->load->model('log_model');
		}
		
		public function search()
		{			
			$parm=json_decode(rawurldecode($this->input->post('parm')),true);			
			foreach($parm as $key=>$value)
			{
				$parm[$key]=html_escape_string($parm[$key]);
			}
			$this->session->set_userdata('searchinfo', $parm); 					
			return true;						
		}
		
		public function update()
		{
			$parm=json_decode(rawurldecode($this->input->post('parm')),true);
			
			$sql = "SELECT RealTable FROM tbl_models_lists_master WHERE ModelID = ? AND ActionID = ? AND WebSiteID = ? AND Activate = 1";
			$query = $this->db->query($sql, array($parm['modelID'], $parm['actionID'], $parm['websiteID']));
			if ($query->num_rows() > 0)
			{
				$row = $query->row();
			}
			
			$sql = "UPDATE ".$this->masterDB.".dbo.".$row->RealTable." SET ".$parm['field']." = '".$parm['value']."' WHERE ID = '".$parm['key']."'";
			$query = $this->db->query($sql);
			if ($query)
			{
				$this->log_model->createlog('admin', $parm['brandID'], $parm['modelID'].'-'.$parm['actionID'], 'update', '', $parm['key'], 'ID:{'.$parm['key'].'}', $this->session->userdata('UserNum'));
				
				return true;
			}
			else
			{
				return false;
			}
		}
		
		public function delete()
		{
			$WebSiteID = $this->session->userdata('WebSiteID');
			$parm=json_decode(rawurldecode($this->input->post('parm')),true);			
			foreach($parm as $key=>$value)
			{
				$parm[$key]=mssql_real_escape_string($parm[$key]);
			}
			
			$sql="SELECT DeleteSP FROM tbl_models_lists_master WHERE WebSiteID='".$WebSiteID."' AND ModelID='".$parm['modelID']."' AND ActionID='".$parm['actionID']."' AND Activate=1";			
			$query = $this->db->query($sql);			
			$row = $query->row();
			
			if (trim($row->DeleteSP)<>'')
			{			
				$sql=$row->DeleteSP." ".$parm['id'];
				$query = $this->db->query($sql);
				$row = $query->row();
				
			}
			else
			{
				return false;
			}
		}
	}
?>	