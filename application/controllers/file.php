<?php
	class File extends MY_Controller{
		public function __construct()
		{
			parent::__construct();		
			$this->load->model('file_model');				
		}
		
		
		/*
			URL :/thumbnails/{modelID}/{fileID}/{width}_{height}/{filename}
				eg : /thumbnails/handbook/1/100_100/1.jpg
			URL :/images/{modelID}/{fileID}/{filename}
				eg : /images/handbook/1/1.jpg
		*/
		public function get_file($modelID='',$id='',$filetype='',$filename='')		
		{							
			if ($id<>'')
			{						
				$fileinfo=$this->file_model->get_fileinfo($modelID,$id,$filetype);	
				if ($fileinfo['Status'])
				{
					if (file_exists(absolute_path().APPPATH.'files/'.$fileinfo['LocalFileName']))
					{				
						switch(strtolower($filetype))
						{
							case "thumbnails" :		
									$size=explode('_',$filename);
									if ((!(is_numeric($size[0]))) OR ($size[0]<=0))
									{
										show_404();
									}
									if ((!(is_numeric($size[1]))) OR ($size[0]<=0))
									{
										show_404();
									}
									
									$img = new SimpleImage();
									$img->load(absolute_path().APPPATH.'files/'.$fileinfo['LocalFileName'])->best_fit($size[0], $size[1]);	
									$img->output('jpg');									
							break;
							default:													
								$mm_type=mime_content_type($fileinfo['FileName']);
								header('Content-Description: File Transfer');
								header('Content-Type: '.$mm_type);
								header('Content-Disposition: '.$fileinfo['DispositionType'].'; filename='.basename($fileinfo['FileName']));
								header('Content-Transfer-Encoding: binary');
								header('Expires: 0');
								header('Cache-Control: must-revalidate');
								header('Pragma: public');
								header('Content-Length: ' . filesize(APPPATH.'files/'.$fileinfo['LocalFileName']));
								ob_clean();
								flush();
								readfile(APPPATH.'files/'.$fileinfo['LocalFileName']);						
						}
					}
				}
				else
				{
					show_404();
				}
			}
			else
			{
				show_404();
			}
		}		
	}
?>