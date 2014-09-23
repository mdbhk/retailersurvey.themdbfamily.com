<?php
class Message_model extends CI_Model {
	public $message = array();
	public $messageDisplay=1;//0 or 1: 1 is POP-UP Display(defalut);0 is Page Display
	public $messageType=1;//0 or 1: 1 is Correct Message(defalut);0 is Error Message
	public $messageTitle;
	public $messageContent;
	public $messageURL;
	
	public function __construct()
	{
		$this->load->database();	
		$this->load->library('session');
	}
	
	public function set_messageDisplay($messageDisplay)
	{
		$this->message->display=$messageDisplay;
	}
	
	public function set_messageType($messageType)
	{
		$this->message->type=$messageType;
	}
	
	public function set_messageTitle($messageTitle)
	{
		$this->message->title=$messageTitle;
	}
	
	public function set_messageContent($messageContent)
	{
		$this->message->content=$messageContent;
	}
	
	public function set_messageURL($messageURL)
	{
		$this->message->url=$messageURL;
	}
		
	public function set_message()
	{
		$message = array(
			'messageDisplay'=>$this->messageDisplay,
			'messageType'=>$this->messageType,
			'messageTitle'=>$this->messageTitle,
			'messageContent'=>$this->messageContent,
			'messageURL'=>$this->messageURL
		);
		//$this->session->set_flashdata('message',$message);
		//return $this->session->flashdata('message');
		return $message;
	}
	
}
?>