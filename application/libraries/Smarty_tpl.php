<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
//smarty class
require APPPATH."phpscript/smarty/Smarty.class.php";

class Smarty_tpl extends Smarty {

	function __construct(){
		parent::__construct();

		$smarty_dir = APPPATH."phpscript/smarty/";

		$this->setTemplateDir(APPPATH."views/smarty_templates");
		$this->setCompileDir(APPPATH."views/smarty_templates_c");
		$this->setCacheDir(APPPATH."views/smarty_cache");
		$this->setConfigDir(APPPATH."views/smarty_config");
		$this->setPluginsDir(array("$smarty_dir/plugins","$smarty_dir/sysplugins/"));
		$this->compile_check=   true;
		$this->force_compile=   true;
		$this->caching=         false;
		$this->left_delimiter = '<!--{';	
		$this->right_delimiter = '}-->';
		$this->cache_lifetime=  86400;	
	}
	
	public function displaytpl($tpl,$smarty_data)
	{				
		$this->assign('smarty_data', @$smarty_data);		
		$this->display($tpl);
		$this->clearCompiledTemplate();
	}
}