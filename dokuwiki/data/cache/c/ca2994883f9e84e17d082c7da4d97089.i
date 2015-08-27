a:120:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"Laravel Request";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:32;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"Accessing The Request";i:1;i:3;i:2;i:32;}i:2;i:32;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:32;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:32;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:74:"There are 3 main points that we need to remember when working with request";}i:2;i:65;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:140;}i:9;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:140;}i:10;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:140;}i:11;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:140;}i:12;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:57:" Type-hint the Illuminate\Http\Request in the controllers";}i:2;i:148;}i:13;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:205;}i:14;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:205;}i:15;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:3;}i:2;i:205;}i:16;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:205;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:63:"     Type Request as a parameter of function in the controllers";}i:2;i:209;}i:18;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:272;}i:19;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:272;}i:20;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:3;}i:2;i:272;}i:21;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:272;}i:22;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:61:"     Create form with method is post, put, delete in the view";}i:2;i:276;}i:23;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:337;}i:24;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:337;}i:25;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:3;}i:2;i:337;}i:26;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:337;}i:27;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"     Create route to access this ";}i:2;i:341;}i:28;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:374;}i:29;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:374;}i:30;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:374;}i:31;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:374;}i:32;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:42:"In app/Http/Controllers/UserController.php";}i:2;i:375;}i:33;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:417;}i:34;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:405:"
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Routing\Controller;

class UserController extends Controller
{
    /**
     * Update the specified user.
     *
     * @param    Request  $request
     * @param    int  $id
     * @return  Response
     */
    public function update(Request $request, $id)
    {
        return "UserId {$id} is updated successfullly!";
    }
}
";i:1;s:3:"php";i:2;N;}i:2;i:424;}i:35;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:424;}i:36;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:"In routes :";}i:2;i:843;}i:37;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:854;}i:38;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:209:"
Route::put('user8/{id}', 'UserController@update');
Route::post('user8/{id}', 'UserController@update');
Route::delete('user8/{id}', 'UserController@update');
Route::get('user8/{id}', 'UserController@update');
";i:1;s:3:"php";i:2;N;}i:2;i:861;}i:39;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1083;}i:40;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"Basic Request Information";i:1;i:2;i:2;i:1083;}i:2;i:1083;}i:41;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1083;}i:42;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1122;}i:43;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:26:"Retrieving The Request URI";i:1;i:3;i:2;i:1122;}i:2;i:1122;}i:44;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1122;}i:45;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1122;}i:46;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:38:"The path method returns the request's ";}i:2;i:1159;}i:47;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"URI";}i:2;i:1197;}i:48;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:45:". So, if the incoming request is targeted at ";}i:2;i:1200;}i:49;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:25:"http://domain.com/foo/bar";i:1;N;}i:2;i:1245;}i:50;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:38:", the path method will return foo/bar:";}i:2;i:1270;}i:51;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1308;}i:52;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:148:"
// function in UserController.php
public function getRequestPath(Request $request)
{
	$uri = $request->path();
	return "Request path is {$uri}";
}
";i:1;s:3:"php";i:2;N;}i:2;i:1315;}i:53;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1315;}i:54;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"To get the full ";}i:2;i:1476;}i:55;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"URL";}i:2;i:1492;}i:56;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:77:", not just the path info, you may use the url method on the request instance:";}i:2;i:1495;}i:57;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1572;}i:58;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:157:"
// function in UserController.php
public function getRequestFullPath(Request $request) {
	$uri = $request->url ();
	return "Request full path is {$uri}";
}
";i:1;s:3:"php";i:2;N;}i:2;i:1579;}i:59;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1579;}i:60;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:61:"The is method allows you to verify that the incoming request ";}i:2;i:1750;}i:61;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"URI";}i:2;i:1811;}i:62;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:96:" matches a given pattern. You may use the * character as a wildcard when utilizing this method: ";}i:2;i:1814;}i:63;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1910;}i:64;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:233:"
// function in UserController.php
public function getRequestMatch(Request $request) {
	if ($request->is ( 'user10/*' )) {
		return "Request path match with user10";
	} else {
		return "Request path does not match with user10";
	}
}
";i:1;s:3:"php";i:2;N;}i:2;i:1917;}i:65;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2164;}i:66;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:29:"Retrieving The Request Method";i:1;i:3;i:2;i:2164;}i:2;i:2164;}i:67;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:2164;}i:68;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2164;}i:69;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:150:"The method method will return the HTTP verb for the request. You may also use the isMethod method to verify that the HTTP verb matches a given string:";}i:2;i:2205;}i:70;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2355;}i:71;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:197:"
public function checkMethod(Request $request) {
	$method = $request->method();
	if ($request->isMethod('post')) {
		return "This is Post method.";
	}
	else {
		return "{$method} method ...";
	}
}
";i:1;s:3:"php";i:2;N;}i:2;i:2362;}i:72;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2574;}i:73;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"Retrieving Input";i:1;i:2;i:2;i:2574;}i:2;i:2574;}i:74;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2574;}i:75;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2604;}i:76;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"Retrieving All Input Data";i:1;i:3;i:2;i:2604;}i:2;i:2604;}i:77;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:2604;}i:78;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2604;}i:79;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:78:"You may also retrieve all of the input data as an array using the all method: ";}i:2;i:2640;}i:80;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2724;}i:81;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:27:"
$input = $request->all();
";i:1;s:3:"php";i:2;N;}i:2;i:2724;}i:82;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2769;}i:83;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"Retrieving An Input Value";i:1;i:3;i:2;i:2769;}i:2;i:2769;}i:84;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:2769;}i:85;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2769;}i:86;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:102:"Using a few simple methods, you may access all user input from your Illuminate\Http\Request instance. ";}i:2;i:2805;}i:87;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2907;}i:88;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:34:"
$name = $request->input('name');
";i:1;s:3:"php";i:2;N;}i:2;i:2914;}i:89;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2963;}i:90;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:40:"Determining If An Input Value Is Present";i:1;i:3;i:2;i:2963;}i:2;i:2963;}i:91;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:2963;}i:92;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2963;}i:93;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:157:"To determine if a value is present on the request, you may use the has method. The has method returns true if the value is present and is not an empty string";}i:2;i:3015;}i:94;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3172;}i:95;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:157:"
// In UserController.php
public function retriveInputs(Request $request) {
	if ($request->has('email')) {
		echo "Name is {$request->input('email')}";
	}
}
";i:1;s:3:"php";i:2;N;}i:2;i:3179;}i:96;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3351;}i:97;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:38:"Retrieving A Portion Of The Input Data";i:1;i:3;i:2;i:3351;}i:2;i:3351;}i:98;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3351;}i:99;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3351;}i:100;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:161:"If you need to retrieve a sub-set of the input data, you may use the only and except methods. Both of these methods accept a single array as their only argument:";}i:2;i:3400;}i:101;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3561;}i:102;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:92:"
$input = $request->only('username', 'password');
$input = $request->except('credit_card');
";i:1;s:3:"php";i:2;N;}i:2;i:3568;}i:103;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3675;}i:104;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:29:"Flashing Input To The Session";i:1;i:3;i:2;i:3675;}i:2;i:3675;}i:105;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3675;}i:106;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:20:"
$request->flash();
";i:1;s:3:"php";i:2;N;}i:2;i:3720;}i:107;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3756;}i:108;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"Retrieving Old Data";i:1;i:3;i:2;i:3756;}i:2;i:3756;}i:109;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3756;}i:110;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:40:"
$username = $request->old('username');
";i:1;s:3:"php";i:2;N;}i:2;i:3792;}i:111;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3847;}i:112;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:35:"Retrieving Cookies From The Request";i:1;i:3;i:2;i:3847;}i:2;i:3847;}i:113;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3847;}i:114;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3847;}i:115;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:296:"All cookies created by the Laravel framework are encrypted and signed with an authentication code, meaning they will be considered invalid if they have been changed by the client. To retrieve a cookie value from the request, you may use the cookie method on the Illuminate\Http\Request instance .";}i:2;i:3893;}i:116;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4189;}i:117;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:36:"
$value = $request->cookie('name');
";i:1;s:3:"php";i:2;N;}i:2;i:4196;}i:118;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4248;}i:119;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:4248;}}