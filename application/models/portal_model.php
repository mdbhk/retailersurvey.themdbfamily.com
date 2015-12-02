<?php

class Portal_model extends CI_Model {

	private $error;
	private $message;

	public function __construct()
	{
		$this->load->database();
		
		$this->error = false;
	}
	
	public function get_all_surveys($limit=25)
	{
		$sql = "SELECT ID, CustNo, WebSiteURL, CONVERT(VARCHAR, CreateTime, 111) AS Date FROM tbl_survey_master WITH (NOLOCK) WHERE Status = 1 ORDER BY CreateTime DESC";
		$query = $this->db->query($sql, array());
		
		$surveys = array();
		foreach ($query->result() as $row)
		{
			$subSql = "SELECT * FROM tbl_survey_address WITH (NOLOCK) WHERE SurveyID = ?";
			$subQuery = $this->db->query($subSql, array($row->ID));
			
			$addresses = array();
			foreach ($subQuery->result() as $subRow)
			{
				$addresses[] = array('isShipTo'=>$subRow->isShipTo, 'isStore'=>$subRow->isStore, 'Name'=>$subRow->Name, 'Country'=>$subRow->Country, 'Address'=>$subRow->Address, 'Address2'=>$subRow->Address2, 'City'=>$subRow->City, 'State'=>$subRow->State, 'Zip'=>$subRow->Zip, 'Phone'=>$subRow->Phone);
			}
			
			$surveys[] = array('ID'=>$row->ID, 'CustNo'=>$row->CustNo, 'Website'=>$row->WebSiteURL, 'Addresses'=>$addresses, 'Date'=>$row->Date);
		}
		
		return sizeof($surveys) > 0 ? $surveys : false;
	}
	
	public function get_records_for_export()
	{
		$records = $this->input->post('records');
		$filterSQL = '';
		
		if ($records && sizeof($records) > 0)
		{
			$filterSQL .= 'AND a.ID IN ( ';
		
			for ($i=0; $i<sizeof($records); $i++)
			{
				$filterSQL .= $records[$i];
				
				if ($i != (sizeof($records) - 1) && sizeof($records) > 1)
				{
					$filterSQL .= ',';
				}
			}
			
			$filterSQL .= ' )';
		}
	
		$sql = "SELECT a.CustNo, a.WebSiteURL, a.Email, b.* FROM tbl_survey_master a WITH (NOLOCK) LEFT JOIN tbl_survey_address b WITH (NOLOCK) ON a.ID = b.SurveyID WHERE b.ID IS NOT NULL AND a.Status = 1 " . $filterSQL . " ORDER BY a.CreateTime DESC";
		$query = $this->db->query($sql, array());
		
		$records = array();
		foreach ($query->result() as $row)
		{
			$records[] = array('CustNo'=>$row->CustNo, 'WebSiteURL'=>$row->WebSiteURL, 'Email'=>$row->Email, 'Code'=>$row->Code, 'isShipTo'=>$row->isShipTo, 'isStore'=>$row->isStore, 'Name'=>$row->Name, 'Country'=>$row->Country, 'Address'=>$row->Address, 'Address2'=>$row->Address2, 'City'=>$row->City, 'State'=>$row->State, 'Zip'=>$row->Zip, 'Phone'=>$row->Phone);
		}
		
		return sizeof($records) > 0 ? $records : false;
	}
	
	public function remove_records()
	{
		$records = $this->input->post('records');
		$filterSQL = '';
		
		if ($records && sizeof($records) > 0)
		{
			$filterSQL .= 'WHERE ID IN ( ';
		
			for ($i=0; $i<sizeof($records); $i++)
			{
				$filterSQL .= $records[$i];
				
				if ($i != sizeof($records) - 1 && sizeof($records) > 1)
				{
					$filterSQL .= ',';
				}
			}
			
			$filterSQL .= ' )';
		}
		
		$sql = "UPDATE tbl_survey_master SET Status = 0 " . $filterSQL;
		$query = $this->db->query($sql, array());
		if (!$query)
		{
			return false;
		}
		
		return true;
	}
}
?>