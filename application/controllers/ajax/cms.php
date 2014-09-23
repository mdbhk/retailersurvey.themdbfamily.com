<?php
	class Cms extends MY_Controller{
	
		public $database = 'WebSiteDB';
	
		public function __construct()
		{
			parent::__construct();
		}
		
		// Check Slug @ Product Overview, Collection Overview, Designer Overview
		public function check_slug()
		{
			$count = 0;
			$parm=json_decode(rawurldecode($this->input->post('parm')),true);			
			
			$sql = 'SELECT RealTable FROM tbl_models_lists_master WHERE WebSiteID = ? AND ModelID = ?';
			$query = $this->db->query($sql, array($parm['websiteID'], $parm['modelID']));
			if ($row = $query->row())
			{
				$table = $row->RealTable;
			}			
			
			if ($parm['modelID'] == 'products')
			{
				$sql = "SELECT COUNT(*) AS Records FROM ".$this->database.".dbo.".$table." WHERE WebSiteID = ? AND ProductSlug = ? AND ID != ?";
			}
			elseif ($parm['modelID'] == 'collections')
			{
				$sql = "SELECT COUNT(*) AS Records FROM ".$this->database.".dbo.".$table." WHERE WebSiteID = ? AND CollectionSlug = ? AND ID != ?";
			}
			elseif ($parm['modelID'] == 'faq')
			{
				$sql = "SELECT COUNT(*) AS Records FROM ".$this->database.".dbo.".$table." WHERE WebSiteID = ? AND FaqSlug = ? AND ID != ?";
			}
			elseif ($parm['modelID'] == 'faq_category')
			{
				$table="tbl_brand_faq_category";
				$sql = "SELECT COUNT(*) AS Records FROM ".$this->database.".dbo.".$table." WHERE WebSiteID = ? AND CategorySlug = ? AND ID != ?";
				return $count;
				exit();
			}			
			else
			{
				$sql = "SELECT COUNT(*) AS Records FROM ".$this->database.".dbo.".$table." WHERE WebSiteID = ? AND Slug = ? AND ID != ?";
			}
			
			$query = $this->db->query($sql, array($parm['brandID'], $parm['value'], $parm['key']));
			if ($row = $query->row())
			{
				$count = $row->Records;
			}
			
			if ($count == 0)
			{
				$sql = "SELECT COUNT(*) AS Records FROM ".$this->database.".dbo.tbl_redirectURL WHERE OriginalURL LIKE '%".$parm['value']."' AND Remarks1 != ? AND Remarks2 != ?";
				$query = $this->db->query($sql, array($parm['modelID'], $parm['key']));
				if ($row = $query->row())
				{
					$count = $row->Records;
				}
			}
			
			return $count;
		}
	}
?>	