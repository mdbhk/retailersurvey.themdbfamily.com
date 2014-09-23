<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Message {

	/*======================================
	Manual
	Auto Load Library
	
	$this->message->set_method(1);
	// 0: Inline HTML; 1: Pop-up
	
	$this->message->set_type(0);
	// -1: Error; 0: Normal; 1: Correct
	
	$this->message->set_title('A New Title');
	$this->message->set_content('A New Content');
	$this->message->set_url('http://hk.yahoo.com');
	$this->smarty_data['message'] = $this->message->set_message();
	
	header('Location: /');
	=======================================*/

	public $message = array();
	
	public function __construct()
	{
		$this->CI = & get_instance();
		$this->set_message();
	}
	
	public function set_method($messageDisplay)
	{
		$this->CI->session->set_flashdata('message_method', $messageDisplay);
	}
	
	public function set_type($messageType)
	{
		$this->CI->session->set_flashdata('message_type', $messageType);
	}
	
	public function set_title($messageTitle)
	{
		$this->CI->session->set_flashdata('message_title', $messageTitle);
	}
	
	public function set_content($messageContent)
	{
		$this->CI->session->set_flashdata('message_content', $messageContent);
	}
	
	public function set_url($messageURL)
	{
		$this->CI->session->set_flashdata('message_url', $messageURL);
	}
		
	public function set_message($show = 1, $method = 0, $type = 0, $title = 'error message', $content = '', $url = '#')
	{
		$this->message['show'] = $show;
		$this->message['method'] = ($this->CI->session->flashdata('message_method') ? $this->CI->session->flashdata('message_method') : $method);
		$this->message['type'] = ($this->CI->session->flashdata('message_type') ? $this->CI->session->flashdata('message_type') : $type);
		$this->message['title'] = ($this->CI->session->flashdata('message_title') ? $this->CI->session->flashdata('message_title') : $title);
		$this->message['content'] = ($this->CI->session->flashdata('message_content') ? $this->CI->session->flashdata('message_content') : $content);
		$this->message['url'] = ($this->CI->session->flashdata('message_url') ? $this->CI->session->flashdata('message_url') : $url);
		
		return $this->message;
	}
}