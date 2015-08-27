a:57:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"Laravel Views";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:30;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:11:"Basic Usage";i:1;i:2;i:2;i:30;}i:2;i:30;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:30;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:30;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"Views contain the ";}i:2;i:55;}i:8;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:4:"HTML";}i:2;i:73;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:189:" served by your application, and serve as a convenient method of separating your controller and domain logic from your presentation logic. Views are stored in the resources/views directory.";}i:2;i:77;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:266;}i:11;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:266;}i:12;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:"A simple view looks like this:";}i:2;i:268;}i:13;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:304;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:137:"
<!-- View stored in resources/views/greeting.php -->
<html>
    <body>
        <h1>Hello, <?php echo $name; ?></h1>
    </body>
</html>
";i:1;s:11:"html4strict";i:2;N;}i:2;i:304;}i:15;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:304;}i:16;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:48:"The view may be returned to the browser like so:";}i:2;i:456;}i:17;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:510;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:84:"
Route::get('/', function()
{
    return view('greeting', ['name' => 'James']);
});
";i:1;s:3:"php";i:2;N;}i:2;i:510;}i:19;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:510;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:197:"Of course, views may also be nested within sub-directories of the resources/views directory. For example, if your view is stored at resources/views/admin/profile.php, it should be returned like so:";}i:2;i:608;}i:21;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:805;}i:22;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:38:"
return view('admin.profile', $data);
";i:1;s:3:"php";i:2;N;}i:2;i:812;}i:23;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:863;}i:24;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"Passing Data To Views";i:1;i:3;i:2;i:863;}i:2;i:863;}i:25;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:863;}i:26;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:156:"
// Using conventional approach
$view = view('greeting')->with('name', 'Victoria');

// Using Magic Methods
$view = view('greeting')->withName('Victoria');
";i:1;s:3:"php";i:2;N;}i:2;i:901;}i:27;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1071;}i:28;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:27:"Sharing Data With All Views";i:1;i:3;i:2;i:1071;}i:2;i:1071;}i:29;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1071;}i:30;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1071;}i:31;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:225:"Occasionally, you may need to share a piece of data with all views that are rendered by your application. You have several options: the view helper, the Illuminate\Contracts\View\Factory contract, or a wildcard view composer.";}i:2;i:1109;}i:32;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1340;}i:33;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:88:"
// helper
view()->share('data', [1, 2, 3]);

// facade
View::share('data', [1, 2, 3]);
";i:1;s:3:"php";i:2;N;}i:2;i:1340;}i:34;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1442;}i:35;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:28:"Determining If A View Exists";i:1;i:3;i:2;i:1442;}i:2;i:1442;}i:36;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1442;}i:37;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:51:"
if (view()->exists('emails.customer'))
{
    //
}
";i:1;s:3:"php";i:2;N;}i:2;i:1487;}i:38;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1553;}i:39;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:33:"Returning A View From A File Path";i:1;i:3;i:2;i:1553;}i:2;i:1553;}i:40;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1553;}i:41;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:42:"
return view()->file($pathToFile, $data);
";i:1;s:3:"php";i:2;N;}i:2;i:1603;}i:42;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1659;}i:43;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"View Composers";i:1;i:2;i:2;i:1659;}i:2;i:1659;}i:44;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1659;}i:45;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1659;}i:46;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:233:"View composers are callbacks or class methods that are called when a view is rendered. If you have data that you want to be bound to a view each time that view is rendered, a view composer organizes that logic into a single location.";}i:2;i:1686;}i:47;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1919;}i:48;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1921;}i:49;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:24:"Defining A View Composer";i:1;i:3;i:2;i:1921;}i:2;i:1921;}i:50;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1921;}i:51;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1921;}i:52;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:170:"Let's organize our view composers within a service provider. We'll use the View facade to access the underlying Illuminate\Contracts\View\Factory contract implementation:";}i:2;i:1956;}i:53;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2132;}i:54;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:644:"
<?php namespace App\Providers;

use View;
use Illuminate\Support\ServiceProvider;

class ComposerServiceProvider extends ServiceProvider {

    /**
     * Register bindings in the container.
     *
     * @return void
     */
    public function boot()
    {
        // Using class based composers...
        View::composer('profile', 'App\Http\ViewComposers\ProfileComposer');

        // Using Closure based composers...
        View::composer('dashboard', function($view)
        {

        });
    }

    /**
     * Register the service provider.
     *
     * @return void
     */
    public function register()
    {
        //
    }

}
";i:1;s:3:"php";i:2;N;}i:2;i:2132;}i:55;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2789;}i:56;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2789;}}