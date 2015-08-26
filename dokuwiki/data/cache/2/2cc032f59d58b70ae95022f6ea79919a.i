a:70:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"Laravel Routing";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:32;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"Basic Routing";i:1;i:3;i:2;i:32;}i:2;i:32;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:32;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:32;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:200:"You will define most of the routes for your application in the app/Http/routes.php file, which is loaded by the App\Providers\RouteServiceProvider class. The most basic Laravel routes simply accept a ";}i:2;i:57;}i:8;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"URI";}i:2;i:257;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:14:" and a Closure";}i:2;i:260;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:274;}i:11;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:262:"
Route::get('/', function () {
    return 'Hello World';
});

Route::post('foo/bar', function () {
    return 'Post data';
});

Route::put('foo/bar', function () {
    return 'Put data';
});

Route::delete('foo/bar', function () {
    return 'Delete data';
});

";i:1;s:3:"php";i:2;N;}i:2;i:281;}i:12;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:557;}i:13;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:38:"Registering A Route For Multiple Verbs";i:1;i:3;i:2;i:557;}i:2;i:557;}i:14;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:557;}i:15;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:557;}i:16;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:140:"Sometimes you may need to register a route that responds to multiple HTTP verbs. You may do so using the match method on the Route facade : ";}i:2;i:606;}i:17;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:752;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:144:"
Route::match(['get', 'post'], '/routing-submit', function () {
    return 'Registering A Route For Multiple Verbs such as: get and post.';
});
";i:1;s:3:"php";i:2;N;}i:2;i:752;}i:19;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:752;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:88:"Or, you may even register a route that responds to all HTTP verbs using the any method: ";}i:2;i:910;}i:21;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:998;}i:22;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:135:"
Route::any('foo', function () {
    return 'Register a route that responds to all HTTP verbs such as: post, delete, put, delete';
});
";i:1;s:3:"php";i:2;N;}i:2;i:1005;}i:23;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1153;}i:24;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"Route Parameters";i:1;i:3;i:2;i:1153;}i:2;i:1153;}i:25;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1153;}i:26;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:452:"
// Required Parameters
Route::get('user/{id}', function ($id) {
    return 'UserId '.$id;
});

Route::get('posts/{post}/comments/{comment}', function ($postId, $commentId) {
    return 'Post ' . $postId . ' for comment ' . $commentId;
});

//Optional Parameters

Route::get('user/{name?}', function ($name = null) {
    return "Username 1: " . $name;
});

Route::get('user/{name?}', function ($name = 'John') {
    return "Username 2: " . $name;
});

";i:1;s:3:"php";i:2;N;}i:2;i:1185;}i:27;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1651;}i:28;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:30:"Regular Expression Constraints";i:1;i:3;i:2;i:1651;}i:2;i:1651;}i:29;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1651;}i:30;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1651;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:224:"You may constrain the format of your route parameters using the where method on a route instance. The where method accepts the name of the parameter and a regular expression defining how the parameter should be constrained: ";}i:2;i:1692;}i:32;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1922;}i:33;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:361:"
Route::get('user/{name}', function ($name) {
    return "Username 3: " . $name;
})
->where('name', '[A-Za-z]+');

Route::get('user/{id}', function ($id) {
    return "Username 4: " . $id;
})
->where('id', '[0-9]+');

Route::get('user/{id}/{name}', 
function ($id, $name) {
    return "Username 5: " . $name;
})
->where(['id' => '[0-9]+', 'name' => '[a-z]+']);
";i:1;s:3:"php";i:2;N;}i:2;i:1922;}i:34;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2297;}i:35;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"Global Constraints";i:1;i:3;i:2;i:2297;}i:2;i:2297;}i:36;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:2297;}i:37;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2297;}i:38;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:207:"If you would like a route parameter to always be constrained by a given regular expression, you may use the pattern method. You should define these patterns in the boot method of your RouteServiceProvider : ";}i:2;i:2327;}i:39;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2534;}i:40;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:336:"

/**
 * Define your route model bindings, pattern filters, etc.
 *
 * @param    \Illuminate\Routing\Router  $router
 * @return  void
 */
public function boot(Router $router)
{
    $router->pattern('id', '[0-9]+');

    parent::boot($router);
}

...

Route::get('user/{id}', function ($id) {
    // Only called if {id} is numeric.
});

";i:1;s:3:"php";i:2;N;}i:2;i:2541;}i:41;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2891;}i:42;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"Named Routes";i:1;i:3;i:2;i:2891;}i:2;i:2891;}i:43;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:2891;}i:44;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2891;}i:45;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:171:"Named routes allow you to conveniently generate URLs or redirects for a specific route. You may specify a name for a route using the as array key when defining the route: ";}i:2;i:2914;}i:46;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3085;}i:47;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:561:"
Route::get('user6/profile', ['as' => 'profile', function () {
    return "User profile";
}]);

// You may also specify route names for controller actions:
Route::get('user7/profile/{id}', [
    'as' => 'profile-2', 'uses' => 'UserController@showProfile'
]);

// Route group
Route::group(['as' => 'admin::'], function () {
    Route::get('dashboard', ['as' => 'dashboard', function () {
        return "Route named admin::dashboard";
    }]);
    Route::get('dashboard', ['as' => 'orders', function () {
        return "Route named admin::orders";
    }]);
});
";i:1;s:3:"php";i:2;N;}i:2;i:3092;}i:48;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3092;}i:49;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:135:"Once you have assigned a name to a given route, you may use the route's name when generating URLs or redirects via the route function: ";}i:2;i:3667;}i:50;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3808;}i:51;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:218:"
$url = route('profile');
$redirect = redirect()->route('profile');

Route::get('user/{id}/profile', ['as' => 'profile-3', function ($id) {
    return "User profile 3";
}]);

//$url = route('profile-3', ['id' => 1]);

";i:1;s:3:"php";i:2;N;}i:2;i:3808;}i:52;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4040;}i:53;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:11:"Route Group";i:1;i:3;i:2;i:4040;}i:2;i:4040;}i:54;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:4040;}i:55;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:535:"
// Middleware
Route::group(['middleware' => 'auth'], function () {
    Route::get('/', function ()    {
        return "Uses Auth Middleware";
    });

    Route::get('user/profile', function () {
        return "Uses Auth Middleware";
    });
});

// Namespace
Route::group(['namespace' => 'Admin'], function()
{
    // Controllers Within The "App\Http\Controllers\Admin" Namespace

    Route::group(['namespace' => 'User'], function()
    {
        // Controllers Within The "App\Http\Controllers\Admin\User" Namespace
    });
});

";i:1;s:3:"php";i:2;N;}i:2;i:4067;}i:56;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4616;}i:57;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"Resource Controllers";i:1;i:3;i:2;i:4616;}i:2;i:4616;}i:58;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:4616;}i:59;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4616;}i:60;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:54:"we can register a resourceful route to the controller:";}i:2;i:4647;}i:61;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4707;}i:62;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:46:"
Route::resource('photo', 'PhotoController');
";i:1;s:3:"php";i:2;N;}i:2;i:4707;}i:63;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4707;}i:64;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:34:"Read more in Laravel Controller : ";}i:2;i:4766;}i:65;a:3:{i:0;s:12:"internallink";i:1;a:2:{i:0;s:22:"php:laravel:controller";i:1;s:18:"Laravel Controller";}i:2;i:4800;}i:66;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:4845;}i:67;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4845;}i:68;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4845;}i:69;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:4845;}}