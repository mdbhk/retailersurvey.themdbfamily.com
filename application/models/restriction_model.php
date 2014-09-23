<?php
class Restriction_model extends CI_Model {
	
	public function __construct()
	{
		$this->load->database();	
	}

	public function check_formlimitation($formID, $dayrange=1, $limitation=5)
	{
		$WebSiteID = $this->session->userdata('WebSiteID');	
		
		$sql="SELECT COUNT(*) Total FROM tbl_restrictions_form_limitations WHERE WebSiteID='".$WebSiteID."' AND FormID='".$formID."' AND ClientIP='".getClientIP()."' AND CreateTime> DATEADD(day,-".$dayrange.",GETDATE())";
		
		$query = $this->db->query($sql);
		$row = $query->row();
		$Total =$row->Total;
		
		$sql="INSERT INTO tbl_restrictions_form_limitations (WebSiteID, FormID, ClientIP) VALUES ('".$WebSiteID."','".$formID."','".getClientIP()."')";
		$query = $this->db->query($sql);
		
		if ($Total>=$limitation)
		{
			return false;
		}
		else
		{
			return true;
		}
	}

	public function set_token($formID)
	{		
		$token=md5(uniqid(rand(),true));
		$this->session->set_userdata('token_'.$formID,$token);		
		return $token;
	}	
	
	public function check_token($formID,$token)
	{
		$result=false;		
		if ($this->session->userdata('token_'.$formID)==$token)
		{
			$result=true;
		}		
		$this->session->set_userdata('token_'.$formID,md5(uniqid(rand(),true)));
		return $result;		
	}
	
	public function check_BanIP($clientIP)
	{
		$WebSiteID = $this->session->userdata('WebSiteID');	
		
		$sql="SELECT COUNT(*) Total FROM tbl_restrictions_banIP WHERE '".$clientIP."' like ClientIP+'%' AND WebSiteID='".$WebSiteID."' AND Activate=1 AND StartTime< GETDATE() AND   GETDATE()< EndTime";		
		
		$query = $this->db->query($sql);
		$row = $query->row();
						
		if ($row->Total>0)
		{
			show_404();
		}	
	}

}
?>