a:78:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"Laravel Controller";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:35;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"Basic Controllers";i:1;i:3;i:2;i:35;}i:2;i:35;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:35;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:35;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:69:"To create a new controller, use the make:controller Artisan command: ";}i:2;i:63;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:138;}i:9;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:44:"
php artisan make:controller UserController
";i:1;N;i:2;N;}i:2;i:138;}i:10;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:138;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:159:"Here is an example of a basic controller class. All Laravel controllers should extend the base controller class included with the default Laravel installation:";}i:2;i:192;}i:12;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:357;}i:13;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:363:"
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;

class UserController extends Controller {
	/**
	 * Show the profile for the given user.
	 *
	 * @param  int $id        	
	 * @return  Response
	 */
	public function showProfile($id) {
		return view('user.profile', ['userid' => $id]);
	}
}
";i:1;s:3:"php";i:2;N;}i:2;i:357;}i:14;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:357;}i:15;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:41:"Define a route to access this controller ";}i:2;i:734;}i:16;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:775;}i:17;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:113:"
Route::get ( 'user-profile/{id}', [ 
		'uses' => 'UserController@showProfile',
		'as' => 'user-profile-2' 
] );
";i:1;s:3:"php";i:2;N;}i:2;i:782;}i:18;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:910;}i:19;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"Controller Middleware";i:1;i:3;i:2;i:910;}i:2;i:910;}i:20;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:910;}i:21;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:910;}i:22;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:63:"Middleware may be assigned to the controller's routes like so: ";}i:2;i:942;}i:23;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1005;}i:24;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:100:"
Route::get('profile', [
    'middleware' => 'auth',
    'uses' => 'UserController@showProfile'
]);
";i:1;s:3:"php";i:2;N;}i:2;i:1012;}i:25;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1012;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:292:"However, it is more convenient to specify middleware within your controller's constructor. Using the middleware method from your controller's constructor, you may easily assign middleware to the controller. You may even restrict the middleware to only certain methods on the controller class:";}i:2;i:1126;}i:27;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1418;}i:28;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:379:"
class UserController extends Controller
{
    /**
     * Instantiate a new UserController instance.
     *
     * @return  void
     */
    public function __construct()
    {
        $this->middleware('auth');

        $this->middleware('log', ['only' => ['fooAction', 'barAction']]);

        $this->middleware('subscribed', ['except' => ['fooAction', 'barAction']]);
    }
}
";i:1;s:3:"php";i:2;N;}i:2;i:1425;}i:29;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1819;}i:30;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:28:"RESTful Resource Controllers";i:1;i:3;i:2;i:1819;}i:2;i:1819;}i:31;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1819;}i:32;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1819;}i:33;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:48:"Ex : Create a Photo RESTful Resource Controller ";}i:2;i:1859;}i:34;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1907;}i:35;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1907;}i:36;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:17:"Add photo route :";}i:2;i:1909;}i:37;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1932;}i:38;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:46:"
Route::resource('photo', 'PhotoController');
";i:1;s:3:"php";i:2;N;}i:2;i:1932;}i:39;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1932;}i:40;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:39:"Basic functions in PhotoController file";}i:2;i:1992;}i:41;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2031;}i:42;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1627:"
namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class PhotoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return  Response
     */
    public function index()
    {
        return "Photo index function";
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return  Response
     */
    public function create()
    {
        return "Photo create function";
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param    Request  $request
     * @return  Response
     */
    public function store(Request $request)
    {
        return "Photo store function";
    }

    /**
     * Display the specified resource.
     *
     * @param    int  $id
     * @return  Response
     */
    public function show($id)
    {
        return "Photo show function";
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param    int  $id
     * @return  Response
     */
    public function edit($id)
    {
        return "Photo edit function";
    }

    /**
     * Update the specified resource in storage.
     *
     * @param    Request  $request
     * @param    int  $id
     * @return  Response
     */
    public function update(Request $request, $id)
    {
        return "Photo update function";
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param    int  $id
     * @return  Response
     */
    public function destroy($id)
    {
        return "Photo destroy function";
    }
}
";i:1;s:3:"php";i:2;N;}i:2;i:2038;}i:43;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3680;}i:44;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"Implicit Controllers";i:1;i:3;i:2;i:3680;}i:2;i:3680;}i:45;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3680;}i:46;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3680;}i:47;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:226:" Laravel allows you to easily define a single route to handle every action in a controller class. First, define the route using the Route::controller method . The controller method accepts two arguments. The first is the base ";}i:2;i:3710;}i:48;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"URI";}i:2;i:3936;}i:49;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:78:" the controller handles, while the second is the class name of the controller:";}i:2;i:3939;}i:50;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4017;}i:51;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4017;}i:52;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"In routes.php";}i:2;i:4019;}i:53;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4032;}i:54;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:47:"
Route::controller('users', 'UserController');
";i:1;s:3:"php";i:2;N;}i:2;i:4039;}i:55;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4039;}i:56;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:42:"In app/Http/Controllers/UserController.php";}i:2;i:4100;}i:57;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4142;}i:58;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:668:"
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;

class UserController extends Controller {
	/**
	 * Responds to requests to GET /users
	 */
	public function getIndex() {
		return "getIndex function";
	}
	
	/**
	 * Responds to requests to GET /users/show/1
	 */
	public function getShow($id) {
		return "getShow function";
	}
	
	/**
	 * Responds to requests to Post /users/show/1
	 */
	public function postShow($id) {
		return "getShow function";
	}
	
	/**
	 * Responds to requests to GET /users/admin-profile
	 */
	public function getAdminProfile() {
		return "getAdminProfile function";
	}
}
";i:1;s:3:"php";i:2;N;}i:2;i:4149;}i:59;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4831;}i:60;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"Nested Resources";i:1;i:3;i:2;i:4831;}i:2;i:4831;}i:61;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:4831;}i:62;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:63:"
Route::resource('photos.comments', 'PhotoCommentController');
";i:1;s:3:"php";i:2;N;}i:2;i:4862;}i:63;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4862;}i:64;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:"This route will register a ";}i:2;i:4938;}i:65;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:4965;}i:66;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"nested";}i:2;i:4966;}i:67;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:4972;}i:68;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:98:" resource that may be accessed with URLs like the following: photos/{photos}/comments/{comments}. ";}i:2;i:4973;}i:69;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5071;}i:70;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5073;}i:71;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:3:"...";i:1;i:3;i:2;i:5073;}i:2;i:5073;}i:72;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:5073;}i:73;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5088;}i:74;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:3:"...";i:1;i:3;i:2;i:5088;}i:2;i:5088;}i:75;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:5088;}i:76;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5103;}i:77;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:5103;}}