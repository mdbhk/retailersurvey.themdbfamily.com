<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

	if ( ! function_exists('get_overview_list'))
	{
		function get_overview_list($db, $curr_record=0, $filter=false)
		{
			$ci =& get_instance();
			
			$webid=get_webid();
			$baseurl = $ci->config->base_url().'/'.$ci->uri->segment(1).'/'.$ci->uri->segment(2).'/'.$ci->uri->segment(3).'/'.$ci->uri->segment(4);
			
			$ci->grid_model->set_websiteID($webid);
			$ci->grid_model->set_modelID($ci->uri->segment(2));
			$ci->grid_model->set_actionID($ci->uri->segment(3));
			$ci->grid_model->set_database($db);
			$ci->grid_model->set_per_page(10);
			$ci->grid_model->set_base_url($baseurl);
			
			$data = $ci->grid_model->display_grid($curr_record, $filter);
			//print_r($data);
			$ci->smarty_data['webid'] = $webid;
			$ci->smarty_data['data'] = $data;
			return $data;
		}
	}
	
	if ( ! function_exists('get_cms_fields'))
	{
		function get_cms_fields($db, $action, $record_id='')
		{
			$ci =& get_instance();
			
			$webid=get_webid();
			$ci->cms_model->set_websiteID($webid);
			$ci->cms_model->set_modelID($ci->session->userdata('MethodID'));
			$ci->cms_model->set_actionID($ci->session->userData('FunctionID'));
			$ci->cms_model->set_database($db);
			$ci->cms_model->set_db_table($ci->cms_model->get_master_table());
			$FieldList = $ci->cms_model->get_editable_fields($record_id);
			
			$ci->smarty_data['webid'] = $webid;
			$ci->smarty_data['fields'] = $FieldList;
			$ci->smarty_data['action'] = $action;
		}
	}
	
	if ( ! function_exists('post_cms_form'))
	{
		function post_cms_form($db,$actionID='list',$action='new')
		{
			$ci =& get_instance();
			
			$webid=get_webid();
			$ci->cms_model->set_websiteID($webid);
			$ci->cms_model->set_modelID($ci->session->userdata('MethodID'));
			$ci->cms_model->set_actionID($ci->session->userdata('FunctionID'));
			$ci->cms_model->set_database($db);
			$ci->cms_model->set_db_table($ci->cms_model->get_master_table());
		
			switch ($action)
			{
				case 'read':
					
					break;
					
				case 'new':
					
					$result = $ci->cms_model->cms_insert_record($action);
					
					if (!$result['Result'])
					{
						$ci->message->set_method(1);
						$ci->message->set_type(1);
						$ci->message->set_title('Created Successfully');	
						$ci->message->set_content('Record was created.');
						$ci->smarty_data['message'] = $ci->message->set_message();
					}
					else
					{
						$ci->message->set_method(1);
						$ci->message->set_type(0);
						$ci->message->set_title('Error ocurred');	
						$ci->message->set_content($result['Reason']);
						$ci->smarty_data['message'] = $ci->message->set_message();
					}
					
					redirect($ci->session->userdata('BrandID').'/'.$ci->session->userdata('MethodID').'/'.$ci->session->userdata('FunctionID').'/list');
					
					break;
				
				case 'edit':
					
					$result = $ci->cms_model->cms_edit_record($action);
					
					if (!$result['Result'])
					{
						$ci->message->set_method(1);
						$ci->message->set_type(1);
						$ci->message->set_title('Updated Successfully');	
						$ci->message->set_content('Record was updated.');
						$ci->smarty_data['message'] = $ci->message->set_message();
					}
					else
					{
						$ci->message->set_method(1);
						$ci->message->set_type(0);
						$ci->message->set_title('Error ocurred');	
						$ci->message->set_content($result['Reason']);
						$ci->smarty_data['message'] = $ci->message->set_message();
					}
					
					redirect($ci->session->userdata('BrandID').'/'.$ci->session->userdata('MethodID').'/'.$ci->session->userdata('FunctionID').'/list', 'location', 301);
					
					break;
					
				default:
				
					break;
			}
		}
	}
?>