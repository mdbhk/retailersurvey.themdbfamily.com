<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	http://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There area two reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router what URI segments to use if those provided
| in the URL cannot be matched to a valid route.
|
*/
/*
//// Press route
$route['pressdownloads'] = 'press_downloads/brands/mdb';
$route['pressdownloads/(:any)/(:any)/(:any)'] = 'press_downloads/brands/$1/$2/$3';
$route['pressdownloads/(:any)/(:any)'] = 'press_downloads/brands/$1/$2';
$route['pressdownloads/(:any)'] = 'press_downloads/brands/$1';

//// Admin route
$route['adminpress/downloads'] = 'admin_press/downloads';
$route['adminpress/downloads/add'] = 'admin_press/downloads/add';
$route['adminpress/downloads/edit/(:num)'] = 'admin_press/downloads/edit/$1';
$route['adminpress/downloads/read/(:num)'] = 'admin_press/downloads/read/$1';
$route['adminpress/downloads/save'] = 'admin_press/downloads/save';
$route['adminpress/downloads/(:num)'] = 'admin_press/downloads/list/$1';

//// Brand route
$route['collections'] = "brand_collections/index";
$route['collections/(:any)'] = "brand_collections/display/$1";
$route['products'] = "brand_products/index";
$route['products/(:any)'] = "brand_products/display/$1";

//// File route
$route['images/(:any)/(:any)/(:any)'] = "file/get_file/$1/$2/$3/";
$route['images/(:any)'] = "file/get_file////$1";
$route['downloads/(:any)/(:any)/(:any)'] = "file/get_file/$1/$2/$3/";
$route['downloads/(:any)'] = "file/get_file////$1";

//$route['images/combine'] = "images/combine";
*/

//// Basic route
$route['ajax/(:any)/(:any)'] = "ajax/call_ajax/$1/$2";
$route['images/(:any)/(:any)/(:any)'] = "file/get_file/$1/$2/image/";
$route['images/rs/(:any)'] = "images/rs/$1";
$route['images/(:any)'] = "file/get_file///$1/";
$route['thumbnails/(:any)/(:any)/(:any)/(:any)'] = "file/get_file/$1/$2/thumbnails/$3";
$route['files/(:any)/(:num)/(:any)'] = "file/get_file/$1/$2//$3";
$route['files/(:num)'] = "file/get_file//$1//";
$route['(:any)'] = "index";
$route['(:any)/(:any)'] = "index";
$route['(:any)/(:any)/(:any)/(:any)'] = "index";
$route['(:any)/(:any)/(:any)/(:any)/(:any)'] = "index";
$route['(:any)/(:any)/(:any)/(:any)/(:any)/(:any)'] = "index";
$route['(:any)/(:any)/(:any)/(:any)/(:any)/(:any)/(:any)'] = "index";
//$route['(:any)'] = "redirect/view/$1";
//$route['(:any)'] = "redirect/view/$1";
$route['default_controller'] = "index";
$route['404_override'] = '';


/* End of file routes.php */
/* Location: ./application/config/routes.php */