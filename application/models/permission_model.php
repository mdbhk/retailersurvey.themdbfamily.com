<?php
class Permission_model extends CI_Model {

	public function __construct()
	{
		parent::__construct();
		$this->load->database();
		$this->check_permission();
	}
	
	public function check_permission()
	{
		$WebSiteID = $this->session->userdata('WebSiteID');
		$GroupID = $this->session->userdata('GroupID');
		$AccID = $this->session->userdata('AccID');		
		
		$PreWebSiteID = $this->session->userdata('WebSiteID');
		
		$url=trim($this->uri->uri_string());	
		$routestring=explode('/',$url);
		
		$controller=@$routestring[0];
		$method=@$routestring[1];		
		$WebID=$WebSiteID;	
		
		$curr_class=@$controller;
		$curr_method=@$method;
		
		if (trim($curr_class)=='')
		{
			$curr_class="redirect";			
		}
		if (trim($curr_method)=='')
		{
			$curr_method="index";
		}
		
		$controllerfile='application/controllers/'.$WebID.'/'.$curr_class.'.php';
		if (!(file_exists($controllerfile)))
		{		
			if ($curr_class=='ajax')
			{
				$controllerfile='application/controllers/ajax.php';				
			}
			else
			{
				$controllerfile='application/controllers/common/'.$curr_class.'.php';
				if (!(file_exists($controllerfile)))
				{
					$curr_class="redirect";	
					$curr_method="index";
				}
			}
		}

		$sql="SELECT WebSiteID, Suspend FROM tbl_websites WITH (NOLOCK) WHERE Domain='".mssql_real_escape_string(getDomain())."' AND Activate=1 AND StartTime< GETDATE() AND GETDATE()< ExpireTime";				
		$query = $this->db->query($sql);
		
		$rowcount = $query->num_rows();
		if ($rowcount>0)
		{
			$row = $query->row();
			if ($row->Suspend)
			{
				//show suspend page
				echo "suspend";
				show_404();
			}
			else
			{
				$WebSiteID=$row->WebSiteID;
				$this->session->set_userdata('WebSiteID', $row->WebSiteID);
			}
		}
		else
		{
			show_404();
		}
		
		if ($GroupID=='' || $GroupID === false)
		{
			$GroupID='public';
			$this->session->set_userdata('GroupID',$GroupID);
		}
		
		$sql="SELECT count(*) total FROM tbl_websites_accounts_groups_models WITH (NOLOCK) WHERE Activate=1 AND GroupID='".mssql_real_escape_string($GroupID)."' AND ModelID='".mssql_real_escape_string($curr_class)."' AND (AccID='".mssql_real_escape_string($AccID)."' OR AccID='') AND (WebSiteID='".mssql_real_escape_string($WebSiteID)."' OR WebSiteID='')";								
		$query = $this->db->query($sql);
		$row = $query->row();
		$total=$row->total;
		
		if ($total<=0)
		{
			show_404();
		}
	}
}
?>