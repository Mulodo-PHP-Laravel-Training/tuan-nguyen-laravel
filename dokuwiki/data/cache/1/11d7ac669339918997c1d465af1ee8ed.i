a:157:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:24:"Laravel Package [Bundle]";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:41;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"1. Định nghĩa";i:1;i:1;i:2;i:41;}i:2;i:41;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:41;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:41;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:103:"Laravel Bundle: là những gói cài thêm mà bạn có thể download và cài plug in vào Laravel.";}i:2;i:73;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:176;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:176;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:75:"Từ phiên bản Laravel 4 trở lên bundle được thay bằng package.";}i:2;i:178;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:253;}i:12;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:253;}i:13;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:57:"Danh sách các package được tìm thấy ở đây : ";}i:2;i:255;}i:14;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:21:"http://packalyst.com/";i:1;s:12:"Package list";}i:2;i:312;}i:15;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:350;}i:16;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:350;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:85:"Các package có thể dễ dàng được thêm vào Laravel qua file composer.json.";}i:2;i:352;}i:18;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:437;}i:19;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:437;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:98:"Ex : Ta thêm 1 package Intervention Image, ta có thể dùng lệnh sau thêm vào composer.json";}i:2;i:439;}i:21;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:543;}i:22;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:48:"
$ php composer.phar require intervention/image
";i:1;N;i:2;N;}i:2;i:543;}i:23;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:601;}i:24;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:35:"2. Tích hợp Package vào Laravel";i:1;i:1;i:2;i:601;}i:2;i:601;}i:25;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:601;}i:26;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:652;}i:27;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"2.1 Service Providers";i:1;i:2;i:2;i:652;}i:2;i:652;}i:28;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:652;}i:29;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:652;}i:30;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:221:"Để tích hợp các package vào Laravel ta sử dụng Service Providers. Một Service provider có trách nhiệm ràng buộc các thứ vào Laravel và chỉ ra cho Laravel các resources như là views, config, ";}i:2;i:686;}i:31;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"...";}i:2;i:907;}i:32;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:910;}i:33;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:910;}i:34;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:94:"Ex: Thêm service provider cho package Intervention Image, ta thêm vào file config/app.php :";}i:2;i:912;}i:35;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1006;}i:36;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:169:"
// trong mảng providers thêm phần tử
Intervention\Image\ImageServiceProvider::class
// thêm alias class
'Image'     => Intervention\Image\Facades\Image::class,
";i:1;s:3:"php";i:2;s:7:"app.php";}i:2;i:1013;}i:37;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1013;}i:38;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:55:"Bây giờ ta có thể dùng thử package trong Route";}i:2;i:1204;}i:39;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1265;}i:40;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:163:"
// usage inside a laravel route
Route::get('/testimage', function()
{
    $img = Image::make('foo.png')->resize(300, 200);

    return $img->response('jpg');
});
";i:1;s:3:"php";i:2;s:9:"route.php";}i:2;i:1265;}i:41;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1452;}i:42;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:11:"2.2 Routing";i:1;i:2;i:2;i:1452;}i:2;i:1452;}i:43;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1452;}i:44;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1452;}i:45;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:124:"Để thêm route cho package, ta chỉ cần thêm require file routes trong phương thức boot của service provider. 
";}i:2;i:1476;}i:46;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1600;}i:47;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:1602;}i:48;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:"Ex";}i:2;i:1604;}i:49;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:1606;}i:50;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1608;}i:51;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:86:": Package bestmomo/scafold ta có thêm các route là 'home', 'auth/*', 'password/*' ";}i:2;i:1610;}i:52;a:3:{i:0;s:6:"entity";i:1;a:1:{i:0;s:3:"...";}i:2;i:1696;}i:53;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:76:" Trong class ScafoldServiceprovider ta thêm phương thức boot như sau :";}i:2;i:1699;}i:54;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1781;}i:55;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:242:"
public function boot()
	{
		// Get namespace
		$nameSpace = $this->app->getNamespace();
		// Routes
		$this->app->router->group(['namespace' => $nameSpace . 'Http\Controllers'], function()
		{
			require __DIR__.'/Http/routes.php';
		});
	}
";i:1;s:3:"php";i:2;s:26:"ScafoldServiceprovider.php";}i:2;i:1781;}i:56;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1781;}i:57;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:38:"Trong package ta thêm file routes.php";}i:2;i:2064;}i:58;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2102;}i:59;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:187:"
<?php
Route::get('home', '\Bestmomo\Scafold\Http\Controllers\HomeController@index');
Route::controllers([
	'auth' => 'Auth\AuthController',
	'password' => 'Auth\PasswordController',
]);
";i:1;s:3:"php";i:2;s:10:"routes.php";}i:2;i:2109;}i:60;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2320;}i:61;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"2.3 Resource";i:1;i:2;i:2;i:2320;}i:2;i:2320;}i:62;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2320;}i:63;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2346;}i:64;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:11:"2.3.1 Views";i:1;i:3;i:2;i:2346;}i:2;i:2346;}i:65;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:2346;}i:66;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2346;}i:67;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:106:"Đối với các package có sử dụng Views, ta có các phương thức để đưa vào views như :";}i:2;i:2369;}i:68;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2475;}i:69;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2477;}i:70;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:30:"Service Provider loadViewsFrom";i:1;i:3;i:2;i:2477;}i:2;i:2477;}i:71;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:2477;}i:72;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2477;}i:73;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:138:"Ta có thể sử dụng phương thức loadViewsFrom trong server provider để chỉ cho Laravel biết các views của package đó.";}i:2;i:2519;}i:74;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2657;}i:75;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:91:"
public function boot()
{
    $this->loadViewsFrom(__DIR__.'/path/to/views', 'courier');
}
";i:1;s:3:"php";i:2;N;}i:2;i:2664;}i:76;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2664;}i:77;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:58:"Để sử dụng view đó ta có thể viết như sau :";}i:2;i:2769;}i:78;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2827;}i:79;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:74:"
Route::get('admin', function () {
    return view('courier::admin');
});
";i:1;s:3:"php";i:2;N;}i:2;i:2834;}i:80;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2922;}i:81;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:27:"Ghi đè các package views";i:1;i:3;i:2;i:2922;}i:2;i:2922;}i:82;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:2922;}i:83;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2922;}i:84;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:227:"Nếu dùng cách trên thì ta có đến 2 đường dẫn trỏ đến views : 1 là views trong lavavel, 2 là views của package. Để đơn giản hơn ta có chuyển các views trong package sang views của Laravel. ";}i:2;i:2960;}i:85;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3187;}i:86;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3187;}i:87;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:3189;}i:88;a:3:{i:0;s:13:"emphasis_open";i:1;a:0:{}i:2;i:3191;}i:89;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:"Ex:";}i:2;i:3193;}i:90;a:3:{i:0;s:14:"emphasis_close";i:1;a:0:{}i:2;i:3196;}i:91;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:3198;}i:92;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:127:" Trong package BestMomo/scafold dùng phương thức publish để chuyển views của package đó sang views của Laravel.";}i:2;i:3200;}i:93;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3327;}i:94;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:563:"
public function boot()
	{
		// Get namespace
		$nameSpace = $this->app->getNamespace();
		// Routes
		$this->app->router->group(['namespace' => $nameSpace . 'Http\Controllers'], function()
		{
			require __DIR__.'/Http/routes.php';
		});
		// Views
		$this->publishes([
			__DIR__.'/../views' => base_path('resources/views'),
			__DIR__.'/../views/auth' => base_path('resources/views/auth'),
			__DIR__.'/../views/emails' => base_path('resources/views/emails'),
		]);
		// Assets
		$this->publishes([
			__DIR__.'/../public' => public_path(),
		], 'public');
	}
";i:1;s:3:"php";i:2;s:26:"ScafoldServiceprovider.php";}i:2;i:3334;}i:95;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3334;}i:96;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:66:"Để thực hiện việc copy các views ta sử dụng artisan:";}i:2;i:3937;}i:97;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4009;}i:98;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:366:"
$ php artisan vendor:publish
Copied Directory [/vendor/bestmomo/scafold/views] To [/resources/views]
Copied Directory [/vendor/bestmomo/scafold/views/auth] To [/resources/views/auth]
Copied Directory [/vendor/bestmomo/scafold/views/emails] To [/resources/views/emails]
Copied Directory [/vendor/bestmomo/scafold/public] To [/public]
Publishing complete for tag []!
";i:1;N;i:2;N;}i:2;i:4009;}i:99;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4385;}i:100;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"2.3.2 Translations";i:1;i:3;i:2;i:4385;}i:2;i:4385;}i:101;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:4385;}i:102;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4385;}i:103;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:140:"Nếu package có nhiều ngôn ngữ, ta khai báo bằng phương thức loadTranslationsFrom() để chỉ cho Laravel cách load chúng.";}i:2;i:4414;}i:104;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4554;}i:105;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:109:"
public function boot()
{
    $this->loadTranslationsFrom(__DIR__.'/path/to/translations', 'packagename');
}
";i:1;s:3:"php";i:2;N;}i:2;i:4561;}i:106;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4561;}i:107;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"Cách dùng như sau :";}i:2;i:4684;}i:108;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4712;}i:109;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:46:"
echo trans('packagename::messages.welcome');
";i:1;s:3:"php";i:2;N;}i:2;i:4712;}i:110;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4712;}i:111;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:102:"Cũng giống như views, ta có thể copy các file translations từ package sang laravel như sau:";}i:2;i:4772;}i:112;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4880;}i:113;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:224:"
public function boot()
{
    $this->loadTranslationsFrom(__DIR__.'/path/to/translations', 'courier');

    $this->publishes([
        __DIR__.'/path/to/translations' => base_path('resources/lang/vendor/courier'),
    ]);
}
";i:1;s:3:"php";i:2;N;}i:2;i:4880;}i:114;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4880;}i:115;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:37:"Sau đó chạy lệnh vendor:publish";}i:2;i:5117;}i:116;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5160;}i:117;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:28:"
php artisan vendor:publish
";i:1;N;i:2;N;}i:2;i:5160;}i:118;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5198;}i:119;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"2.2.3 Configuration";i:1;i:3;i:2;i:5198;}i:2;i:5198;}i:120;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:5198;}i:121;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5198;}i:122;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:79:"Để thêm cấu hình cho package ta có thể dùng phương thức publish.";}i:2;i:5228;}i:123;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5313;}i:124;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:136:"
public function boot()
{
    $this->publishes([
        __DIR__.'/path/to/config/courier.php' => config_path('courier.php'),
    ]);
}
";i:1;s:3:"php";i:2;N;}i:2;i:5313;}i:125;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5313;}i:126;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:57:"Giờ ta có thể sử dụng config của package đó.";}i:2;i:5462;}i:127;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5525;}i:128;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:36:"
$value = config('courier.option');
";i:1;s:3:"php";i:2;N;}i:2;i:5525;}i:129;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5525;}i:130;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:75:"Ta có thể trộn các cấu hình của package với Laravel như sau :";}i:2;i:5575;}i:131;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5656;}i:132;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:124:"
public function register()
{
    $this->mergeConfigFrom(
        __DIR__.'/path/to/config/courier.php', 'courier'
    );
}
";i:1;s:3:"php";i:2;N;}i:2;i:5656;}i:133;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5794;}i:134;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:11:"2.2.4 Asset";i:1;i:3;i:2;i:5794;}i:2;i:5794;}i:135;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:5794;}i:136;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5794;}i:137;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:98:"- Để load các file js, css trong package ta có dùng cách giống như views và transition.";}i:2;i:5816;}i:138;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5920;}i:139;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:151:"
    public function boot()
    	{
    		// Assets
    		$this->publishes([
    			__DIR__.'/../public' => public_path(),
    		], 'public');
    	}


";i:1;s:3:"php";i:2;N;}i:2;i:5920;}i:140;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5920;}i:141;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"Sau đó cũng cmd vendor:publish";}i:2;i:6085;}i:142;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6124;}i:143;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:148:"
$ php artisan vendor:publish
// Các file assset sẽ được ghi đè mỗi khi package update
$ php artisan vendor:publish --tag=public --force
";i:1;N;i:2;N;}i:2;i:6124;}i:144;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6282;}i:145;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:27:"2.2.5 Publish từng phần";i:1;i:3;i:2;i:6282;}i:2;i:6282;}i:146;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:6282;}i:147;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6282;}i:148;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:62:"Ta có thể cấu hình package theo từng phần như sau :";}i:2;i:6320;}i:149;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6388;}i:150;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:260:"
public function boot()
{
    $this->publishes([
        __DIR__.'/../config/package.php' => config_path('package.php')
    ], 'config');

    $this->publishes([
        __DIR__.'/../database/migrations/' => database_path('migrations')
    ], 'migrations');
}
";i:1;s:3:"php";i:2;N;}i:2;i:6388;}i:151;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6388;}i:152;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:56:"khi publish config, ta chỉ cần chạy cmd như sau :";}i:2;i:6662;}i:153;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6724;}i:154;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:98:"
$ php artisan vendor:publish --provider="Vendor\Providers\PackageServiceProvider" --tag="config"
";i:1;N;i:2;N;}i:2;i:6724;}i:155;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6830;}i:156;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6830;}}