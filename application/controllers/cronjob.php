<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

	class Cronjob extends CI_Controller{
	
		public function __construct()
		{	
			parent::__construct();			
		
			if(!$this->input->is_cli_request())
			{
				echo "This script can only be accessed via the command line" . PHP_EOL;
				exit();
			}		

			$this->load->model('cronjob_model');			
		}
		
		public function customerimport()
		{		
			require_once (APPPATH . 'third_party/phpexcel/Classes/PHPExcel/IOFactory.php'); 
			
			$path="C://inetpub/ftproot/retailersurvey/";
			$filename='NAV Active Customer and Ship-to Address List.xlsx';
			
			if (!file_exists($path.$filename)) {
                exit("file not found" . EOL);
			}

			$objReader = PHPExcel_IOFactory::createReader('Excel2007');
			$objPHPExcel = $objReader->load($path.$filename);

			$sheetNames= $objPHPExcel->getSheetNames();

			$sheetindex='0';
			$sheet = $objPHPExcel->getSheet($sheetindex);
			$startRow=2;
			$highestRow = $sheet->getHighestRow();

			$comma="";
			$customeridlist='';
			$data=array();
			for ($row = $startRow; $row <= $highestRow; $row++)
			{
				if (trim($sheet->getCell('A'.$row)->getValue())!='')
				{
					$temp=$this->cronjob_model->updatecustomer(trim($sheet->getCell('A'.$row)->getValue()),trim($sheet->getCell('B'.$row)->getValue()));
					if (!$temp)
					{
						
					}
					else
					{
						$customeridlist.=$comma.$temp;
						$comma=', ';
					}					
					//echo trim($sheet->getCell('A'.$row)->getValue())." | ".trim($sheet->getCell('B'.$row)->getValue())."\n";					
				}				
			}
			$this->cronjob_model->updatecustomerlist($customeridlist);
		}		
	}
?>