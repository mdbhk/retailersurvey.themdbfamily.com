<?php

class SurveyObject {

	private $field_customer_number = array(
		'value'=>false,
		'required'=>true
	);
	
	private $field_website = array(
		'value'=>false,
		'required'=>true
	);
	
	private $field_addresses = array();
	
	private $address_sample = array(
		'is-ship-to'=>array(
			'value'=>false,
			'required'=>false,
		),
		'is-store'=>array(
			'value'=>false,
			'required'=>false,
		),
		'name'=>array(
			'value'=>false,
			'required'=>true
		),
		'country'=>array(
			'value'=>false,
			'required'=>true
		),
		'address'=>array(
			'value'=>false,
			'required'=>true
		),
		'address2'=>array(
			'value'=>false,
			'required'=>false
		),
		'city'=>array(
			'value'=>false,
			'required'=>true
		),
		'state'=>array(
			'value'=>false,
			'required'=>true
		),
		'zip'=>array(
			'value'=>false,
			'required'=>true
		),
		'phone'=>array(
			'value'=>false,
			'required'=>true
		)
	);
	
	private $fields = array();
	
	public function __construct()
	{
	}
	
	public function set_customer_number($value=false)
	{
		$this->field_customer_number['value'] = trim($value);
	}
	
	public function set_website($value=false)
	{
		$this->field_website['value'] = trim($value);
	}
	
	public function add_address($value=false)
	{
		$address = $this->address_sample;
		
		foreach ($value as $key=>$value)
		{
			$address[$key]['value'] = $value;
		}
		
		$this->field_addresses[] = $address;
	}
	
	public function validation()
	{
		$validate = true;
		$error_fields = array();
	
		foreach(get_object_vars($this) as $key=>$val)
		{
			if (substr($key, 0, 6) == 'field_')
			{
				$this->fields[$key] = $this->$key;
			}
		}
		
		foreach ($this->fields as $key=>$val)
		{
			if ($key == 'field_addresses')
			{
				if (sizeof($this->fields[$key]) > 0)
				{
					foreach ($this->fields[$key] as $key=>$value)
					{
						foreach ($value as $aKey=>$aField)
						{
							if ($aField['required'] && ($aField['value'] == '' || strlen($aField['value']) <= 0))
							{
								$validate = false;
								$error_fields[] = $aKey;
							}
						}
					}
				}
				else
				{
					$validate = false;
					$error_fields[] = $key;
				}
			}
			else
			{
				if ($this->fields[$key]['required'] && ($this->fields[$key]['value'] == '' || strlen($this->fields[$key]['value'] <= 0)))
				{
					$validate = false;
					$error_fields[] = $key;
				}
				
				switch ($key)
				{
					case 'field_customer_number':
						if (strlen($this->fields[$key]['value']) > 20)
						{
							$validate = false;
							$error_fields[] = $key;
						}
					
						break;
						
					case 'field_website':
						break;
						
					default:
						break;
				}
			}
		}
		exit();
		return array('Result'=>$validate, 'Details'=>$error_fields);
	}
	
	public function addRecord()
	{
		return false;
	
		$error = false;
		$reasonCode = 0;
	
		$sql = "INSERT INTO tbl_survey_master (Type, CustNo, WebSiteURL) VALUES (?, ?, ?)";
		$query = $this->db->query($sql, array('storelocator', $this->fields['field_customer_number']['value'], $this->fields['field_website']['value']));
		if (!$query)
		{
			$error = true;
		}
		
		//$sql = "INSERT INTO tbl_survey_address () VALUES ()";
	}
}

?>