<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

	if ( ! function_exists('getDomain'))
	{
		function getDomain()
		{
			$CI =& get_instance();
			return preg_replace("/^[\w]{2,6}:\/\/([\w\d\.\-]+).*$/","$1", $CI->config->slash_item('base_url'));
		}
	}	
	
	if ( ! function_exists('getTPL'))
	{
		function getTPL($tplfile)
		{
			
			$CI =& get_instance();
			
			$WebSiteID = $CI->session->userdata('WebSiteID');
			
			$tpl=$WebSiteID."/".$tplfile.".tpl";
			
			if ( ! file_exists('application/views/smarty_templates/'.$tpl))
			{
				if ( ! file_exists('application/views/smarty_templates/common/'.$tplfile.'.tpl'))
				{
					show_404();
				}
				else
				{
					$tpl="common/".$tplfile.".tpl";			
				}
			}	
			return $tpl;
		}
	}
	
	if ( ! function_exists('get_website_url'))
	{
		function get_website_url()
		{
			switch (get_webid())
			{
				case 'dv':
					return 'http://www.davincibaby.com';
					break;
				case 'bl':
					return 'https://www.babyletto.com';
					break;
				case 'fb':
					return 'http://www.franklinandben.com';
					break;
				case 'nw':
					return 'http://www.nurseryworks.net';
					break;
				case 'mdb':
					return 'http://www.milliondollarbaby.com';
					break;
				case 'themdbfamily':
					return 'http://www.themdbfamily.com';
					break;
			}
		}
	}
	
	if ( ! function_exists('get_datediff'))
	{
		function get_datediff($date,$type='')
		{		
			$tempdate=explode('/',$date);
			$date= "20".$tempdate[2]."-".$tempdate[0]."-".$tempdate[1];
			
			$diff = strtotime($date)-strtotime(date('Y-m-d'));
			$rs = floor(($diff/ (60*60*24)));
			if ($type=='w')
			{
				$rs=floor($rs/7);
			}
			return $rs;			
		}
	}
	
	if ( ! function_exists('get_dateranges'))
	{
		function get_dateranges($startdaynames,$week,$shorttag=1)
		{
			$daynames = array('','monday','tuesday','wednesday','thursday','friday','saturday','sunday');
			
			if ($week>=0)
			{
				$week='+'.($week*7);
			}
			else
			{
				$week=$week*7;
			}
			
			
			$from = date('Y-m-d',strtotime($daynames[$startdaynames].' this week'))." 00:00:00";
			$from =  date('Y-m-d',strtotime($from." ".$week." day"))." 00:00:00";		
			$shortfrom =  date('F d',strtotime($from));
			
			$to = date('Y-m-d',strtotime($from." +6 day"))." 00:00:00";
			$shortto=date('F d',strtotime($from." +6 day"));
			if ($shorttag==1)
			{
				$daterange=array('from'=>$from,'to'=>$to);
			}
			else
			{
				$daterange=array('from'=>$shortfrom,'to'=>$shortto);
			}
			return $daterange;
		}
	}	
	
	if ( ! function_exists('absolute_path'))
	{
		function absolute_path($path = '')
		{
			$abs_path = str_replace('system/',$path, BASEPATH);
			//Add a trailing slash if it doesn't exist.
			$abs_path = preg_replace("#([^/])/*$#", "\\1/", $abs_path);
			return $abs_path;
		}
	}
	
	if ( ! function_exists('current_url'))
	{
		function current_url()
		{
			$CI =& get_instance();

			$url = $CI->config->site_url($CI->uri->uri_string());
			
			return $_SERVER['QUERY_STRING'] ? $url.'?'.$_SERVER['QUERY_STRING'] : $url;
		}
	}
	
	if ( ! function_exists('get_webid'))
	{
		function get_webid()
		{
			$CI =& get_instance();
		
			return $CI->uri->segment(1);
		}
	}
	
	if ( ! function_exists('encrypt_filename'))
	{
		function encrypt_filename($filename)
		{		
			$newfile=md5($filename.Date('YmdHis').rand (10000,99999));
			$newfilename="c:\\inetpub\\hrm\\application\\files\\".$newfile;

			while (file_exists($newfilename))
			{
				$newfile=md5($filename.Date('YmdHis').rand (10000,99999));				
				$newfilename="c:\\inetpub\\hrm\\application\\files\\".$newfile;
			}		
			return $newfile;
		}
	}
	
	
	if ( ! function_exists('formatSizeUnits'))
	{
		function formatSizeUnits($bytes)
		{
			if ($bytes >= 1073741824)
			{
				$bytes = number_format($bytes / 1073741824, 2) . ' GB';
			}
			elseif ($bytes >= 1048576)
			{
				$bytes = number_format($bytes / 1048576, 2) . ' MB';
			}
			elseif ($bytes >= 1024)
			{
				$bytes = number_format($bytes / 1024, 2) . ' KB';
			}
			elseif ($bytes > 1)
			{
				$bytes = $bytes . ' bytes';
			}
			elseif ($bytes == 1)
			{
				$bytes = $bytes . ' byte';
			}
			else
			{
				$bytes = '0 bytes';
			}

			return $bytes;
		}
	}
	
	if ( ! function_exists('getFileExtension'))
	{
		function getFileExtension($fileName)
		{
		   $parts=explode(".",$fileName);
		   return $parts[count($parts)-1];
		}
	}
	
	if ( ! function_exists('mssql_real_escape_string'))
	{
		function mssql_real_escape_string($s) {
			if(get_magic_quotes_gpc()) {
				$s = stripslashes($s);
			}
			$s = str_replace("'","''",$s);
			return $s;
		}
	}
	
	if ( ! function_exists('html_escape_string'))
	{
		function html_escape_string($s) {
			//$s=htmlentities($s, ENT_QUOTES);
			$s=str_replace('"','&quot;',$s);
			$s=str_replace('\\','&#92;',$s);
			$s=str_replace('<','&lt;',$s);
			$s=str_replace('>','&gt;',$s);
			return $s;
		}
	}
	
	
	if ( ! function_exists('mime_content_type'))
	{		
		function mime_content_type($filename) 
		{
			$CI =& get_instance();
			$mime_types = array(

				'txt' => 'text/plain',
				'htm' => 'text/html',
				'html' => 'text/html',
				'php' => 'text/html',
				'css' => 'text/css',
				'js' => 'application/javascript',
				'json' => 'application/json',
				'xml' => 'application/xml',
				'swf' => 'application/x-shockwave-flash',
				'flv' => 'video/x-flv',

				// images
				'png' => 'image/png',
				'jpe' => 'image/jpeg',
				'jpeg' => 'image/jpeg',
				'jpg' => 'image/jpeg',
				'gif' => 'image/gif',
				'bmp' => 'image/bmp',
				'ico' => 'image/vnd.microsoft.icon',
				'tiff' => 'image/tiff',
				'tif' => 'image/tiff',
				'svg' => 'image/svg+xml',
				'svgz' => 'image/svg+xml',

				// archives
				'zip' => 'application/zip',
				'rar' => 'application/x-rar-compressed',
				'exe' => 'application/x-msdownload',
				'msi' => 'application/x-msdownload',
				'cab' => 'application/vnd.ms-cab-compressed',

				// audio/video
				'mp3' => 'audio/mpeg',
				'qt' => 'video/quicktime',
				'mov' => 'video/quicktime',

				// adobe
				'pdf' => 'application/pdf',
				'psd' => 'image/vnd.adobe.photoshop',
				'ai' => 'application/postscript',
				'eps' => 'application/postscript',
				'ps' => 'application/postscript',

				// ms office
				'doc' => 'application/msword',
				'rtf' => 'application/rtf',
				'xls' => 'application/vnd.ms-excel',
				'ppt' => 'application/vnd.ms-powerpoint',

				// open office
				'odt' => 'application/vnd.oasis.opendocument.text',
				'ods' => 'application/vnd.oasis.opendocument.spreadsheet',
			);

			$ext = strtolower(array_pop(explode('.',$filename)));
			if (array_key_exists($ext, $mime_types)) {
				return $mime_types[$ext];
			}
			elseif (function_exists('finfo_open')) {
				$finfo = finfo_open(FILEINFO_MIME);
				$mimetype = finfo_file($finfo, $filename);
				finfo_close($finfo);
				return $mimetype;
			}
			else {
				return 'application/octet-stream';
			}
		}
	}
	
	if ( ! function_exists('time_since'))
	{
		function time_since($published) {
		
			$now = new DateTime();	
			$diff = date_diff($published, $now);
			$timesince = '';

			if($diff->y > 0 || $diff->m > 0) {
				$timesince = 'Over 1 month ago';
			} elseif ($diff->d > 1) {
				$timesince = $diff->d . ' days ago';
			} elseif ($diff->d == 1) {
				$timesince = $diff->d . ' day ago';
			} elseif ($diff->h > 1) {
				$timesince = $diff->h . ' hours ago';
			} elseif ($diff->h == 1) {
				$timesince = $diff->h . ' hour ago';
			} elseif ($diff->i > 1) {
				$timesince = $diff->i . ' minutes ago';
			} elseif ($diff->i == 1) {
				$timesince = $diff->i . ' minute ago';
			} else {
				$timesince = '< 1 minute ago';
			}		
			
			return $timesince;
		}
	}
	
	if ( ! function_exists('convert_paragraph_to_html'))
	{
		function convert_paragraph_to_html($content) {
			
			$content = str_replace(array("\r\n", "\r", "\n", "<br />", "<br>", "&#13;"), "<br>", $content);
			
			return $content;
		}
	}
	
	/*
	/////   Message     ////
		//// message data ////
		$messageDisplay = 3;//0 or 1: 1 is POP-UP Display(defalut);0 is Page Display
		$messageType = 0;//0 or 1: 1 is Correct Message(defalut);0 is Error Message
		$messageTitle = 'Register';
		$messageContent = 'Register successful!';
		$messageURL = 'http://www.baidu.com';
		
		$this->message_model->set_messageDisplay($messageDisplay);
		$this->message_model->set_messageType($messageType);
		$this->message_model->set_messageTitle($messageTitle);
		$this->message_model->set_messageContent($messageContent);
		$this->message_model->set_messageURL($messageURL);
		$this->smarty_data['message'] = $this->message_model->set_message();
	/////  End of Create Message     ////
	*/
	
	if ( ! function_exists('send_form') )
	{
		function send_form($data, $body)
		{
			$CI =& get_instance();
			
			$error = false;

			// clean up inputs
			$name = trim($data['name']); 
			$email = trim($data['email']); 
			$message = str_replace(array("\r\n", "\r", "\n", "<br />", "<br>", "&#13;"), "\r\n", $data['message']);
			$message = trim($message);
			
			// see if anything's blank or e-mail is not valid
			if(empty($name) || empty($email) || empty($message)) {
				$error = 'empty';	
			}
			if(!filter_var($email, FILTER_VALIDATE_EMAIL)) {
				$error = 'email';
			}
			
			// if there was an error, send them back
			if($error !== false) {
				return $error;
			} else {
			// mail if no errors
		
			// Set up mail
			$CI->load->file(APPPATH.'third_party/phpmailer/class.phpmailer.php');
			$mail = new PHPMailer();

			$mail->IsSMTP(); // telling the class to use SMTP
			$mail->SMTPDebug  = 0;                     // enables SMTP debug information (for testing)
			$mail->SMTPAuth   = true;                  // enable SMTP authentication
			$mail->Host       = "west.exch021.serverdata.net"; // sets the SMTP server
			$mail->Port       = 465;                    // set the SMTP port for the GMAIL server
			$mail->SMTPSecure = 'tls'; 
			$mail->Username   = "info@mdbmail.com"; // SMTP account username
			$mail->Password   = "Million1!";        // SMTP account password
			
			// Send mail to MDB
			$mail->SetFrom($email, $name);
			$mail->AddReplyTo($email, $name);
			// $mail->AddAddress('rebecca@welllinkhk.com', 'rebecca@welllinkhk.com');
			$mail->AddAddress('marston@welllinkhk.com', 'marston@welllinkhk.com');
			//$mail->AddAddress('info@mdbmail.com', 'info@mdbmail.com');
			$mail->Subject    = 'The MDB Family: Contact form submission from '.$name;
			$mail->AltBody = 'Contact form submission from '.$CI->config->base_url().':
			Name: '.$name.'
			Email: '.$email.'
			Message: '.$message.'
			Sent at: '.date('m/d/Y h:i:s a', time());
			$mail->MsgHTML($body);
			
			return($mail->Send());
			}
		}
	}
?>