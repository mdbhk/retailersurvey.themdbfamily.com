<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Foxy {

	/*======================================
	Manual
	$this->load->library('foxy');
	
	$this->foxy->set_cart_url('https://mdbtesting.foxycart.com/cart');
	$this->foxy->set_attribute('name', 'Cool Example');
	$this->foxy->set_attribute('price', '10');
	$this->foxy->set_attribute('code', 'sku123');
	
	$option[] = array('name'=>'Small', 'value'=>'small');
	$option[] = array('name'=>'Medium', 'value'=>'medium');
	$option[] = array('name'=>'Large', 'value'=>'large');
	
	$this->foxy->set_attribute('size', '', 'select', 'size', $option);
	$this->smarty_data['foxy'] = $this->foxy->create_foxy_product();
	=======================================*/

	public $foxy;
	public $cartUrl = 'https://mdbtesting.foxycart.com/cart';
	public $attributes = array();
	public $buttonTitle = 'buy now';
	
	public function __construct()
	{
		$this->CI = & get_instance();
	}
	
	public function set_cart_url($url)
	{
		$this->cartUrl = $url;
	}
	
	public function set_attribute($attr, $value, $type = 'hidden', $label = '', $option = '')
	{
		$this->attributes[] = array('name'=>$attr, 'val'=>$value, 'type'=>$type, 'label'=>$label, 'option'=>$option);
	}
		
	public function create_foxy_product()
	{
		$foxy = '<form action ="'.$this->cartUrl.'" method="post" accept-charset="utf-8">';
		
		foreach ($this->attributes AS $attribute)
		{
			switch ($attribute['type'])
			{
				case 'hidden':
					$foxy .= '<input type="'.$attribute['type'].'" name="'.$attribute['name'].'" value="'.$attribute['val'].'" />';
					break;
					
				case 'select':
					$foxy .= '<label for="'.$attribute['name'].'">'.$attribute['label'].'</label>';
					$foxy .= '<select name="'.$attribute['name'].'">';
					$foxy .= '';
					foreach ($attribute['option'] AS $option)
					{
						$foxy .= '<option value="'.$option['value'].'">'.$option['name'].'</option>';
					}
					$foxy .= '</select>';
					break;
				
				default:
					break;
			}
		}
		
		$foxy .= '<input type="submit" name="'.$this->buttonTitle.'" value="'.$this->buttonTitle.'" class="submit" />';
		$foxy .= '</form>';
		
		return $foxy;
	}
}