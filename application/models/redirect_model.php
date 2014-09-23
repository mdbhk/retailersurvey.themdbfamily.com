<?php
class Redirect_model extends CI_Model {

	public function __construct()
	{
		$this->load->database();
	}
	
	public function redirecturl($originalurl)
	{	
		$WebSiteID = $this->session->userdata('WebSiteID');
		if ($WebSiteID<>'')
		{
			//retrieve the Redirect information
			$sql="SELECT WebSiteID, OriginalURL, RedirectURL, RedirectType FROM tbl_redirectURL WITH (NOLOCK) WHERE StartTime< GETDATE() AND GETDATE()< ExpireTime AND Activate=1 AND WebSiteID='".mssql_real_escape_string($WebSiteID)."' AND OriginalURL='".mssql_real_escape_string($originalurl)."'";			
			$query = $this->db->query($sql);
						
			$rowcount = $query->num_rows();
			if ($rowcount>0)
			{				
				$row = $query->row();
				
				// internal redirect or extenal redirect
				if ($row->RedirectType=='Internal')
				{
					// Re-format variables
					$routestring=explode('/',$row->RedirectURL);					
					$controller=$routestring[1];
					$method=$routestring[2];
					$parm=array();					
					for ($i=3;$i<count($routestring);$i++)
					{
						$parm[]=$routestring[$i];
					}					
					
					$controllerfile='application/controllers/'.$WebSiteID.'/'.$controller.'.php';		
					if (!(file_exists($controllerfile)))
					{		
						$controllerfile='application/controllers/common/'.$controller.'.php';
						if (!(file_exists($controllerfile)))
						{
							show_404();
						/*
							$controllerfile='application/controllers/common/redirect.php';
							$parm[]=$controller;
							$method="view";
							*/
						}
					
					}		
					/*
					if (!(file_exists($controllerfile)))
					{		
						show_404();
					}
					*/
					
					// Call the related controller and methods
					require_once($controllerfile);					
					$tempcontroller = new $controller();
					call_user_func_array(array($tempcontroller,$method),$parm);					
					exit();
				}
				else if ($row->RedirectType=='External')
				{
					redirect($row->RedirectURL, 'location', 301);
				}				
			}	
		}
		else
		{
			show_404();
		}		
	}	
}
?>