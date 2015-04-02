<?php

class Cronjob_model extends CI_Model {

	public function __construct()
	{
		$this->load->database();
		
		$this->error = false;
	}
	
	public function updatecustomer($custNo, $customername='')
	{
		$error = false;
		$sql = "SELECT ID FROM tbl_survey_customer WHERE Code = '".$custNo."'";
		$query = $this->db->query($sql, array($custNo));
		if ($query->num_rows() <= 0)
		{
			$sql= "INSERT INTO tbl_survey_customer (Code, Name, Activate) VALUES ('".$custNo."', '".str_replace("'","&#39;",$customername)."', 1)";
			$query = $this->db->query($sql);
			if (!$query)
			{
				$error = true;
			}
			
			$sql= "SELECT TOP 1 ID FROM tbl_survey_customer WHERE Code = '".$custNo."' ORDER BY ID DESC";
			$query = $this->db->query($sql);
			if (!$query)
			{
				$error = true;
			}
			
			if ($row = $query->row())
			{
				$surveyID = $row->ID;
			}			
		}
		else
		{
			if ($row = $query->row())
			{
				$surveyID = $row->ID;
			}		
			
			$sql="UPDATE tbl_survey_customer SET Name='".str_replace("'","&#39;",$customername)."', Activate=1 WHERE ID=".$surveyID;
			$query = $this->db->query($sql);
			if (!$query)
			{
				$error = true;
			}
		}
		
		if ($error)
		{
			return false;
		}
		else
		{
			return $surveyID;
		}
	}
	
	public function updatecustomerlist($customeridlist='')
	{
		$error = false;
		$sql="UPDATE tbl_survey_customer SET Activate=0 WHERE ID NOT IN (".$customeridlist.")";
		$query = $this->db->query($sql);
		if (!$query)
		{
			$error = true;
		}
		return $error;
	}
	
}
?>