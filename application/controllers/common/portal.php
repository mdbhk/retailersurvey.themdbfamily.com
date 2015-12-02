<?php
	class Portal extends MY_Controller{
		public function __construct()
		{			
			parent::__construct();
			$this->load->model('users_model');
			$this->load->model('portal_model');
		}
		
		public function index()
		{
			if (!$this->session->userdata('LoggedIn') && $this->session->userdata('UserNum') <= 0)
			{
				redirect('/portal/login', 301);
				exit();
			}
		
			$surveys = $this->portal_model->get_all_surveys();
			$this->smarty_data['surveys'] = $surveys;
		
			$tpl=getTPL('portal/list');
			$this->smarty_tpl->displaytpl($tpl,@$this->smarty_data);
		}
		
		public function login($action='index')
		{
			if ($action == 'post')
			{
				$result = $this->users_model->validation($this->input->post('username'), $this->input->post('password'));
				
				if ($result)
				{
					redirect('/portal', 301);
				}
				else
				{
					redirect('/portal/login?error=true', 301);
				}
				
				exit();
			}
		
			if ($this->session->userdata('LoggedIn') && $this->session->userdata('UserNum') > 0)
			{
				redirect('/portal', 301);
				exit();
			}
			
			if ($this->input->get('error') == 'true')
			{
				$this->smarty_data['error'] = true;
			}
			
			$tpl=getTPL('portal/login');
			$this->smarty_tpl->displaytpl($tpl,@$this->smarty_data);
		}
		
		public function logout()
		{
			$this->session->set_userdata('LoggedIn', false);
			$this->session->set_userdata('FirstName', '');
			$this->session->set_userdata('LastName', '');
			$this->session->set_userdata('UserNum', false);
			$this->session->set_userdata('GroupID', 'public');
			$this->session->set_userdata('AccID', '');
			
			redirect('/portal/login', 301);
			
			exit();
		}
		
		public function export()
		{
			$records = $this->portal_model->get_records_for_export();
			
			//$tpl=getTPL('portal/download');
			//$this->smarty_tpl->displaytpl($tpl,@$this->smarty_data);
			
			$result = $this->generate_excel($records);
		}
		
		private function generate_excel($records='all')
		{
			require_once (APPPATH . 'third_party/phpexcel/Classes/PHPExcel.php'); 
			require_once (APPPATH . 'third_party/phpexcel/Classes/PHPExcel/Writer/Excel2007.php');
			
			$objPHPExcel = new PHPExcel(); 
			
			$objPHPExcel->getProperties()->setCreator("MDB Order Management System");
			$objPHPExcel->getProperties()->setLastModifiedBy("MDB Order Management System");
			$objPHPExcel->getProperties()->setTitle("Order Exportation on 03-12-2014");
			$objPHPExcel->getProperties()->setSubject("Order Exportation on 03-12-2014");
			$objPHPExcel->getProperties()->setDescription("Order Exportation on 03-12-2014");
			
			$objPHPExcel->setActiveSheetIndex(0);
			$objPHPExcel->setActiveSheetIndex(0);
			
			// Column Header Setting
			$objPHPExcel->getActiveSheet()->SetCellValue('A1', 'Customer No.');
			$objPHPExcel->getActiveSheet()->SetCellValue('B1', 'Code');
			$objPHPExcel->getActiveSheet()->SetCellValue('C1', 'Name');
			$objPHPExcel->getActiveSheet()->SetCellValue('D1', 'Address');
			$objPHPExcel->getActiveSheet()->SetCellValue('E1', 'Address 2');
			$objPHPExcel->getActiveSheet()->SetCellValue('F1', 'City');
			$objPHPExcel->getActiveSheet()->SetCellValue('G1', 'State');
			$objPHPExcel->getActiveSheet()->SetCellValue('H1', 'Zip');
			$objPHPExcel->getActiveSheet()->SetCellValue('I1', 'Country/Region Code');
			$objPHPExcel->getActiveSheet()->SetCellValue('J1', 'Contact Name');
			$objPHPExcel->getActiveSheet()->SetCellValue('K1', 'Phone No.');
			$objPHPExcel->getActiveSheet()->SetCellValue('L1', 'Ship To Location');
			$objPHPExcel->getActiveSheet()->SetCellValue('M1', 'Store Location');
			$objPHPExcel->getActiveSheet()->SetCellValue('N1', 'Email');
			
			$row = 2;
			
			if ($records == 'all')
			{
				$records = $this->portal_model->get_all_records_for_export();
			}
			
			foreach ($records as $record)
			{
				$objPHPExcel->getActiveSheet()->SetCellValue('A'.$row, htmlspecialchars_decode($record['CustNo'], ENT_QUOTES));
				$objPHPExcel->getActiveSheet()->SetCellValue('B'.$row, $record['Code']);
				$objPHPExcel->getActiveSheet()->SetCellValue('C'.$row, htmlspecialchars_decode($record['Name'], ENT_QUOTES));
				$objPHPExcel->getActiveSheet()->SetCellValue('D'.$row, htmlspecialchars_decode($record['Address'], ENT_QUOTES));
				$objPHPExcel->getActiveSheet()->SetCellValue('E'.$row, htmlspecialchars_decode($record['Address2'], ENT_QUOTES));
				$objPHPExcel->getActiveSheet()->SetCellValue('F'.$row, htmlspecialchars_decode($record['City'], ENT_QUOTES));
				$objPHPExcel->getActiveSheet()->SetCellValue('G'.$row, htmlspecialchars_decode($record['State'], ENT_QUOTES));
				$objPHPExcel->getActiveSheet()->SetCellValue('H'.$row, htmlspecialchars_decode($record['Zip'], ENT_QUOTES));
				$objPHPExcel->getActiveSheet()->SetCellValue('I'.$row, htmlspecialchars_decode($record['Country'], ENT_QUOTES));
				//$objPHPExcel->getActiveSheet()->SetCellValue('J'.$row, $record['Contact']);
				$objPHPExcel->getActiveSheet()->SetCellValue('K'.$row, htmlspecialchars_decode($record['Phone'], ENT_QUOTES));
				$objPHPExcel->getActiveSheet()->SetCellValue('L'.$row, htmlspecialchars_decode($record['isShipTo'], ENT_QUOTES));
				$objPHPExcel->getActiveSheet()->SetCellValue('M'.$row, htmlspecialchars_decode($record['isStore'], ENT_QUOTES));
				$objPHPExcel->getActiveSheet()->SetCellValue('N'.$row, htmlspecialchars_decode($record['Email'], ENT_QUOTES));
						
				$row ++;
			}
			
			$datestring = date('YmdHisu');
			
			$objPHPExcel->getActiveSheet()->setTitle('Simple');
			
			$objWriter = new PHPExcel_Writer_Excel2007($objPHPExcel);
			$objWriter->save('application/files/retailer-survey-' . $datestring . '.xlsx');
			//$objWriter->save(APPPATH . 'third_party/orders-' . date('YmdHisu') . '.csv');
			
			$objPHPExcel->disconnectWorksheets();
			unset($objPHPExcel);
			
			header('Pragma: public');
			header('Pragma: no-cache');
			header('Expires: 0');
			header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
			header('Content-Description: File Transfer');
			header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=UTF-8;');
			header('Content-Length: ' . filesize(APPPATH . 'third_party/orders-' . $datestring . '.xlsx'));
			header("Content-Disposition: attachment;filename=transaction-export-" . date('Y-m-d') . ".xlsx");
			header('Content-Transfer-Encoding: binary');
			
			ob_clean();
			flush();
			
			if (@readfile('application/files/retailer-survey-' . $datestring . '.xlsx'))
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		
		public function remove()
		{
			$records = $this->portal_model->remove_records();
			
			if ($records)
			{
				redirect('/portal', 301);
			}
		}
	}
?>