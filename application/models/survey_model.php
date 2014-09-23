<?php

class Survey_model extends CI_Model {

	private $error;
	private $message;

	public function __construct()
	{
		$this->load->database();
		
		$this->error = false;
	}
	
	public function get_customer_by_customerNo($custNo=false)
	{
		$this->error = false;
		$this->message = false;
		
		if (!$custNo)
		{
			$this->error = true;
			$this->message = 'Customer could not be found';
		}
		
		$customer = false;
		
		$sql = "SELECT TOP 1 * FROM tbl_survey_customer WHERE Code = CAST(? AS VARCHAR(20))";
		$query = $this->db->query($sql, array($custNo));
		if ($query->num_rows() <= 0)
		{
			$this->error = true;
			$this->message = 'Customer could not be found';
		}
		else
		{
			if ($row = $query->row())
			{
				$customer = array('Name'=>$row->Name, 'Code'=>$row->Name);
			}
			else
			{
				$this->error = true;
				$this->message = 'Database error, Please try again';
			}
		}
		
		return array('Result'=>!$this->error, 'Customer'=>$customer, 'Message'=>$this->message);
	}
	
	public function post_survey()
	{
		$this->error = false;
		$this->errors = array();
		$this->message = false;
	
		$parms = $this->input->post();
		
		$validate = true;
		$errors = array();
		
		if ($parms !== false)
		{	
			$data['custno'] = htmlentities(trim($parms['custno']), ENT_QUOTES);
			$data['website'] = htmlentities(trim($parms['website']), ENT_QUOTES);
		
			if (trim($parms['custno']) == '' || !isset($parms['custno']))
			{
				$validate = false;
				$errors['custno']['status'] = true;
				$errors['custno']['message'] = 'Please enter your customer number';
			}
			else if (strlen(trim($parms['custno'])) > 20)
			{
				$errors['custno']['status'] = true;
				$errors['custno']['message'] = 'Customer number should not exceed 20 characters';
			}
			
			if ( strlen(trim($parms['website'])) > 0 && !filter_var(trim($parms['website']), FILTER_VALIDATE_URL))
			{
				$validate = false;
				$errors['website']['status'] = true;
				$errors['website']['message'] = 'Please enter a valid URL in the format http://www.domain.com';
			}
			
			$filledAddress = array();
			
			for ($i=1; $i<=10; $i++)
			{
				!isset($parms['is-ship-to_' . $i]) ? $data['address' . $i]['is-ship-to'] = false : $data['address' . $i]['is-ship-to'] = true;
				!isset($parms['is-store_' . $i]) ? $data['address' . $i]['is-store'] = false : $data['address' . $i]['is-store'] = true;
				$data['address' . $i]['name'] = htmlspecialchars(trim($parms['name_' . $i]), ENT_QUOTES);
				$data['address' . $i]['country'] = htmlspecialchars(trim($parms['country_' . $i]), ENT_QUOTES);
				$data['address' . $i]['address'] = htmlspecialchars(trim($parms['address_' . $i]), ENT_QUOTES);
				$data['address' . $i]['address2'] = htmlspecialchars(trim($parms['address2_' . $i]), ENT_QUOTES);
				$data['address' . $i]['city'] = htmlspecialchars(trim($parms['city_' . $i]), ENT_QUOTES);
				$data['address' . $i]['state'] = htmlspecialchars(trim($parms['state_' . $i]), ENT_QUOTES);
				$data['address' . $i]['zip'] = htmlspecialchars(trim($parms['zip_' . $i]), ENT_QUOTES);
				$data['address' . $i]['phone'] = htmlspecialchars(trim($parms['phone_' . $i]), ENT_QUOTES);
			
				if (!isset($parms['is-ship-to_' . $i]) && !isset($parms['is-store_' . $i]))
				{
					//$validate = false;
				}
				else
				{
					if (
						(isset($parms['name_' . $i]) && trim($parms['name_' . $i]) != '') ||
						(isset($parms['country_' . $i]) && trim($parms['country_' . $i]) != '') ||
						(isset($parms['address_' . $i]) && trim($parms['address_' . $i]) != '') ||
						(isset($parms['city_' . $i]) && trim($parms['city_' . $i]) != '') ||
						(isset($parms['state_' . $i]) && trim($parms['state_' . $i]) != '') ||
						(isset($parms['zip_' . $i]) && trim($parms['zip_' . $i]) != '') ||
						(isset($parms['phone_' . $i]) && trim($parms['phone_' . $i]) != '')
					) {
						$filledAddress[] = $i;
					}
				}
			}
			
			if (sizeof($filledAddress) > 0)
			{
				$index = 1;
			
				foreach ($filledAddress as $i)
				{
					!isset($parms['is-ship-to_' . $i]) ? $rdata['address' . $index]['is-ship-to'] = false : $rdata['address' . $index]['is-ship-to'] = true;
					!isset($parms['is-store_' . $i]) ? $rdata['address' . $index]['is-store'] = false : $rdata['address' . $index]['is-store'] = true;
					$rdata['address' . $index]['name'] = htmlspecialchars(trim($parms['name_' . $i]), ENT_QUOTES);
					$rdata['address' . $index]['country'] = htmlspecialchars(trim($parms['country_' . $i]), ENT_QUOTES);
					$rdata['address' . $index]['address'] = htmlspecialchars(trim($parms['address_' . $i]), ENT_QUOTES);
					$rdata['address' . $index]['address2'] = htmlspecialchars(trim($parms['address2_' . $i]), ENT_QUOTES);
					$rdata['address' . $index]['city'] = htmlspecialchars(trim($parms['city_' . $i]), ENT_QUOTES);
					$rdata['address' . $index]['state'] = htmlspecialchars(trim($parms['state_' . $i]), ENT_QUOTES);
					$rdata['address' . $index]['zip'] = htmlspecialchars(trim($parms['zip_' . $i]), ENT_QUOTES);
					$rdata['address' . $index]['phone'] = htmlspecialchars(trim($parms['phone_' . $i]), ENT_QUOTES);
				
					if (!isset($parms['name_' . $i]) || trim($parms['name_' . $i]) == '')
					{
						$validate = false;
						$errors['address' . $i]['name']['status'] = true;
						$errors['address' . $i]['name']['message'] = 'Please enter a name for the address';
					}
					else if (strlen(trim($parms['name_' . $i])) > 50)
					{
						$validate = false;
						$errors['address' . $i]['name']['status'] = true;
						$errors['address' . $i]['name']['message'] = 'Name for the address should not exceed 50 characters';
					}
					
					if (!isset($parms['country_' . $i]) || trim($parms['country_' . $i]) == '')
					{
						$validate = false;
						$errors['address' . $i]['country']['status'] = true;
						$errors['address' . $i]['country']['message'] = 'Please enter your country';
					}
					else if (strlen(trim($parms['country_' . $i])) > 2)
					{
						$errors['address' . $i]['country']['status'] = true;
						$errors['address' . $i]['country']['message'] = 'Country should not exceed 2 characters';
					}
					
					if (!isset($parms['address_' . $i]) || trim($parms['address_' . $i]) == '')
					{
						$validate = false;
						$errors['address' . $i]['address']['status'] = true;
						$errors['address' . $i]['address']['message'] = 'Please enter your street address';
					}
					else if (strlen(trim($parms['address_' . $i])) > 55)
					{
						$validate = false;
						$errors['address' . $i]['address']['status'] = true;
						$errors['address' . $i]['address']['message'] = 'Each address line should not exceed 55 characters';
					}
					
					if (strlen(trim($parms['address2_' . $i])) > 55)
					{
						$validate = false;
						$errors['address' . $i]['address2']['status'] = true;
						$errors['address' . $i]['address2']['message'] = 'Each address line should not exceed 55 characters';
					}
					
					if (!isset($parms['city_' . $i]) || trim($parms['city_' . $i]) == '')
					{
						$validate = false;
						$errors['address' . $i]['city']['status'] = true;
						$errors['address' . $i]['city']['message'] = 'Please enter your city';
					}
					else if (strlen(trim($parms['city_' . $i])) > 30)
					{
						$validate = false;
						$errors['address' . $i]['city']['status'] = true;
						$errors['address' . $i]['city']['message'] = 'City should not exceed 30 characters';
					}
					
					if (!isset($parms['state_' . $i]) || trim($parms['state_' . $i]) == '')
					{
						$validate = false;
						$errors['address' . $i]['state']['status'] = true;
						$errors['address' . $i]['state']['message'] = 'Please enter your state (2 letter code if US)';
					}
					else if (strlen(trim($parms['state_' . $i])) > 30)
					{
						$validate = false;
						$errors['address' . $i]['state']['status'] = true;
						$errors['address' . $i]['state']['message'] = 'State shoudl not exceed 30 characters';
					}
					else if (strtolower(trim($parms['country_' . $i])) == 'us' && strlen(trim($parms['state_' . $i])) > 2)
					{
						$validate = false;
						$errors['address' . $i]['state']['status'] = true;
						$errors['address' . $i]['state']['message'] = 'Please enter your state (2 letter code if US)';
					}
					
					if (!isset($parms['zip_' . $i]) || trim($parms['zip_' . $i]) == '')
					{
						$validate = false;
						$errors['address' . $i]['zip']['status'] = true;
						$errors['address' . $i]['zip']['message'] = 'Please enter your zip (5 digits if US)';
					}
					/*
					else if (!preg_match('/^[a-zA-z0-9]', trim($parms['zip_' . $i])))
					{
						$validate = false;
						$errors['address' . $i]['zip']['status'] = true;
						$errors['address' . $i]['zip']['message'] = 'UNKNOWN';
					}
					*/
					/*
					else if (!is_numeric($parms['zip_' . $i]))
					{
						$validate = false;
						$errors['address' . $i]['zip']['status'] = true;
						$errors['address' . $i]['zip']['message'] = 'Please enter your zip (5 digits if US)';
					}
					*/
					else if (strlen(trim($parms['zip_' . $i])) > 20)
					{
						$validate = false;
						$errors['address' . $i]['zip']['status'] = true;
						$errors['address' . $i]['zip']['message'] = 'Zip code should not exceed 20 characters';
					}
					
					if (strtolower(trim($parms['country_' . $i])) == 'us' && strlen(trim($parms['zip_' . $i])) != 5)
					{
						$validate = false;
						$errors['address' . $i]['zip']['status'] = true;
						$errors['address' . $i]['zip']['message'] = 'Please enter your zip (5 digits if US)';
					}
					
					if (!isset($parms['phone_' . $i]) || trim($parms['phone_' . $i]) == '')
					{
						$validate = false;
						$errors['address' . $i]['phone']['status'] = true;
						$errors['address' . $i]['phone']['message'] = 'Please enter your phone number (xxx-xxx-xxxx format if US)';
					}
					else if (strlen(trim($parms['phone_' . $i])) > 30)
					{
						$errors['address' . $i]['phone']['status'] = true;
						$errors['address' . $i]['phone']['message'] = 'Phone should not exceed 30 characters';
					}
					
					if (strtolower(trim($parms['country_' . $i])) == 'us' && (strlen(trim($parms['phone_' . $i])) != 12 || !preg_match("/^[0-9]{3}-[0-9]{3}-[0-9]{4}$/", trim($parms['phone_' . $i]))))
					{
						$validate = false;
						$errors['address' . $i]['phone']['status'] = true;
						$errors['address' . $i]['phone']['message'] = 'Please enter your phone number (xxx-xxx-xxxx format if US)';
					}
					
					$index ++;
				}
			}
			else
			{
				$validate = false;
				$errors['noaddress'] = true;
				
				if (!isset($parms['name_1']) || trim($parms['name_1']) == '')
				{
					$errors['address1']['name']['message'] = 'Please enter a name for the address';
				}
				else if (strlen(trim($parms['name_1'])) > 50)
				{
					$errors['address1']['name']['message'] = 'Name for the address should not exceed 50 characters';
				}
				
				if (!isset($parms['country_1']) || trim($parms['country_1']) == '')
				{
					$errors['address1']['country']['message'] = 'Please enter your country';
				}
				else if (strlen(trim($parms['country_1'])) > 2)
				{
					$errors['address1']['country']['message'] = 'Country should not exceed 2 characters';
				}
				
				if (!isset($parms['address_1']) || trim($parms['address_1']) == '')
				{
					$errors['address1']['address']['message'] = 'Please enter your street address';
				}
				else if (strlen(trim($parms['address_1'])) > 55)
				{
					$errors['address1']['address']['message'] = 'Each address line should not exceed 55 characters';
				}
				
				if (strlen(trim($parms['address2_1'])) > 55)
				{
					$errors['address1']['address2']['message'] = 'Each address line should not exceed 55 characters';
				}
				
				if (!isset($parms['city_1']) || trim($parms['city_1']) == '')
				{
					$errors['address1']['city']['message'] = 'Please enter your city';
				}
				else if (strlen(trim($parms['city_1'])) > 30)
				{
					$errors['address1']['city']['message'] = 'City should not exceed 30 characters';
				}
				
				if (!isset($parms['state_1']) || trim($parms['state_1']) == '')
				{
					$errors['address1']['state']['message'] = 'Please enter your state (2 letter code if US)';
				}
				else if (strlen(trim($parms['state_1'])) > 30)
				{
					$errors['address1']['state']['message'] = 'State shoudl not exceed 30 characters';
				}
				else if (strtolower(trim($parms['country_1'])) == 'us' && strlen(trim($parms['state_1'])) > 2)
				{
					$errors['address1']['state']['message'] = 'Please enter your state (2 letter code if US)';
				}
				
				if (!isset($parms['zip_1']) || trim($parms['zip_1']) == '')
				{
					$errors['address1']['zip']['message'] = 'Please enter your zip (5 digits if US)';
				}
				/*
				else if (!is_numeric($parms['zip_1']))
				{
					$errors['address1']['zip']['message'] = 'Please enter your zip (5 digits if US)';
				}
				*/
				else if (strlen(trim($parms['zip_1'])) > 20)
				{
					$errors['address1']['zip']['message'] = 'Zip code should not exceed 20 characters';
				}
				else if (strtolower(trim($parms['country_1'])) == 'us' && strlen(trim($parms['zip_1'])) != 5)
				{
					$errors['address1']['zip']['message'] = 'Please enter your zip (5 digits if US)';
				}
				
				if (!isset($parms['phone_1']) || trim($parms['phone_1']) == '')
				{
					$errors['address1']['phone']['message'] = 'Please enter your phone number (xxx-xxx-xxxx format if US)';
				}
				else if (strlen(trim($parms['phone_1'])) > 30)
				{
					$errors['address1']['phone']['message'] = 'Phone should not exceed 30 characters';
				}
				else if (strtolower(trim($parms['country_1'])) == 'us' && (strlen(trim($parms['phone_1'])) != 12 || !preg_match("/^[0-9]{3}-[0-9]{3}-[0-9]{4}$/", trim($parms['phone_1']))))
				{
					$errors['address1']['phone']['message'] = 'Please enter your phone number (xxx-xxx-xxxx format if US)';
				}
			}
			
			if (!$validate)
			{
				$this->error = !$validate;
				$this->errors = $errors;
			}
			else
			{
				$this->db->trans_begin();
			
				$sql = "INSERT INTO tbl_survey_master (Type, CustNo, WebSiteURL, Status) VALUES (?, ?, ?, 1)";
				$query = $this->db->query($sql, array('retailer-survey', $data['custno'], $data['website']));
				if (!$query)
				{
					$this->error = true;
				}
				
				$sql = "SELECT TOP 1 ID FROM tbl_survey_master ORDER BY ID DESC";
				$query = $this->db->query($sql);
				if ($row = $query->row())
				{
					$surveyID = $row->ID;
				}
				
				if (sizeof($filledAddress) > 0)
				{
					foreach ($filledAddress as $i)
					{
						$addressCount = 0;
						$code = strtoupper(preg_replace('/[^a-zA-Z]+/', '', $data['address' . $i]['city']));
						$codeTrim = false;
						
						if (strlen($code) >= 10)
						{
							$code = substr($code, 0, 10);
							$codeTrim = true;
						}
						
						$sql = "SELECT COUNT(*) AS AddressCount FROM tbl_survey_address a WITH (NOLOCK) LEFT JOIN tbl_survey_master b WITH (NOLOCK) ON a.SurveyID = b.ID WHERE b.CustNo = ? AND LOWER(a.City) = LOWER(?)";
						$query = $this->db->query($sql, array($data['custno'], $data['address' . $i]['city']));
						if ($row = $query->row())
						{
							$addressCount = $row->AddressCount;
						}
						
						
						if ($addressCount == 0)
						{
							// No Action
						}
						elseif ($addressCount > 0 && $addressCount <=9)
						{
							if ($codeTrim) {
								$code = substr($code, 0, -1) . ($addressCount + 1);
							} else {
								$code = $code . ($addressCount + 1);							
							}
						}
						elseif ($addressCount >= 10 && $addressCount <= 98)
						{
							if ($codeTrim) {
								$code = substr($code, 0, -1) . ($addressCount + 1);
							} else {
								$code = $code . ($addressCount + 1);	
							}
						}
						else
						{
							$this->error = true;
							$this->message = 'We have some problems in processing your updates. Please contact your account specialist.';
						}
					
						$sql = "INSERT INTO tbl_survey_address (SurveyID, Code, isShipTo, isStore, Name, Country, Address, Address2, City, State, Zip, Phone) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
						$query = $this->db->query($sql, array($surveyID, $code, $data['address' . $i]['is-ship-to'], $data['address' . $i]['is-store'], $data['address' . $i]['name'], $data['address' . $i]['country'], $data['address' . $i]['address'], $data['address' . $i]['address2'], $data['address' . $i]['city'], $data['address' . $i]['state'], $data['address' . $i]['zip'], $data['address' . $i]['phone']));
						if (!$query)
						{
							$this->error = true;
						}
					}
				}
				
				if (!$this->error)
				{
					$this->db->trans_commit();
				}
				else
				{
					$this->db->trans_rollback();
				}
			}
			
			$this->data = $data;
			$this->rdata = $rdata;
		}
		else
		{
			$this->error = true;
		}
		
		return array('Result'=>!$this->error, 'Errors'=> $this->error ? $this->errors : false, 'Data'=>$this->data, 'RData'=>!$this->error ? $this->rdata : false, 'Message'=> $this->error ? $this->message : false);
		
		exit();
	}
}
?>