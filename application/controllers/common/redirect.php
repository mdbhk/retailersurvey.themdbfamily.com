<?php
	class Redirect extends MY_Controller{
		public function __construct()
		{			
			parent::__construct();
		}
		
		public function index()
		{
			redirect('/survey', 301);
			exit();
		}
	}
?>
