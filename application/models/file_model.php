<?php
class File_model extends CI_Model {

	public function __construct()
	{
		$this->load->database();		
	}
	
	public function get_fileinfo($modelID, $id, $FileType)
	{			
		$WebSiteID = $this->session->userdata('WebSiteID');
		$GroupID = $this->session->userdata('GroupID');
		$AccID = $this->session->userdata('AccID');		
		
		
		if ($FileType=='image')
		{		
			$WhereFileType=" AND a.FileType='".$FileType."' ";
		}
				
		$sql="SELECT a.FileName, a.LocalFileName, a.DispositionType FROM tbl_files a LEFT JOIN tbl_files_premissions b ON a.ID=b.FileNum WHERE a.ID='".$id."' ".@$WhereFileType." AND (b.ModelID='' OR b.ModelID='".mssql_real_escape_string($modelID)."') AND (b.AccID='' OR b.AccID='".mssql_real_escape_string($AccID)."')  AND (b.GroupID='' OR b.GroupID='".mssql_real_escape_string($GroupID)."') AND WebSiteID='".mssql_real_escape_string($WebSiteID)."' AND StartTime< GETDATE() AND GETDATE()< ExpireTime AND a.Activate=1 AND b.Activate=1";			
		//echo $sql;
		$query = $this->db->query($sql);
		
		if ($query->num_rows()>0)
		{
			$row = $query->row();
			return array('Status'=>true, 'FileName'=>$row->FileName,'LocalFileName'=>$row->LocalFileName,'DispositionType'=>$row->DispositionType);
		}
		else
		{
			return array('Status'=>false);
		}
	}
	
	public function save_file($file)
	{
		var_dump($file);
	}
}
?>