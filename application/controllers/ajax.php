<?php
	class Ajax extends MY_Controller{
		public function __construct()
		{			
			parent::__construct();					
		}

		public function call_ajax($controller, $method)
		{	
			if (file_exists('application/controllers/ajax/'.$controller.'.php'))
			{				
				require_once 'application/controllers/ajax/'.$controller.'.php';
				
				$tempcontroller = new $controller();
				if (!(method_exists($tempcontroller, $method)))
				{
					show_404();
				}
				
				echo $tempcontroller->$method();				
			}			
		}		
	}
?>