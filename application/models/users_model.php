<?php
class Users_model extends CI_Model {

	public function __construct()
	{
		$this->load->database();
	}
	
	public function validation($Username,$Password)
	{	
		$WebSiteID = $this->session->userdata('WebSiteID');		
		$temp=explode(".",$Username);
		$AccID=trim($temp[0]);
		$UserID=trim($temp[1]);
		if ($WebSiteID<>'')
		{
			$sql="usp_user_validation '".mssql_real_escape_string($WebSiteID)."','".mssql_real_escape_string($AccID)."','".mssql_real_escape_string($UserID)."','".mssql_real_escape_string($Password)."','".$_SERVER['REMOTE_ADDR']."'";

			$query = $this->db->query($sql);
			$row = $query->row();
			
			if ($row->Result)
			{
				$this->session->set_userdata('LoggedIn', true);
				$this->session->set_userdata('FirstName',$row->FirstName);
				$this->session->set_userdata('LastName',$row->LastName);
				$this->session->set_userdata('UserNum',$row->UserNum);
				$this->session->set_userdata('GroupID',$row->ResultMsg);
				$this->session->set_userdata('AccID',$AccID);				
				return true;
			}
			else
			{
				$this->session->set_userdata('LoggedIn', false);
				$this->session->set_userdata('UserNum','');
				$this->session->set_userdata('GroupID','');
				$this->session->set_userdata('AccID','');
				return false;
			}		
		}
		else
		{
			return false;
		}	
	}
	
	public function LoginRedirectURL()
	{
		$WebSiteID = $this->session->userdata('WebSiteID');	
		$RedirectURL='/';
		$sql="SELECT LoginRedirectURL FROM tbl_websites WHERE WebSiteID='".mssql_real_escape_string($WebSiteID)."'";	
		$query = $this->db->query($sql);		
		if ($query->num_rows()>0)		
		{
			$row = $query->row();
			$RedirectURL=$row->LoginRedirectURL;
		}	
		return $RedirectURL;
	}
}
?>