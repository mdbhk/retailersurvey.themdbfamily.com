<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Common {

    public function timesince($published) {
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
	
	public function send_form($data)	{
		
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
		$this->load->add_package_path(APPPATH.'third_party/phpmailer/class.phpmailer.php');
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
		$mail->AltBody = 'Contact form submission from '.$this->config->base_url().':
		Name: '.$name.'
		Email: '.$email.'
		Message: '.$message.'
		Sent at: '.date('m/d/Y h:i:s a', time());
		$mail->MsgHTML($body);
		
		return($mail->Send());
		}
	}
}