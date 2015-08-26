a:86:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"Laravel Response";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:33;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"Basic Responses";i:1;i:2;i:2;i:33;}i:2;i:33;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:33;}i:6;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:62;}i:7;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:29:"Returning Strings From Routes";i:1;i:3;i:2;i:62;}i:2;i:62;}i:8;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:62;}i:9;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:60:"
Route::get('/', function()
{
    return 'Hello World';
});
";i:1;s:3:"php";i:2;N;}i:2;i:108;}i:10;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:182;}i:11;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"Creating Custom Responses";i:1;i:3;i:2;i:182;}i:2;i:182;}i:12;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:182;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:182;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:147:" A Response instance inherits from the Symfony\Component\HttpFoundation\Response class, providing a variety of methods for building HTTP responses:";}i:2;i:218;}i:15;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:365;}i:16;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:121:"
use Illuminate\Http\Response;

return (new Response($content, $status))
              ->header('Content-Type', $value);
";i:1;s:3:"php";i:2;N;}i:2;i:372;}i:17;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:372;}i:18;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:54:"For convenience, you may also use the response helper:";}i:2;i:507;}i:19;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:561;}i:20;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:84:"
return response($content, $status)
              ->header('Content-Type', $value);
";i:1;s:3:"php";i:2;N;}i:2;i:568;}i:21;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:665;}i:22;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:28:"Sending A View In A Response";i:1;i:3;i:2;i:665;}i:2;i:665;}i:23;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:665;}i:24;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:66:"
return response()->view('hello')->header('Content-Type', $type);
";i:1;s:3:"php";i:2;N;}i:2;i:710;}i:25;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:790;}i:26;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"Redirects";i:1;i:2;i:2;i:790;}i:2;i:790;}i:27;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:790;}i:28;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:790;}i:29;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:160:"Redirect responses are typically instances of the Illuminate\Http\RedirectResponse class, and contain the proper headers needed to redirect the user to another ";}i:2;i:813;}i:30;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"URL";}i:2;i:973;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:".";}i:2;i:976;}i:32;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:977;}i:33;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:979;}i:34;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:36:"Returning A Redirect With Flash Data";i:1;i:3;i:2;i:979;}i:2;i:979;}i:35;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:979;}i:36;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:65:"
return redirect('user/login')->with('message', 'Login Failed');
";i:1;s:3:"php";i:2;N;}i:2;i:1032;}i:37;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1111;}i:38;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:31:"Redirecting To The Previous URL";i:1;i:3;i:2;i:1111;}i:2;i:1111;}i:39;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1111;}i:40;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:69:"
return redirect()->back();

return redirect()->back()->withInput();
";i:1;s:3:"php";i:2;N;}i:2;i:1159;}i:41;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1243;}i:42;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:37:"Returning A Redirect To A Named Route";i:1;i:3;i:2;i:1243;}i:2;i:1243;}i:43;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1243;}i:44;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:258:"
return redirect()->route('login');

// with parameters
// For a route with the following URI: profile/{id}
return redirect()->route('profile', [1]);

// For a route with the following URI: profile/{user}
return redirect()->route('profile', ['user' => 1]);

";i:1;s:3:"php";i:2;N;}i:2;i:1296;}i:45;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1568;}i:46;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:43:"Returning A Redirect To A Controller Action";i:1;i:3;i:2;i:1568;}i:2;i:1568;}i:47;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1568;}i:48;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:287:"
return redirect()->action('App\Http\Controllers\HomeController@index');

// with parameters
return redirect()->action('App\Http\Controllers\UserController@profile', [1]);

// with named parameters
return redirect()->action('App\Http\Controllers\UserController@profile', ['user' => 1]);
";i:1;s:3:"php";i:2;N;}i:2;i:1628;}i:49;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1929;}i:50;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"Other Responses";i:1;i:2;i:2;i:1929;}i:2;i:1929;}i:51;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1929;}i:52;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1929;}i:53;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:310:"The response helper may be used to conveniently generate other types of response instances. When the response helper is called without arguments, an implementation of the Illuminate\Contracts\Routing\ResponseFactory contract is returned. This contract provides several helpful methods for generating responses.";}i:2;i:1957;}i:54;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2267;}i:55;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2269;}i:56;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:24:"Creating A JSON Response";i:1;i:3;i:2;i:2269;}i:2;i:2269;}i:57;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:2269;}i:58;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2269;}i:59;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:83:"The json method will automatically set the Content-Type header to application/json:";}i:2;i:2304;}i:60;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2393;}i:61;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:66:"
return response()->json(['name' => 'Abigail', 'state' => 'CA']);
";i:1;s:3:"php";i:2;N;}i:2;i:2393;}i:62;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2473;}i:63;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"Creating A JSONP Response";i:1;i:3;i:2;i:2473;}i:2;i:2473;}i:64;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:2473;}i:65;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:126:"
return response()->json(['name' => 'Abigail', 'state' => 'CA'])
                 ->setCallback($request->input('callback'));
";i:1;s:3:"php";i:2;N;}i:2;i:2515;}i:66;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2655;}i:67;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:33:"Creating A File Download Response";i:1;i:3;i:2;i:2655;}i:2;i:2655;}i:68;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:2655;}i:69;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:173:"
return response()->download($pathToFile);

return response()->download($pathToFile, $name, $headers);

return response()->download($pathToFile)->deleteFileAfterSend(true);
";i:1;s:3:"php";i:2;N;}i:2;i:2705;}i:70;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2892;}i:71;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"Response Macros";i:1;i:2;i:2;i:2892;}i:2;i:2892;}i:72;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2892;}i:73;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2892;}i:74;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:209:"If you would like to define a custom response that you can re-use in a variety of your routes and controllers, you may use the macro method on an implementation of Illuminate\Contracts\Routing\ResponseFactory.";}i:2;i:2921;}i:75;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3130;}i:76;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3130;}i:77;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:51:"For example, from a service provider's boot method:";}i:2;i:3132;}i:78;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3183;}i:79;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:415:"
<?php namespace App\Providers;

use Response;
use Illuminate\Support\ServiceProvider;

class ResponseMacroServiceProvider extends ServiceProvider {

    /**
     * Perform post-registration booting of services.
     *
     * @return void
     */
    public function boot()
    {
        Response::macro('caps', function($value)
        {
            return Response::make(strtoupper($value));
        });
    }

}
";i:1;s:3:"php";i:2;N;}i:2;i:3190;}i:80;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3190;}i:81;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:212:"The macro function accepts a name as its first argument, and a Closure as its second. The macro's Closure will be executed when calling the macro name from a ResponseFactory implementation or the response helper:";}i:2;i:3619;}i:82;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3831;}i:83;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:33:"
return response()->caps('foo');
";i:1;s:3:"php";i:2;N;}i:2;i:3838;}i:84;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3883;}i:85;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:3883;}}