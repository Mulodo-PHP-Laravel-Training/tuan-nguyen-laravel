a:573:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"Laravel Testing";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:32;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"1. Unit Test";i:1;i:1;i:2;i:32;}i:2;i:32;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:32;}i:6;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:60;}i:7;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"1.1 Giới thiệu";i:1;i:2;i:2;i:60;}i:2;i:60;}i:8;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:60;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:60;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:120:"Laravel được tích hợp sẵn PHPUnit. Sau khi cài xong Laravel bạn có thể chạy câu lệnh sau để test.";}i:2;i:92;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:218;}i:12;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:11:"
$ phpunit
";i:1;N;i:2;N;}i:2;i:218;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:218;}i:14;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:48:":php:laravel:capture_2015_08_27_13_38_38_794.png";i:1;s:0:"";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:239;}i:15;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:292;}i:16;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:294;}i:17;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:32:"1.2 Định nghĩa & chạy Test";i:1;i:2;i:2;i:294;}i:2;i:294;}i:18;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:294;}i:19;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:294;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:116:"Các file test được đặt trong thư mục /tests, và thường được extend từ class TestCase. Ví dụ:";}i:2;i:340;}i:21;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:456;}i:22;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:125:"
class FooTest extends TestCase {

    public function testSomethingIsTrue()
    {
        $this->assertTrue(true);
    }

}
";i:1;s:3:"php";i:2;N;}i:2;i:463;}i:23;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:602;}i:24;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:23:"1.3 Môi trường test";i:1;i:2;i:2;i:602;}i:2;i:602;}i:25;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:602;}i:26;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:602;}i:27;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:158:"Khi chạy Unit Test, Laravel sẽ tự động cấu hình môi trường là testing.
Cấu hình môi trường test được đặt trong file phpunit.xml";}i:2;i:639;}i:28;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:803;}i:29;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:900:"
<?xml version="1.0" encoding="UTF-8"?>
<phpunit backupGlobals="false"
         backupStaticAttributes="false"
         bootstrap="bootstrap/autoload.php"
         colors="true"
         convertErrorsToExceptions="true"
         convertNoticesToExceptions="true"
         convertWarningsToExceptions="true"
         processIsolation="false"
         stopOnFailure="false"
         syntaxCheck="false">
    <testsuites>
        <testsuite name="Application Test Suite">
            <directory>./tests/</directory>
        </testsuite>
    </testsuites>
    <filter>
        <whitelist>
            <directory suffix=".php">app/</directory>
        </whitelist>
    </filter>
    <php>
        <env name="APP_ENV" value="testing"/>
        <env name="CACHE_DRIVER" value="array"/>
        <env name="SESSION_DRIVER" value="array"/>
        <env name="QUEUE_DRIVER" value="sync"/>
    </php>
</phpunit>
";i:1;s:3:"xml";i:2;s:11:"phpunit.xml";}i:2;i:803;}i:30;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1729;}i:31;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:45:"1.4 Gọi các thành phần trong test class";i:1;i:2;i:2;i:1729;}i:2;i:1729;}i:32;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1729;}i:33;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1787;}i:34;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"1.4.1 Gọi route";i:1;i:3;i:2;i:1787;}i:2;i:1787;}i:35;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1787;}i:36;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1787;}i:37;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:71:"Ta có thể gọi 1 route từ class Test bằng phương thức call.";}i:2;i:1815;}i:38;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1886;}i:39;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:425:"
// Full feature
$response1 = $this->call($method, $uri, $parameters, $cookies, $files, $server, $content);

// Gọi https
$response2 = $this->callSecure('GET', 'foo/bar');

// Gọi phương thức GET với địa chỉ là testRouting
$response = $this->call('GET', 'testRouting');



// VD: Kiểm tra link testRouting có nội dung Hello World hay không ?
$this->assertEquals('Hello World', $response->getContent());
";i:1;s:3:"php";i:2;s:15:"ExampleTest.php";}i:2;i:1893;}i:40;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1893;}i:41;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:50:"Trong file routes.php thêm 1 routing testRouting:";}i:2;i:2348;}i:42;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2404;}i:43;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:69:"
Route::get('testRouting', function(){
    return 'Hello World';
});
";i:1;s:3:"php";i:2;s:10:"routes.php";}i:2;i:2404;}i:44;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2500;}i:45;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:22:"1.4.2 Gọi Controller";i:1;i:3;i:2;i:2500;}i:2;i:2500;}i:46;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:2500;}i:47;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2500;}i:48;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:86:"Ta có thể gọi 1 action trong controller với phương thức và các tham số.";}i:2;i:2533;}i:49;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2619;}i:50;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:542:"
public function testController() {
    $response1 = $this->action('GET', 'HomeController@index');
    $response2 = $this->action('GET', 'UserController@profile', ['user' => 1]);
    // Kiểm tra giá trị View trả về
    // $view = $response->original;
    // $this->assertEquals('John', $view['name']);
    
    
    // VD: kiểm tra action test trong controller test có trả về giá trị OK hay ko ?
    $response = $this->action('GET', 'TestController@index');
    $this->assertEquals('index', $response->getContent());
}    
";i:1;s:3:"php";i:2;s:15:"ExampleTest.php";}i:2;i:2626;}i:51;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2626;}i:52;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:102:"Để kết quả test trả về đúng ta sửa action index trong file TestController.php như sau:";}i:2;i:3197;}i:53;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3305;}i:54;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:61:"
public function index()
    {
        return 'index';
    }
";i:1;s:3:"php";i:2;s:18:"TestController.php";}i:2;i:3305;}i:55;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3398;}i:56;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"1.4.3 Mocking Facades";i:1;i:3;i:2;i:3398;}i:2;i:3398;}i:57;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3398;}i:58;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3435;}i:59;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:26:"1.4.4 Framework Assertions";i:1;i:3;i:2;i:3435;}i:2;i:3435;}i:60;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3435;}i:61;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3473;}i:62;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"assertResponseOk";i:1;i:3;i:2;i:3473;}i:2;i:3473;}i:63;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3473;}i:64;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3473;}i:65;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:"Asserting Responses Are OK";}i:2;i:3500;}i:66;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3532;}i:67;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:95:"
public function testMethod()
{
    $this->call('GET', '/');

    $this->assertResponseOk();
}
";i:1;s:3:"php";i:2;N;}i:2;i:3532;}i:68;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3641;}i:69;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"assertResponseStatus";i:1;i:3;i:2;i:3641;}i:2;i:3641;}i:70;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3641;}i:71;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3641;}i:72;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:"Asserting Response Statuses";}i:2;i:3672;}i:73;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3705;}i:74;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:35:"
$this->assertResponseStatus(403);
";i:1;s:3:"php";i:2;N;}i:2;i:3705;}i:75;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3753;}i:76;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"assertRedirectedTo";i:1;i:3;i:2;i:3753;}i:2;i:3753;}i:77;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3753;}i:78;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3753;}i:79;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"Asserting Responses Are Redirects";}i:2;i:3782;}i:80;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3821;}i:81;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:137:"
$this->assertRedirectedTo('foo');

$this->assertRedirectedToRoute('route.name');

$this->assertRedirectedToAction('Controller@method');
";i:1;s:3:"php";i:2;N;}i:2;i:3821;}i:82;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3972;}i:83;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"assertViewHas";i:1;i:3;i:2;i:3972;}i:2;i:3972;}i:84;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3972;}i:85;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3972;}i:86;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:"Asserting A View Has Some Data";}i:2;i:3996;}i:87;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4032;}i:88;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:139:"
public function testMethod()
{
    $this->call('GET', '/');

    $this->assertViewHas('name');
    $this->assertViewHas('age', $value);
}
";i:1;s:3:"php";i:2;N;}i:2;i:4032;}i:89;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4185;}i:90;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"assertSessionHas";i:1;i:3;i:2;i:4185;}i:2;i:4185;}i:91;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:4185;}i:92;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4185;}i:93;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:"Asserting The Session Has Some Data";}i:2;i:4212;}i:94;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4253;}i:95;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:145:"
public function testMethod()
{
    $this->call('GET', '/');

    $this->assertSessionHas('name');
    $this->assertSessionHas('age', $value);
}
";i:1;s:3:"php";i:2;N;}i:2;i:4253;}i:96;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4412;}i:97;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:22:"assertSessionHasErrors";i:1;i:3;i:2;i:4412;}i:2;i:4412;}i:98;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:4412;}i:99;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4412;}i:100;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:32:"Asserting The Session Has Errors";}i:2;i:4445;}i:101;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4477;}i:102;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:317:"
public function testMethod()
{
    $this->call('GET', '/');

    $this->assertSessionHasErrors();

    // Asserting the session has errors for a given key...
    $this->assertSessionHasErrors('name');

    // Asserting the session has errors for several keys...
    $this->assertSessionHasErrors(['name', 'age']);
}
";i:1;s:3:"php";i:2;N;}i:2;i:4484;}i:103;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4815;}i:104;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"assertHasOldInput";i:1;i:3;i:2;i:4815;}i:2;i:4815;}i:105;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:4815;}i:106;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4815;}i:107;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"Asserting Old Input Has Some Data";}i:2;i:4843;}i:108;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4876;}i:109;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:96:"
public function testMethod()
{
    $this->call('GET', '/');

    $this->assertHasOldInput();
}
";i:1;s:3:"php";i:2;N;}i:2;i:4883;}i:110;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4993;}i:111;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"1.4.5 Helper Methods";i:1;i:3;i:2;i:4993;}i:2;i:4993;}i:112;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:4993;}i:113;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4993;}i:114;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:79:"Class TestCase có nhiều các helper giúp cho việc testing dễ dàng hơn";}i:2;i:5025;}i:115;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5104;}i:116;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5106;}i:117;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"Thêm & gỡ Session";i:1;i:3;i:2;i:5106;}i:2;i:5106;}i:118;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:5106;}i:119;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:58:"
$this->session(['foo' => 'bar']);
$this->flushSession();
";i:1;s:3:"php";i:2;N;}i:2;i:5143;}i:120;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5215;}i:121;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:40:"Thiết lập cấp quyền thành viên";i:1;i:3;i:2;i:5215;}i:2;i:5215;}i:122;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:5215;}i:123;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:57:"
$user = new User(['name' => 'John']);
$this->be($user);
";i:1;s:3:"php";i:2;N;}i:2;i:5272;}i:124;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5343;}i:125;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"Cài lại database";i:1;i:3;i:2;i:5343;}i:2;i:5343;}i:126;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:5343;}i:127;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:48:"
$this->seed();

$this->seed('DatabaseSeeder');
";i:1;s:3:"php";i:2;N;}i:2;i:5379;}i:128;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5441;}i:129;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:32:"1.4.6 Refreshing The Application";i:1;i:3;i:2;i:5441;}i:2;i:5441;}i:130;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:5441;}i:131;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5441;}i:132;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:83:"Nếu ta muốn refresh lại Application khi testing 1 method, ta có thể dùng:";}i:2;i:5484;}i:133;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5573;}i:134;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:30:"
$this->refreshApplication();
";i:1;s:3:"php";i:2;N;}i:2;i:5573;}i:135;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5573;}i:136;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:76:"Phương thức trên sẽ reset lại các bindings, mock , IoC container. ";}i:2;i:5616;}i:137;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5692;}i:138;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5694;}i:139;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:28:"1.4.7 Table of Assert Method";i:1;i:3;i:2;i:5694;}i:2;i:5694;}i:140;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:5694;}i:141;a:3:{i:0;s:10:"table_open";i:1;a:3:{i:0;i:2;i:1;i:9;i:2;i:5734;}i:2;i:5733;}i:142;a:3:{i:0;s:15:"tablethead_open";i:1;a:0:{}i:2;i:5733;}i:143;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:5733;}i:144;a:3:{i:0;s:16:"tableheader_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5733;}i:145;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:5735;}i:146;a:3:{i:0;s:17:"tableheader_close";i:1;a:0:{}i:2;i:5736;}i:147;a:3:{i:0;s:16:"tableheader_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5736;}i:148;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:5737;}i:149;a:3:{i:0;s:17:"tableheader_close";i:1;a:0:{}i:2;i:5738;}i:150;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:5739;}i:151;a:3:{i:0;s:16:"tablethead_close";i:1;a:0:{}i:2;i:5739;}i:152;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:5739;}i:153;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;s:4:"left";i:2;i:1;}i:2;i:5739;}i:154;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:23:"AssertTrue/AssertFalse	";}i:2;i:5741;}i:155;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5764;}i:156;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5764;}i:157;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:48:" Check the input to verify it equals true/false ";}i:2;i:5765;}i:158;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5813;}i:159;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:5814;}i:160;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:5814;}i:161;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5814;}i:162;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"AssertEquals ";}i:2;i:5816;}i:163;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5829;}i:164;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;s:5:"right";i:2;i:1;}i:2;i:5829;}i:165;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:52:"	Check the result against another input for a match ";}i:2;i:5830;}i:166;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5882;}i:167;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:5883;}i:168;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:5883;}i:169;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5883;}i:170;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"AssertGreaterThan ";}i:2;i:5885;}i:171;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5903;}i:172;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5903;}i:173;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:122:" Check the result to see if it’s larger than a value (there’s also LessThan, GreaterThanOrEqual, and LessThanOrEqual) ";}i:2;i:5904;}i:174;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6026;}i:175;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:6027;}i:176;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:6027;}i:177;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6027;}i:178;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"AssertContains ";}i:2;i:6029;}i:179;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6044;}i:180;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6044;}i:181;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:47:" Check that the input contains a certain value ";}i:2;i:6045;}i:182;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6092;}i:183;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:6093;}i:184;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:6093;}i:185;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6093;}i:186;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:"AssertType ";}i:2;i:6095;}i:187;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6106;}i:188;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6106;}i:189;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:44:" Check that a variable is of a certain type ";}i:2;i:6107;}i:190;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6151;}i:191;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:6152;}i:192;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:6152;}i:193;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6152;}i:194;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:"AssertNull ";}i:2;i:6154;}i:195;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6165;}i:196;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6165;}i:197;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:31:" Check that a variable is null ";}i:2;i:6166;}i:198;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6197;}i:199;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:6198;}i:200;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:6198;}i:201;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6198;}i:202;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:17:"AssertFileExists ";}i:2;i:6200;}i:203;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6217;}i:204;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6217;}i:205;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:" Verify that a file exists ";}i:2;i:6218;}i:206;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6245;}i:207;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:6246;}i:208;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:6246;}i:209;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6246;}i:210;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"AssertRegExp ";}i:2;i:6248;}i:211;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6261;}i:212;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6261;}i:213;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:44:"Check the input against a regular expression";}i:2;i:6262;}i:214;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6306;}i:215;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:6307;}i:216;a:3:{i:0;s:11:"table_close";i:1;a:1:{i:0;i:6307;}i:2;i:6307;}i:217;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6309;}i:218;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:34:"1.5 PHPUnit methods and properties";i:1;i:2;i:2;i:6309;}i:2;i:6309;}i:219;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:6309;}i:220;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6357;}i:221;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"$app";i:1;i:3;i:2;i:6357;}i:2;i:6357;}i:222;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:6357;}i:223;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6357;}i:224;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:44:"The instance of the Laravel 5.1 application.";}i:2;i:6373;}i:225;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6417;}i:226;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6419;}i:227;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"$code";i:1;i:3;i:2;i:6419;}i:2;i:6419;}i:228;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:6419;}i:229;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6419;}i:230;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:36:"The latest code returned by artisan.";}i:2;i:6436;}i:231;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6472;}i:232;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6474;}i:233;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"call";i:1;i:3;i:2;i:6474;}i:2;i:6474;}i:234;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:6474;}i:235;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6474;}i:236;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"Calls the given ";}i:2;i:6489;}i:237;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"URI";}i:2;i:6505;}i:238;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:" and returns the response.";}i:2;i:6508;}i:239;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6540;}i:240;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:106:"
$this->call($method, $uri, $parameters = [], $cookies = [], $files = [], $server = [], $content = null);
";i:1;s:3:"php";i:2;N;}i:2;i:6540;}i:241;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6660;}i:242;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:10:"callSecure";i:1;i:3;i:2;i:6660;}i:2;i:6660;}i:243;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:6660;}i:244;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6660;}i:245;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"Calls the given HTTPS ";}i:2;i:6682;}i:246;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"URI";}i:2;i:6704;}i:247;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:" and returns the response.";}i:2;i:6707;}i:248;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6739;}i:249;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:104:"
callSecure($method, $uri, $parameters = [], $cookies = [], $files = [], $server = [], $content = null)
";i:1;s:3:"php";i:2;N;}i:2;i:6739;}i:250;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6857;}i:251;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"action";i:1;i:3;i:2;i:6857;}i:2;i:6857;}i:252;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:6857;}i:253;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6857;}i:254;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:51:"Calls a controller action and returns the response.";}i:2;i:6874;}i:255;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6931;}i:256;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:120:"
action($method, $action, $wildcards = [], $parameters = [], $cookies = [], $files = [], $server = [], $content = null)
";i:1;s:3:"php";i:2;N;}i:2;i:6931;}i:257;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7065;}i:258;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"route";i:1;i:3;i:2;i:7065;}i:2;i:7065;}i:259;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:7065;}i:260;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7065;}i:261;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:45:"Calls a named route and returns the response.";}i:2;i:7081;}i:262;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7132;}i:263;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:123:"
route($method, $name, $routeParameters = [], $parameters = [], $cookies = [], $files = [], $server = [], $content = null)
";i:1;s:3:"php";i:2;N;}i:2;i:7132;}i:264;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7269;}i:265;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"instance";i:1;i:3;i:2;i:7269;}i:2;i:7269;}i:266;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:7269;}i:267;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7269;}i:268;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:51:"Register an instance of an object in the container.";}i:2;i:7288;}i:269;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7345;}i:270;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:30:"
instance($abstract, $object)
";i:1;s:3:"php";i:2;N;}i:2;i:7345;}i:271;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7389;}i:272;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"expectsEvents";i:1;i:3;i:2;i:7389;}i:2;i:7389;}i:273;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:7389;}i:274;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7389;}i:275;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:70:"Specify a list of events that should be fired for the given operation.";}i:2;i:7413;}i:276;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7489;}i:277;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:24:"
expectsEvents($events)
";i:1;s:3:"php";i:2;N;}i:2;i:7489;}i:278;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7527;}i:279;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"withoutEvents";i:1;i:3;i:2;i:7527;}i:2;i:7527;}i:280;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:7527;}i:281;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7527;}i:282;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:53:"Mock the event dispatcher so all events are silenced.";}i:2;i:7551;}i:283;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7610;}i:284;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:17:"
withoutEvents()
";i:1;s:3:"php";i:2;N;}i:2;i:7610;}i:285;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7641;}i:286;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:11:"expectsJobs";i:1;i:3;i:2;i:7641;}i:2;i:7641;}i:287;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:7641;}i:288;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7641;}i:289;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:73:"Specify a list of jobs that should be dispatched for the given operation.";}i:2;i:7663;}i:290;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7742;}i:291;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:20:"
expectsJobs($jobs)
";i:1;s:3:"php";i:2;N;}i:2;i:7742;}i:292;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7776;}i:293;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:11:"withSession";i:1;i:3;i:2;i:7776;}i:2;i:7776;}i:294;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:7776;}i:295;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7776;}i:296;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:"Set the session to the given array.";}i:2;i:7798;}i:297;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7839;}i:298;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:26:"
withSession(array $data)
";i:1;s:3:"php";i:2;N;}i:2;i:7839;}i:299;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7879;}i:300;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"session";i:1;i:3;i:2;i:7879;}i:2;i:7879;}i:301;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:7879;}i:302;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7879;}i:303;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:58:"Starts session and sets the session values from the array.";}i:2;i:7897;}i:304;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7961;}i:305;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:22:"
session(array $data)
";i:1;s:3:"php";i:2;N;}i:2;i:7961;}i:306;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7997;}i:307;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"flushSession";i:1;i:3;i:2;i:7997;}i:2;i:7997;}i:308;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:7997;}i:309;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7997;}i:310;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:44:"Flushes the contents of the current session.";}i:2;i:8020;}i:311;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8070;}i:312;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:16:"
flushSession()
";i:1;s:3:"php";i:2;N;}i:2;i:8070;}i:313;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8100;}i:314;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"startSession";i:1;i:3;i:2;i:8100;}i:2;i:8100;}i:315;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:8100;}i:316;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8100;}i:317;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:"Starts the application’s session.";}i:2;i:8123;}i:318;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8164;}i:319;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:16:"
startSession()
";i:1;s:3:"php";i:2;N;}i:2;i:8164;}i:320;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8194;}i:321;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"actingAs";i:1;i:3;i:2;i:8194;}i:2;i:8194;}i:322;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:8194;}i:323;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8194;}i:324;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:63:"(Fluent) Sets the currently logged in user for the application.";}i:2;i:8213;}i:325;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8282;}i:326;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:17:"
actingAs($user)
";i:1;s:3:"php";i:2;N;}i:2;i:8282;}i:327;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8313;}i:328;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:2:"be";i:1;i:3;i:2;i:8313;}i:2;i:8313;}i:329;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:8313;}i:330;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8313;}i:331;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:54:"Sets the currently logged in user for the application.";}i:2;i:8326;}i:332;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8386;}i:333;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:11:"
be($user)
";i:1;s:3:"php";i:2;N;}i:2;i:8386;}i:334;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8411;}i:335;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"seeInDatabase";i:1;i:3;i:2;i:8411;}i:2;i:8411;}i:336;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:8411;}i:337;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8411;}i:338;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:64:"(Fluent) Asserts a given where condition exists in the database.";}i:2;i:8435;}i:339;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8505;}i:340;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:56:"
seeInDatabase($table, array $data, $connection = null)
";i:1;s:3:"php";i:2;N;}i:2;i:8505;}i:341;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8575;}i:342;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"notSeeInDatabase";i:1;i:3;i:2;i:8575;}i:2;i:8575;}i:343;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:8575;}i:344;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8575;}i:345;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:72:"(Fluent) Asserts a given where condition does not exist in the database.";}i:2;i:8603;}i:346;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8675;}i:347;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:60:"
notSeeInDatabase($table, $array $data, $connection = null)
";i:1;s:3:"php";i:2;N;}i:2;i:8682;}i:348;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8756;}i:349;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"missingFromDatabase";i:1;i:3;i:2;i:8756;}i:2;i:8756;}i:350;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:8756;}i:351;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8756;}i:352;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:37:"(Fluent) Alias to notSeeInDatabase().";}i:2;i:8786;}i:353;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8829;}i:354;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:62:"
missingFromDatabase($table, array $data, $connection = null)
";i:1;s:3:"php";i:2;N;}i:2;i:8829;}i:355;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8905;}i:356;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"seed";i:1;i:3;i:2;i:8905;}i:2;i:8905;}i:357;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:8905;}i:358;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8905;}i:359;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"Seeds the database.";}i:2;i:8920;}i:360;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8945;}i:361;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:8:"
seed()
";i:1;s:3:"php";i:2;N;}i:2;i:8945;}i:362;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8967;}i:363;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"artisan";i:1;i:3;i:2;i:8967;}i:2;i:8967;}i:364;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:8967;}i:365;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8967;}i:366;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:50:"Executes the artisan command and returns the code.";}i:2;i:8985;}i:367;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9041;}i:368;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:37:"
artisan($command, $parameters = [])
";i:1;s:3:"php";i:2;N;}i:2;i:9041;}i:369;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9092;}i:370;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:22:"1.6 Using Gulp for TDD";i:1;i:2;i:2;i:9092;}i:2;i:9092;}i:371;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:9092;}i:372;a:3:{i:0;s:10:"quote_open";i:1;a:0:{}i:2;i:9126;}i:373;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:18:"http://gulpjs.com/";i:1;s:4:"Gulp";}i:2;i:9128;}i:374;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:56:": là hệ thống tự chạy viết bằng Javascript.";}i:2;i:9155;}i:375;a:3:{i:0;s:11:"quote_close";i:1;a:0:{}i:2;i:9211;}i:376;a:3:{i:0;s:10:"quote_open";i:1;a:0:{}i:2;i:9212;}i:377;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:"TDD : Test Driven Development.";}i:2;i:9214;}i:378;a:3:{i:0;s:11:"quote_close";i:1;a:0:{}i:2;i:9244;}i:379;a:3:{i:0;s:10:"quote_open";i:1;a:0:{}i:2;i:9245;}i:380;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:80:"Laravel Exlixir: là 1 api dùng để định nghĩa các tác vụ của Gulp.";}i:2;i:9247;}i:381;a:3:{i:0;s:11:"quote_close";i:1;a:0:{}i:2;i:9327;}i:382;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9327;}i:383;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:87:"Ta có thể dùng Gulp để app tự chạy UnitTest khi nội dung file thay đổi.";}i:2;i:9329;}i:384;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9416;}i:385;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9418;}i:386;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"1.6.1 Install Gulp";i:1;i:3;i:2;i:9418;}i:2;i:9418;}i:387;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:9418;}i:388;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9418;}i:389;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:9447;}i:390;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"Install Gulp globally";}i:2;i:9449;}i:391;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:9470;}i:392;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:9472;}i:393;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9478;}i:394;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:29:"
$ npm install --global gulp
";i:1;N;i:2;N;}i:2;i:9478;}i:395;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9478;}i:396;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:9516;}i:397;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:46:" Install gulp in your project devDependencies:";}i:2;i:9518;}i:398;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:9564;}i:399;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:9566;}i:400;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9572;}i:401;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:31:"
$ npm install --save-dev gulp
";i:1;N;i:2;N;}i:2;i:9572;}i:402;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9572;}i:403;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:9612;}i:404;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:49:"Create a gulpfile.js at the root of your project:";}i:2;i:9614;}i:405;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:9663;}i:406;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:9665;}i:407;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9671;}i:408;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:111:"
var gulp = require('gulp');

gulp.task('default', function() {
  // place code for your default task here
});
";i:1;N;i:2;N;}i:2;i:9671;}i:409;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9671;}i:410;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:9792;}i:411;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:"Run gulp:";}i:2;i:9794;}i:412;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:9803;}i:413;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:9805;}i:414;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9811;}i:415;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:8:"
$ gulp
";i:1;N;i:2;N;}i:2;i:9811;}i:416;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9811;}i:417;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:9829;}i:418;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"Install laravel-elixir";}i:2;i:9831;}i:419;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:9853;}i:420;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9855;}i:421;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9855;}i:422;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:"Cập nhật file package.json";}i:2;i:9857;}i:423;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9893;}i:424;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:160:"
{
  "private": true,
  "devDependencies": {
    "gulp": "^3.8.8"
  },
  "dependencies": {
    "laravel-elixir": "^3.0.0",
    "bootstrap-sass": "^3.0.0"
  }
}
";i:1;s:2:"js";i:2;s:12:"package.json";}i:2;i:9893;}i:425;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9893;}i:426;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:"Cài đặt laravel-elixir";}i:2;i:10078;}i:427;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10110;}i:428;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:15:"
$ npm install
";i:1;N;i:2;N;}i:2;i:10110;}i:429;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10134;}i:430;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"1.6.2 Run Gulp";i:1;i:3;i:2;i:10134;}i:2;i:10134;}i:431;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:10134;}i:432;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10134;}i:433;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:"Cập nhật file gulpfile.js";}i:2;i:10159;}i:434;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10194;}i:435;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:88:"
var elixir = require('laravel-elixir');

elixir(function(mix) {
    mix.phpUnit();
});
";i:1;s:2:"js";i:2;s:11:"gulpfile.js";}i:2;i:10194;}i:436;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10194;}i:437;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:"Chạy gulp tự động :";}i:2;i:10307;}i:438;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10339;}i:439;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:12:"
$ gulp tdd
";i:1;N;i:2;N;}i:2;i:10339;}i:440;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10361;}i:441;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"2. Codeception";i:1;i:1;i:2;i:10361;}i:2;i:10361;}i:442;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:10361;}i:443;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10390;}i:444;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"2.1 Giới thiệu";i:1;i:2;i:2;i:10390;}i:2;i:10390;}i:445;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:10390;}i:446;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10390;}i:447;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:23:"http://codeception.com/";i:1;s:11:"Codeception";}i:2;i:10421;}i:448;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:77:" là 1 một BBD PHP test framework.
Codeception bao gồm các loại như :";}i:2;i:10460;}i:449;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10537;}i:450;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:10537;}i:451;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:10537;}i:452;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:10537;}i:453;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:" PHPUnit test";}i:2;i:10541;}i:454;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:10554;}i:455;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:10554;}i:456;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:10554;}i:457;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:10554;}i:458;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:77:" Acceptance Testing : test giao diện bằng Selenium WebDriver, PhpBrowser.";}i:2;i:10558;}i:459;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:10635;}i:460;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:10635;}i:461;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:10635;}i:462;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:10635;}i:463;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:152:" Functional Testing : có thể test nhiều framwork như: ymfony2, Laravel, Yii, Phalcon, Zend Framework, Kohana, Databases, REST, SOAP, CodeCoverage.";}i:2;i:10639;}i:464;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:10791;}i:465;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:10791;}i:466;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:10791;}i:467;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:10791;}i:468;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:10795;}i:469;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"API";}i:2;i:10796;}i:470;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:64:" Testing : REST, SOAP, XML-RPC via PHPBrowser or PHP Frameworks.";}i:2;i:10799;}i:471;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:10863;}i:472;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:10863;}i:473;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:10863;}i:474;a:3:{i:0;s:10:"quote_open";i:1;a:0:{}i:2;i:10864;}i:475;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:10866;}i:476;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:"BBD";}i:2;i:10868;}i:477;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:10871;}i:478;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:": Behavior Driven Development";}i:2;i:10873;}i:479;a:3:{i:0;s:11:"quote_close";i:1;a:0:{}i:2;i:10902;}i:480;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10904;}i:481;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"2.2 Cài đặt";i:1;i:2;i:2;i:10904;}i:2;i:10904;}i:482;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:10904;}i:483;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10904;}i:484;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"Cài bằng composer";}i:2;i:10932;}i:485;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10958;}i:486;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:57:"
$ php composer.phar require "codeception/codeception:*"
";i:1;N;i:2;N;}i:2;i:10958;}i:487;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10958;}i:488;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:61:"Download source code về thư mục gốc của ứng dụng";}i:2;i:11024;}i:489;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11091;}i:490;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:45:"
$ wget http://codeception.com/codecept.phar
";i:1;N;i:2;N;}i:2;i:11091;}i:491;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11091;}i:492;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:25:"Khởi tạo codeception:";}i:2;i:11145;}i:493;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11176;}i:494;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:31:"
$ php codecept.phar bootstrap
";i:1;N;i:2;N;}i:2;i:11176;}i:495;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11176;}i:496;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:"Tạo 1 acceptance test;";}i:2;i:11216;}i:497;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11246;}i:498;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:54:"
$ php codecept.phar generate:cept acceptance Welcome
";i:1;N;i:2;N;}i:2;i:11246;}i:499;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:11310;}i:500;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:42:"3. Acceptance Testing & Functional Testing";i:1;i:1;i:2;i:11310;}i:2;i:11310;}i:501;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:11310;}i:502;a:3:{i:0;s:10:"quote_open";i:1;a:0:{}i:2;i:11367;}i:503;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:11369;}i:504;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"Acceptance testing";}i:2;i:11371;}i:505;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:11389;}i:506;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:252:" can be performed by a non-technical person. That person can be your tester, manager or even client. If you are developing a web-application (and probably you are) the tester needs nothing more than a web browser to check that your site works correctly";}i:2;i:11391;}i:507;a:3:{i:0;s:11:"quote_close";i:1;a:0:{}i:2;i:11643;}i:508;a:3:{i:0;s:10:"quote_open";i:1;a:0:{}i:2;i:11644;}i:509;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:11646;}i:510;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"Functional testing";}i:2;i:11648;}i:511;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:11666;}i:512;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:380:": Now that we've written some acceptance tests, functional tests are almost the same, with just one major difference: functional tests don't require a web server to run tests. In simple terms we set $_REQUEST, $_GET and $_POST variables and then we execute application from a test. This may be valuable as functional tests are faster and provide detailed stack traces on failures.";}i:2;i:11668;}i:513;a:3:{i:0;s:11:"quote_close";i:1;a:0:{}i:2;i:12048;}i:514;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:12049;}i:515;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:22:"3.1 Functional Testing";i:1;i:2;i:2;i:12049;}i:2;i:12049;}i:516;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:12049;}i:517;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:12084;}i:518;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:36:"3.1.1 Cấu hình Functional Testing";i:1;i:3;i:2;i:12084;}i:2;i:12084;}i:519;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:12084;}i:520;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12084;}i:521;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:65:"Để tạo 1 functional Contact Testing , ta chạy command sau:";}i:2;i:12131;}i:522;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12202;}i:523;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:56:"
$ php codecept.phar generate:cept functional Contact  
";i:1;N;i:2;N;}i:2;i:12202;}i:524;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12202;}i:525;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:91:"Thêm module laravel5 vào function test: cập nhật nội dung file functional.suite.yml";}i:2;i:12267;}i:526;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12364;}i:527;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:105:"
class_name: FunctionalTester  
modules:  
    enabled: 
        - Laravel5
        - \Helper\Functional
";i:1;s:3:"yml";i:2;s:18:"function.suite.yml";}i:2;i:12364;}i:528;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12364;}i:529;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:23:"Build lại codeception";}i:2;i:12502;}i:530;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12531;}i:531;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:29:"
$ php codecept.phar build  
";i:1;N;i:2;N;}i:2;i:12531;}i:532;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:12569;}i:533;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:30:"3.1.2 Functional Testing mẫu";i:1;i:3;i:2;i:12569;}i:2;i:12569;}i:534;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:12569;}i:535;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12569;}i:536;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:48:"Nội dung cần test có kịch bản như sau:";}i:2;i:12610;}i:537;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12658;}i:538;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:12658;}i:539;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:12658;}i:540;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:12658;}i:541;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:" Tôi đang ở trang contact";}i:2;i:12662;}i:542;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:12691;}i:543;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:12691;}i:544;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:12691;}i:545;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:12691;}i:546;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:75:" Tôi điền đúng thông tin vào form contact :name, email and comment.";}i:2;i:12695;}i:547;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:12770;}i:548;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:12770;}i:549;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:12770;}i:550;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:12770;}i:551;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:" Tôi nhấn nút submit";}i:2;i:12774;}i:552;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:12798;}i:553;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:12798;}i:554;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:12798;}i:555;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:12798;}i:556;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:54:" Tôi vẫn ở trang contact và tôi thấy message ";}i:2;i:12802;}i:557;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:12856;}i:558;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"Message sent!";}i:2;i:12857;}i:559;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:12870;}i:560;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:12871;}i:561;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:12871;}i:562;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:12871;}i:563;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12871;}i:564;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:44:"Functional Testing được viết như sau:";}i:2;i:12872;}i:565;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12922;}i:566;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:592:"
<?php

$I = new FunctionalTester($scenario);

$I->am('guest');
$I->wantTo('send email using contact form');

$I->amOnPage('/');
$I->submitForm('.contact-form', [
    'name' => 'Mario Basic',
    'email' => 'test@test.com',
    'comment' => 'This is a codeception test email.'
]);
$I->seeCurrentUrlEquals('/contact');
$I->see('Message sent!');

$I->amOnPage('/');
$I->submitForm('.contact-form', [
    'name' => 'Mario Basic',
    'email' => 'testtest.com',
    'comment' => 'This is a codeception test email.'
]);
$I->seeCurrentUrlEquals('/contact');
$I->see('Error sending your message.');
";i:1;s:3:"php";i:2;s:15:"ContactCept.php";}i:2;i:12922;}i:567;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12922;}i:568;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:"Chạy Functional Testing ";}i:2;i:13544;}i:569;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13576;}i:570;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:165:"
// Chạy tất cả các file Functional Testing
$ php codecept.phar run functional 
// Chạy 1 Functional Testing
$ php codecept.phar run functional ContactCept
";i:1;N;i:2;N;}i:2;i:13576;}i:571;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:13749;}i:572;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:13749;}}