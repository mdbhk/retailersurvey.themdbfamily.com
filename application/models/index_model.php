<?php
class Index_model extends CI_Model {

	public function __construct()
	{	
		$this->load->database();
	}
	
	public function set_route()	
	{	
		$WebID = 'rs';
		$url=trim($this->uri->uri_string());
		$routestring=explode('/',$url);
		
		$controller=@$routestring[0];
		$method=@$routestring[1];
		$action='';
		
		if (trim($controller)=='')
		{
			$controller="redirect";			
		}
		
		$sql = "SELECT ModelID FROM tbl_models_lists_master WITH (NOLOCK) GROUP BY ModelID";
		$query = $this->db->query($sql);
		
		$models = array();
		foreach ($query->result() as $row)
		{
			$models[] = $row->ModelID;
		}
		
		// Models FROM tbl_models_lists_master
		// Always to function index() as agent
		if (in_array(strtolower(trim($controller)), $models))
		{
			$method = "index";
		}
		else
		{
			if (trim($method)=='')
			{
				$method="index";
			}
		}
		
		if (trim($action)=='')
		{
			$action="index";
		}
		
		$parm=array();					
		for ($i=2;$i<count($routestring);$i++)
		{
			$parm[]=$routestring[$i];
		}
		
		$controllerfile='application/controllers/'.$WebID.'/'.$controller.'.php';			
		if (!(file_exists($controllerfile)))
		{		
			$controllerfile='application/controllers/common/'.$controller.'.php';
			if (!(file_exists($controllerfile)))
			{
				$controllerfile='application/controllers/common/redirect.php';
				$parm=array();
				$parm[]=$controller;
				$controller="redirect";
				$method="index";
			}
		}
		
		
		if (!(file_exists($controllerfile)))
		{
			show_404();
		}
		
		if (strlen(trim($url))<=0)
		{
			$parm=array();
			$parm[]='index';
			$method="index";
		}
		
		// Call the related controller and methods	
		require_once($controllerfile);
		$tempcontroller = new $controller();
		
		if (!(method_exists($tempcontroller, $method)))
		{
			show_404();
		}

		call_user_func_array(array($tempcontroller,$method),$parm);							
		
	///// End of Customize router /////		
	}
}
?>