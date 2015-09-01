a:807:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"Laravel Testing";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:32;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"1. Unit Test";i:1;i:1;i:2;i:32;}i:2;i:32;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:32;}i:6;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:60;}i:7;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"1.1 Giới thiệu";i:1;i:2;i:2;i:60;}i:2;i:60;}i:8;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:60;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:60;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:120:"Laravel được tích hợp sẵn PHPUnit. Sau khi cài xong Laravel bạn có thể chạy câu lệnh sau để test.";}i:2;i:92;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:218;}i:12;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:11:"
$ phpunit
";i:1;N;i:2;N;}i:2;i:218;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:218;}i:14;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:36:":capture_2015_08_27_13_38_38_794.png";i:1;s:8:"PHP Unit";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:239;}i:15;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:288;}i:16;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:290;}i:17;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:32:"1.2 Định nghĩa & chạy Test";i:1;i:2;i:2;i:290;}i:2;i:290;}i:18;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:290;}i:19;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:290;}i:20;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:116:"Các file test được đặt trong thư mục /tests, và thường được extend từ class TestCase. Ví dụ:";}i:2;i:336;}i:21;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:452;}i:22;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:125:"
class FooTest extends TestCase {

    public function testSomethingIsTrue()
    {
        $this->assertTrue(true);
    }

}
";i:1;s:3:"php";i:2;N;}i:2;i:459;}i:23;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:598;}i:24;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:23:"1.3 Môi trường test";i:1;i:2;i:2;i:598;}i:2;i:598;}i:25;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:598;}i:26;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:598;}i:27;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:158:"Khi chạy Unit Test, Laravel sẽ tự động cấu hình môi trường là testing.
Cấu hình môi trường test được đặt trong file phpunit.xml";}i:2;i:635;}i:28;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:799;}i:29;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:900:"
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
";i:1;s:3:"xml";i:2;s:11:"phpunit.xml";}i:2;i:799;}i:30;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1725;}i:31;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:45:"1.4 Gọi các thành phần trong test class";i:1;i:2;i:2;i:1725;}i:2;i:1725;}i:32;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1725;}i:33;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1783;}i:34;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"1.4.1 Gọi route";i:1;i:3;i:2;i:1783;}i:2;i:1783;}i:35;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1783;}i:36;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1783;}i:37;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:71:"Ta có thể gọi 1 route từ class Test bằng phương thức call.";}i:2;i:1811;}i:38;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1882;}i:39;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:425:"
// Full feature
$response1 = $this->call($method, $uri, $parameters, $cookies, $files, $server, $content);

// Gọi https
$response2 = $this->callSecure('GET', 'foo/bar');

// Gọi phương thức GET với địa chỉ là testRouting
$response = $this->call('GET', 'testRouting');



// VD: Kiểm tra link testRouting có nội dung Hello World hay không ?
$this->assertEquals('Hello World', $response->getContent());
";i:1;s:3:"php";i:2;s:15:"ExampleTest.php";}i:2;i:1889;}i:40;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1889;}i:41;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:50:"Trong file routes.php thêm 1 routing testRouting:";}i:2;i:2344;}i:42;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2400;}i:43;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:69:"
Route::get('testRouting', function(){
    return 'Hello World';
});
";i:1;s:3:"php";i:2;s:10:"routes.php";}i:2;i:2400;}i:44;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2496;}i:45;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:22:"1.4.2 Gọi Controller";i:1;i:3;i:2;i:2496;}i:2;i:2496;}i:46;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:2496;}i:47;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2496;}i:48;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:86:"Ta có thể gọi 1 action trong controller với phương thức và các tham số.";}i:2;i:2529;}i:49;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2615;}i:50;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:542:"
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
";i:1;s:3:"php";i:2;s:15:"ExampleTest.php";}i:2;i:2622;}i:51;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2622;}i:52;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:102:"Để kết quả test trả về đúng ta sửa action index trong file TestController.php như sau:";}i:2;i:3193;}i:53;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3301;}i:54;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:61:"
public function index()
    {
        return 'index';
    }
";i:1;s:3:"php";i:2;s:18:"TestController.php";}i:2;i:3301;}i:55;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3394;}i:56;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"1.4.3 Mocking Facades";i:1;i:3;i:2;i:3394;}i:2;i:3394;}i:57;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3394;}i:58;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3431;}i:59;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:26:"1.4.4 Framework Assertions";i:1;i:3;i:2;i:3431;}i:2;i:3431;}i:60;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3431;}i:61;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3469;}i:62;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"assertResponseOk";i:1;i:3;i:2;i:3469;}i:2;i:3469;}i:63;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3469;}i:64;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3469;}i:65;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:"Asserting Responses Are OK";}i:2;i:3496;}i:66;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3528;}i:67;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:95:"
public function testMethod()
{
    $this->call('GET', '/');

    $this->assertResponseOk();
}
";i:1;s:3:"php";i:2;N;}i:2;i:3528;}i:68;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3637;}i:69;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"assertResponseStatus";i:1;i:3;i:2;i:3637;}i:2;i:3637;}i:70;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3637;}i:71;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3637;}i:72;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:"Asserting Response Statuses";}i:2;i:3668;}i:73;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3701;}i:74;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:35:"
$this->assertResponseStatus(403);
";i:1;s:3:"php";i:2;N;}i:2;i:3701;}i:75;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3749;}i:76;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"assertRedirectedTo";i:1;i:3;i:2;i:3749;}i:2;i:3749;}i:77;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3749;}i:78;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3749;}i:79;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"Asserting Responses Are Redirects";}i:2;i:3778;}i:80;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3817;}i:81;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:137:"
$this->assertRedirectedTo('foo');

$this->assertRedirectedToRoute('route.name');

$this->assertRedirectedToAction('Controller@method');
";i:1;s:3:"php";i:2;N;}i:2;i:3817;}i:82;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3968;}i:83;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"assertViewHas";i:1;i:3;i:2;i:3968;}i:2;i:3968;}i:84;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:3968;}i:85;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3968;}i:86;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:"Asserting A View Has Some Data";}i:2;i:3992;}i:87;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4028;}i:88;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:139:"
public function testMethod()
{
    $this->call('GET', '/');

    $this->assertViewHas('name');
    $this->assertViewHas('age', $value);
}
";i:1;s:3:"php";i:2;N;}i:2;i:4028;}i:89;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4181;}i:90;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"assertSessionHas";i:1;i:3;i:2;i:4181;}i:2;i:4181;}i:91;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:4181;}i:92;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4181;}i:93;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:"Asserting The Session Has Some Data";}i:2;i:4208;}i:94;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4249;}i:95;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:145:"
public function testMethod()
{
    $this->call('GET', '/');

    $this->assertSessionHas('name');
    $this->assertSessionHas('age', $value);
}
";i:1;s:3:"php";i:2;N;}i:2;i:4249;}i:96;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4408;}i:97;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:22:"assertSessionHasErrors";i:1;i:3;i:2;i:4408;}i:2;i:4408;}i:98;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:4408;}i:99;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4408;}i:100;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:32:"Asserting The Session Has Errors";}i:2;i:4441;}i:101;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4473;}i:102;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:317:"
public function testMethod()
{
    $this->call('GET', '/');

    $this->assertSessionHasErrors();

    // Asserting the session has errors for a given key...
    $this->assertSessionHasErrors('name');

    // Asserting the session has errors for several keys...
    $this->assertSessionHasErrors(['name', 'age']);
}
";i:1;s:3:"php";i:2;N;}i:2;i:4480;}i:103;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4811;}i:104;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"assertHasOldInput";i:1;i:3;i:2;i:4811;}i:2;i:4811;}i:105;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:4811;}i:106;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4811;}i:107;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"Asserting Old Input Has Some Data";}i:2;i:4839;}i:108;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4872;}i:109;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:96:"
public function testMethod()
{
    $this->call('GET', '/');

    $this->assertHasOldInput();
}
";i:1;s:3:"php";i:2;N;}i:2;i:4879;}i:110;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4989;}i:111;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"1.4.5 Helper Methods";i:1;i:3;i:2;i:4989;}i:2;i:4989;}i:112;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:4989;}i:113;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4989;}i:114;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:79:"Class TestCase có nhiều các helper giúp cho việc testing dễ dàng hơn";}i:2;i:5021;}i:115;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5100;}i:116;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5102;}i:117;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"Thêm & gỡ Session";i:1;i:3;i:2;i:5102;}i:2;i:5102;}i:118;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:5102;}i:119;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:58:"
$this->session(['foo' => 'bar']);
$this->flushSession();
";i:1;s:3:"php";i:2;N;}i:2;i:5139;}i:120;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5211;}i:121;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:40:"Thiết lập cấp quyền thành viên";i:1;i:3;i:2;i:5211;}i:2;i:5211;}i:122;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:5211;}i:123;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:57:"
$user = new User(['name' => 'John']);
$this->be($user);
";i:1;s:3:"php";i:2;N;}i:2;i:5268;}i:124;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5339;}i:125;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"Cài lại database";i:1;i:3;i:2;i:5339;}i:2;i:5339;}i:126;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:5339;}i:127;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:48:"
$this->seed();

$this->seed('DatabaseSeeder');
";i:1;s:3:"php";i:2;N;}i:2;i:5375;}i:128;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5437;}i:129;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:32:"1.4.6 Refreshing The Application";i:1;i:3;i:2;i:5437;}i:2;i:5437;}i:130;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:5437;}i:131;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5437;}i:132;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:83:"Nếu ta muốn refresh lại Application khi testing 1 method, ta có thể dùng:";}i:2;i:5480;}i:133;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5569;}i:134;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:30:"
$this->refreshApplication();
";i:1;s:3:"php";i:2;N;}i:2;i:5569;}i:135;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5569;}i:136;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:76:"Phương thức trên sẽ reset lại các bindings, mock , IoC container. ";}i:2;i:5612;}i:137;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5688;}i:138;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5690;}i:139;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:28:"1.4.7 Table of Assert Method";i:1;i:3;i:2;i:5690;}i:2;i:5690;}i:140;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:5690;}i:141;a:3:{i:0;s:10:"table_open";i:1;a:3:{i:0;i:2;i:1;i:9;i:2;i:5730;}i:2;i:5729;}i:142;a:3:{i:0;s:15:"tablethead_open";i:1;a:0:{}i:2;i:5729;}i:143;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:5729;}i:144;a:3:{i:0;s:16:"tableheader_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5729;}i:145;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:5731;}i:146;a:3:{i:0;s:17:"tableheader_close";i:1;a:0:{}i:2;i:5732;}i:147;a:3:{i:0;s:16:"tableheader_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5732;}i:148;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:5733;}i:149;a:3:{i:0;s:17:"tableheader_close";i:1;a:0:{}i:2;i:5734;}i:150;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:5735;}i:151;a:3:{i:0;s:16:"tablethead_close";i:1;a:0:{}i:2;i:5735;}i:152;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:5735;}i:153;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;s:4:"left";i:2;i:1;}i:2;i:5735;}i:154;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:23:"AssertTrue/AssertFalse	";}i:2;i:5737;}i:155;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5760;}i:156;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5760;}i:157;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:48:" Check the input to verify it equals true/false ";}i:2;i:5761;}i:158;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5809;}i:159;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:5810;}i:160;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:5810;}i:161;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5810;}i:162;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"AssertEquals ";}i:2;i:5812;}i:163;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5825;}i:164;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;s:5:"right";i:2;i:1;}i:2;i:5825;}i:165;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:52:"	Check the result against another input for a match ";}i:2;i:5826;}i:166;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5878;}i:167;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:5879;}i:168;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:5879;}i:169;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5879;}i:170;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"AssertGreaterThan ";}i:2;i:5881;}i:171;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:5899;}i:172;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:5899;}i:173;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:122:" Check the result to see if it’s larger than a value (there’s also LessThan, GreaterThanOrEqual, and LessThanOrEqual) ";}i:2;i:5900;}i:174;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6022;}i:175;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:6023;}i:176;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:6023;}i:177;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6023;}i:178;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:15:"AssertContains ";}i:2;i:6025;}i:179;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6040;}i:180;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6040;}i:181;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:47:" Check that the input contains a certain value ";}i:2;i:6041;}i:182;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6088;}i:183;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:6089;}i:184;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:6089;}i:185;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6089;}i:186;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:"AssertType ";}i:2;i:6091;}i:187;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6102;}i:188;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6102;}i:189;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:44:" Check that a variable is of a certain type ";}i:2;i:6103;}i:190;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6147;}i:191;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:6148;}i:192;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:6148;}i:193;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6148;}i:194;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:"AssertNull ";}i:2;i:6150;}i:195;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6161;}i:196;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6161;}i:197;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:31:" Check that a variable is null ";}i:2;i:6162;}i:198;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6193;}i:199;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:6194;}i:200;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:6194;}i:201;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6194;}i:202;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:17:"AssertFileExists ";}i:2;i:6196;}i:203;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6213;}i:204;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6213;}i:205;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:" Verify that a file exists ";}i:2;i:6214;}i:206;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6241;}i:207;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:6242;}i:208;a:3:{i:0;s:13:"tablerow_open";i:1;a:0:{}i:2;i:6242;}i:209;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6242;}i:210;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"AssertRegExp ";}i:2;i:6244;}i:211;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6257;}i:212;a:3:{i:0;s:14:"tablecell_open";i:1;a:3:{i:0;i:1;i:1;N;i:2;i:1;}i:2;i:6257;}i:213;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:44:"Check the input against a regular expression";}i:2;i:6258;}i:214;a:3:{i:0;s:15:"tablecell_close";i:1;a:0:{}i:2;i:6302;}i:215;a:3:{i:0;s:14:"tablerow_close";i:1;a:0:{}i:2;i:6303;}i:216;a:3:{i:0;s:11:"table_close";i:1;a:1:{i:0;i:6303;}i:2;i:6303;}i:217;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6305;}i:218;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:34:"1.5 PHPUnit methods and properties";i:1;i:2;i:2;i:6305;}i:2;i:6305;}i:219;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:6305;}i:220;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6353;}i:221;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"$app";i:1;i:3;i:2;i:6353;}i:2;i:6353;}i:222;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:6353;}i:223;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6353;}i:224;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:44:"The instance of the Laravel 5.1 application.";}i:2;i:6369;}i:225;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6413;}i:226;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6415;}i:227;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"$code";i:1;i:3;i:2;i:6415;}i:2;i:6415;}i:228;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:6415;}i:229;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6415;}i:230;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:36:"The latest code returned by artisan.";}i:2;i:6432;}i:231;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6468;}i:232;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6470;}i:233;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"call";i:1;i:3;i:2;i:6470;}i:2;i:6470;}i:234;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:6470;}i:235;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6470;}i:236;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:16:"Calls the given ";}i:2;i:6485;}i:237;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"URI";}i:2;i:6501;}i:238;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:" and returns the response.";}i:2;i:6504;}i:239;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6536;}i:240;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:106:"
$this->call($method, $uri, $parameters = [], $cookies = [], $files = [], $server = [], $content = null);
";i:1;s:3:"php";i:2;N;}i:2;i:6536;}i:241;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6656;}i:242;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:10:"callSecure";i:1;i:3;i:2;i:6656;}i:2;i:6656;}i:243;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:6656;}i:244;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6656;}i:245;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"Calls the given HTTPS ";}i:2;i:6678;}i:246;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"URI";}i:2;i:6700;}i:247;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:" and returns the response.";}i:2;i:6703;}i:248;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6735;}i:249;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:104:"
callSecure($method, $uri, $parameters = [], $cookies = [], $files = [], $server = [], $content = null)
";i:1;s:3:"php";i:2;N;}i:2;i:6735;}i:250;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6853;}i:251;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"action";i:1;i:3;i:2;i:6853;}i:2;i:6853;}i:252;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:6853;}i:253;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6853;}i:254;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:51:"Calls a controller action and returns the response.";}i:2;i:6870;}i:255;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6927;}i:256;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:120:"
action($method, $action, $wildcards = [], $parameters = [], $cookies = [], $files = [], $server = [], $content = null)
";i:1;s:3:"php";i:2;N;}i:2;i:6927;}i:257;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7061;}i:258;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"route";i:1;i:3;i:2;i:7061;}i:2;i:7061;}i:259;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:7061;}i:260;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7061;}i:261;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:45:"Calls a named route and returns the response.";}i:2;i:7077;}i:262;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7128;}i:263;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:123:"
route($method, $name, $routeParameters = [], $parameters = [], $cookies = [], $files = [], $server = [], $content = null)
";i:1;s:3:"php";i:2;N;}i:2;i:7128;}i:264;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7265;}i:265;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"instance";i:1;i:3;i:2;i:7265;}i:2;i:7265;}i:266;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:7265;}i:267;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7265;}i:268;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:51:"Register an instance of an object in the container.";}i:2;i:7284;}i:269;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7341;}i:270;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:30:"
instance($abstract, $object)
";i:1;s:3:"php";i:2;N;}i:2;i:7341;}i:271;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7385;}i:272;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"expectsEvents";i:1;i:3;i:2;i:7385;}i:2;i:7385;}i:273;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:7385;}i:274;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7385;}i:275;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:70:"Specify a list of events that should be fired for the given operation.";}i:2;i:7409;}i:276;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7485;}i:277;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:24:"
expectsEvents($events)
";i:1;s:3:"php";i:2;N;}i:2;i:7485;}i:278;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7523;}i:279;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"withoutEvents";i:1;i:3;i:2;i:7523;}i:2;i:7523;}i:280;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:7523;}i:281;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7523;}i:282;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:53:"Mock the event dispatcher so all events are silenced.";}i:2;i:7547;}i:283;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7606;}i:284;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:17:"
withoutEvents()
";i:1;s:3:"php";i:2;N;}i:2;i:7606;}i:285;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7637;}i:286;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:11:"expectsJobs";i:1;i:3;i:2;i:7637;}i:2;i:7637;}i:287;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:7637;}i:288;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7637;}i:289;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:73:"Specify a list of jobs that should be dispatched for the given operation.";}i:2;i:7659;}i:290;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7738;}i:291;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:20:"
expectsJobs($jobs)
";i:1;s:3:"php";i:2;N;}i:2;i:7738;}i:292;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7772;}i:293;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:11:"withSession";i:1;i:3;i:2;i:7772;}i:2;i:7772;}i:294;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:7772;}i:295;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7772;}i:296;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:"Set the session to the given array.";}i:2;i:7794;}i:297;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7835;}i:298;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:26:"
withSession(array $data)
";i:1;s:3:"php";i:2;N;}i:2;i:7835;}i:299;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7875;}i:300;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"session";i:1;i:3;i:2;i:7875;}i:2;i:7875;}i:301;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:7875;}i:302;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7875;}i:303;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:58:"Starts session and sets the session values from the array.";}i:2;i:7893;}i:304;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:7957;}i:305;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:22:"
session(array $data)
";i:1;s:3:"php";i:2;N;}i:2;i:7957;}i:306;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:7993;}i:307;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"flushSession";i:1;i:3;i:2;i:7993;}i:2;i:7993;}i:308;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:7993;}i:309;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:7993;}i:310;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:44:"Flushes the contents of the current session.";}i:2;i:8016;}i:311;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8066;}i:312;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:16:"
flushSession()
";i:1;s:3:"php";i:2;N;}i:2;i:8066;}i:313;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8096;}i:314;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"startSession";i:1;i:3;i:2;i:8096;}i:2;i:8096;}i:315;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:8096;}i:316;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8096;}i:317;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:"Starts the application’s session.";}i:2;i:8119;}i:318;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8160;}i:319;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:16:"
startSession()
";i:1;s:3:"php";i:2;N;}i:2;i:8160;}i:320;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8190;}i:321;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"actingAs";i:1;i:3;i:2;i:8190;}i:2;i:8190;}i:322;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:8190;}i:323;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8190;}i:324;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:63:"(Fluent) Sets the currently logged in user for the application.";}i:2;i:8209;}i:325;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8278;}i:326;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:17:"
actingAs($user)
";i:1;s:3:"php";i:2;N;}i:2;i:8278;}i:327;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8309;}i:328;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:2:"be";i:1;i:3;i:2;i:8309;}i:2;i:8309;}i:329;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:8309;}i:330;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8309;}i:331;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:54:"Sets the currently logged in user for the application.";}i:2;i:8322;}i:332;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8382;}i:333;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:11:"
be($user)
";i:1;s:3:"php";i:2;N;}i:2;i:8382;}i:334;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8407;}i:335;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"seeInDatabase";i:1;i:3;i:2;i:8407;}i:2;i:8407;}i:336;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:8407;}i:337;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8407;}i:338;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:64:"(Fluent) Asserts a given where condition exists in the database.";}i:2;i:8431;}i:339;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8501;}i:340;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:56:"
seeInDatabase($table, array $data, $connection = null)
";i:1;s:3:"php";i:2;N;}i:2;i:8501;}i:341;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8571;}i:342;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"notSeeInDatabase";i:1;i:3;i:2;i:8571;}i:2;i:8571;}i:343;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:8571;}i:344;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8571;}i:345;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:72:"(Fluent) Asserts a given where condition does not exist in the database.";}i:2;i:8599;}i:346;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8671;}i:347;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:60:"
notSeeInDatabase($table, $array $data, $connection = null)
";i:1;s:3:"php";i:2;N;}i:2;i:8678;}i:348;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8752;}i:349;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"missingFromDatabase";i:1;i:3;i:2;i:8752;}i:2;i:8752;}i:350;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:8752;}i:351;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8752;}i:352;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:37:"(Fluent) Alias to notSeeInDatabase().";}i:2;i:8782;}i:353;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8825;}i:354;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:62:"
missingFromDatabase($table, array $data, $connection = null)
";i:1;s:3:"php";i:2;N;}i:2;i:8825;}i:355;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8901;}i:356;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:4:"seed";i:1;i:3;i:2;i:8901;}i:2;i:8901;}i:357;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:8901;}i:358;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8901;}i:359;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:19:"Seeds the database.";}i:2;i:8916;}i:360;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:8941;}i:361;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:8:"
seed()
";i:1;s:3:"php";i:2;N;}i:2;i:8941;}i:362;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8963;}i:363;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"artisan";i:1;i:3;i:2;i:8963;}i:2;i:8963;}i:364;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:8963;}i:365;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:8963;}i:366;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:50:"Executes the artisan command and returns the code.";}i:2;i:8981;}i:367;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9037;}i:368;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:37:"
artisan($command, $parameters = [])
";i:1;s:3:"php";i:2;N;}i:2;i:9037;}i:369;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9088;}i:370;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:22:"1.6 Using Gulp for TDD";i:1;i:2;i:2;i:9088;}i:2;i:9088;}i:371;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:9088;}i:372;a:3:{i:0;s:10:"quote_open";i:1;a:0:{}i:2;i:9122;}i:373;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:18:"http://gulpjs.com/";i:1;s:4:"Gulp";}i:2;i:9124;}i:374;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:56:": là hệ thống tự chạy viết bằng Javascript.";}i:2;i:9151;}i:375;a:3:{i:0;s:11:"quote_close";i:1;a:0:{}i:2;i:9207;}i:376;a:3:{i:0;s:10:"quote_open";i:1;a:0:{}i:2;i:9208;}i:377;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:"TDD : Test Driven Development.";}i:2;i:9210;}i:378;a:3:{i:0;s:11:"quote_close";i:1;a:0:{}i:2;i:9240;}i:379;a:3:{i:0;s:10:"quote_open";i:1;a:0:{}i:2;i:9241;}i:380;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:80:"Laravel Exlixir: là 1 api dùng để định nghĩa các tác vụ của Gulp.";}i:2;i:9243;}i:381;a:3:{i:0;s:11:"quote_close";i:1;a:0:{}i:2;i:9323;}i:382;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9323;}i:383;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:87:"Ta có thể dùng Gulp để app tự chạy UnitTest khi nội dung file thay đổi.";}i:2;i:9325;}i:384;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9412;}i:385;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:9414;}i:386;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"1.6.1 Install Gulp";i:1;i:3;i:2;i:9414;}i:2;i:9414;}i:387;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:9414;}i:388;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9414;}i:389;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:9443;}i:390;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:21:"Install Gulp globally";}i:2;i:9445;}i:391;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:9466;}i:392;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:9468;}i:393;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9474;}i:394;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:29:"
$ npm install --global gulp
";i:1;N;i:2;N;}i:2;i:9474;}i:395;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9474;}i:396;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:9512;}i:397;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:46:" Install gulp in your project devDependencies:";}i:2;i:9514;}i:398;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:9560;}i:399;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:9562;}i:400;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9568;}i:401;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:31:"
$ npm install --save-dev gulp
";i:1;N;i:2;N;}i:2;i:9568;}i:402;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9568;}i:403;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:9608;}i:404;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:49:"Create a gulpfile.js at the root of your project:";}i:2;i:9610;}i:405;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:9659;}i:406;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:9661;}i:407;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9667;}i:408;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:111:"
var gulp = require('gulp');

gulp.task('default', function() {
  // place code for your default task here
});
";i:1;N;i:2;N;}i:2;i:9667;}i:409;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9667;}i:410;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:9788;}i:411;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:9:"Run gulp:";}i:2;i:9790;}i:412;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:9799;}i:413;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:9801;}i:414;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9807;}i:415;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:8:"
$ gulp
";i:1;N;i:2;N;}i:2;i:9807;}i:416;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9807;}i:417;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:9825;}i:418;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"Install laravel-elixir";}i:2;i:9827;}i:419;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:9849;}i:420;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9851;}i:421;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9851;}i:422;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:"Cập nhật file package.json";}i:2;i:9853;}i:423;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:9889;}i:424;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:160:"
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
";i:1;s:2:"js";i:2;s:12:"package.json";}i:2;i:9889;}i:425;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:9889;}i:426;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:"Cài đặt laravel-elixir";}i:2;i:10074;}i:427;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10106;}i:428;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:15:"
$ npm install
";i:1;N;i:2;N;}i:2;i:10106;}i:429;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10130;}i:430;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"1.6.2 Run Gulp";i:1;i:3;i:2;i:10130;}i:2;i:10130;}i:431;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:10130;}i:432;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10130;}i:433;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:"Cập nhật file gulpfile.js";}i:2;i:10155;}i:434;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10190;}i:435;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:88:"
var elixir = require('laravel-elixir');

elixir(function(mix) {
    mix.phpUnit();
});
";i:1;s:2:"js";i:2;s:11:"gulpfile.js";}i:2;i:10190;}i:436;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10190;}i:437;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:26:"Chạy gulp tự động :";}i:2;i:10303;}i:438;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10335;}i:439;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:12:"
$ gulp tdd
";i:1;N;i:2;N;}i:2;i:10335;}i:440;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10357;}i:441;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"2. Codeception";i:1;i:1;i:2;i:10357;}i:2;i:10357;}i:442;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:10357;}i:443;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10386;}i:444;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"2.1 Giới thiệu";i:1;i:2;i:2;i:10386;}i:2;i:10386;}i:445;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:10386;}i:446;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10386;}i:447;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:23:"http://codeception.com/";i:1;s:11:"Codeception";}i:2;i:10417;}i:448;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:77:" là 1 một BBD PHP test framework.
Codeception bao gồm các loại như :";}i:2;i:10456;}i:449;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10533;}i:450;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:10533;}i:451;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:10533;}i:452;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:10533;}i:453;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:" PHPUnit test";}i:2;i:10537;}i:454;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:10550;}i:455;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:10550;}i:456;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:10550;}i:457;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:10550;}i:458;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:77:" Acceptance Testing : test giao diện bằng Selenium WebDriver, PhpBrowser.";}i:2;i:10554;}i:459;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:10631;}i:460;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:10631;}i:461;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:10631;}i:462;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:10631;}i:463;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:152:" Functional Testing : có thể test nhiều framwork như: ymfony2, Laravel, Yii, Phalcon, Zend Framework, Kohana, Databases, REST, SOAP, CodeCoverage.";}i:2;i:10635;}i:464;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:10787;}i:465;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:10787;}i:466;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:10787;}i:467;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:10787;}i:468;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:10791;}i:469;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"API";}i:2;i:10792;}i:470;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:64:" Testing : REST, SOAP, XML-RPC via PHPBrowser or PHP Frameworks.";}i:2;i:10795;}i:471;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:10859;}i:472;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:10859;}i:473;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:10859;}i:474;a:3:{i:0;s:10:"quote_open";i:1;a:0:{}i:2;i:10860;}i:475;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:10862;}i:476;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:3:"BBD";}i:2;i:10864;}i:477;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:10867;}i:478;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:": Behavior Driven Development";}i:2;i:10869;}i:479;a:3:{i:0;s:11:"quote_close";i:1;a:0:{}i:2;i:10898;}i:480;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:10900;}i:481;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"2.2 Cài đặt";i:1;i:2;i:2;i:10900;}i:2;i:10900;}i:482;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:10900;}i:483;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10900;}i:484;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"Cài bằng composer";}i:2;i:10928;}i:485;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:10954;}i:486;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:57:"
$ php composer.phar require "codeception/codeception:*"
";i:1;N;i:2;N;}i:2;i:10954;}i:487;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:10954;}i:488;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:61:"Download source code về thư mục gốc của ứng dụng";}i:2;i:11020;}i:489;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11087;}i:490;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:45:"
$ wget http://codeception.com/codecept.phar
";i:1;N;i:2;N;}i:2;i:11087;}i:491;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11087;}i:492;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:25:"Khởi tạo codeception:";}i:2;i:11141;}i:493;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11172;}i:494;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:31:"
$ php codecept.phar bootstrap
";i:1;N;i:2;N;}i:2;i:11172;}i:495;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:11172;}i:496;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:"Tạo 1 acceptance test;";}i:2;i:11212;}i:497;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:11242;}i:498;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:54:"
$ php codecept.phar generate:cept acceptance Welcome
";i:1;N;i:2;N;}i:2;i:11242;}i:499;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:11306;}i:500;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:42:"3. Acceptance Testing & Functional Testing";i:1;i:1;i:2;i:11306;}i:2;i:11306;}i:501;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:11306;}i:502;a:3:{i:0;s:10:"quote_open";i:1;a:0:{}i:2;i:11363;}i:503;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:11365;}i:504;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"Acceptance testing";}i:2;i:11367;}i:505;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:11385;}i:506;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:252:" can be performed by a non-technical person. That person can be your tester, manager or even client. If you are developing a web-application (and probably you are) the tester needs nothing more than a web browser to check that your site works correctly";}i:2;i:11387;}i:507;a:3:{i:0;s:11:"quote_close";i:1;a:0:{}i:2;i:11639;}i:508;a:3:{i:0;s:10:"quote_open";i:1;a:0:{}i:2;i:11640;}i:509;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:11642;}i:510;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"Functional testing";}i:2;i:11644;}i:511;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:11662;}i:512;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:380:": Now that we've written some acceptance tests, functional tests are almost the same, with just one major difference: functional tests don't require a web server to run tests. In simple terms we set $_REQUEST, $_GET and $_POST variables and then we execute application from a test. This may be valuable as functional tests are faster and provide detailed stack traces on failures.";}i:2;i:11664;}i:513;a:3:{i:0;s:11:"quote_close";i:1;a:0:{}i:2;i:12044;}i:514;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:12045;}i:515;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:22:"3.1 Functional Testing";i:1;i:2;i:2;i:12045;}i:2;i:12045;}i:516;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:12045;}i:517;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:12080;}i:518;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:36:"3.1.1 Cấu hình Functional Testing";i:1;i:3;i:2;i:12080;}i:2;i:12080;}i:519;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:12080;}i:520;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12080;}i:521;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:65:"Để tạo 1 functional Contact Testing , ta chạy command sau:";}i:2;i:12127;}i:522;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12198;}i:523;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:56:"
$ php codecept.phar generate:cept functional Contact  
";i:1;N;i:2;N;}i:2;i:12198;}i:524;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12198;}i:525;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:91:"Cập nhật nội dung file functional.suite.yml: thêm module laravel5 vào function test";}i:2;i:12263;}i:526;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12360;}i:527;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:105:"
class_name: FunctionalTester  
modules:  
    enabled: 
        - Laravel5
        - \Helper\Functional
";i:1;s:3:"yml";i:2;s:18:"function.suite.yml";}i:2;i:12360;}i:528;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12360;}i:529;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:23:"Build lại codeception";}i:2;i:12498;}i:530;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12527;}i:531;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:29:"
$ php codecept.phar build  
";i:1;N;i:2;N;}i:2;i:12527;}i:532;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:12565;}i:533;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:30:"3.1.2 Functional Testing mẫu";i:1;i:3;i:2;i:12565;}i:2;i:12565;}i:534;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:12565;}i:535;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12565;}i:536;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:48:"Nội dung cần test có kịch bản như sau:";}i:2;i:12606;}i:537;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12654;}i:538;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:12654;}i:539;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:12654;}i:540;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:12654;}i:541;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:" Tôi đang ở trang contact";}i:2;i:12658;}i:542;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:12687;}i:543;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:12687;}i:544;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:12687;}i:545;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:12687;}i:546;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:75:" Tôi điền đúng thông tin vào form contact :name, email and comment.";}i:2;i:12691;}i:547;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:12766;}i:548;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:12766;}i:549;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:12766;}i:550;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:12766;}i:551;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:" Tôi nhấn nút submit";}i:2;i:12770;}i:552;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:12794;}i:553;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:12794;}i:554;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:12794;}i:555;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:12794;}i:556;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:54:" Tôi vẫn ở trang contact và tôi thấy message ";}i:2;i:12798;}i:557;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:12852;}i:558;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"Message sent!";}i:2;i:12853;}i:559;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:12866;}i:560;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:12867;}i:561;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:12867;}i:562;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:12867;}i:563;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12867;}i:564;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:44:"Functional Testing được viết như sau:";}i:2;i:12868;}i:565;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:12918;}i:566;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:354:"
<?php
 $I = new FunctionalTester($scenario);
 
$I->am('guest');
$I->wantTo('send email using contact form.');

$I->amOnPage('/contact');

$I->submitForm('.contact-form', [
    'name' => 'Mario Basic',
    'email' => 'test@test.com',
    'comment' => 'This is a codeception test email.'
]);
$I->seeCurrentUrlEquals('/contact');
$I->see('Message sent!');
";i:1;s:3:"php";i:2;s:15:"ContactCept.php";}i:2;i:12918;}i:567;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:12918;}i:568;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:67:"Ta chuẩn 2 file source code như sau:
1. File Contact Controller:";}i:2;i:13302;}i:569;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13375;}i:570;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:373:"
namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class ContactController extends Controller
{
    public function getIndex()
    {
        return view('contact.index', ['msg' => '']);
    }

    public function postIndex() {
        return view('contact.index', ['msg' => 'Message sent!']);
    }
";i:1;s:3:"php";i:2;s:21:"ContactController.php";}i:2;i:13375;}i:571;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13375;}i:572;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"2. File contact view :";}i:2;i:13784;}i:573;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:13812;}i:574;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:480:"
<!DOCTYPE>
<html>
<title>Demo Functional Testing</title>
<body>
    <form action="" method="post" accept-charset="utf-8" class="contact-form">
        <input type="hidden" name="_token" value="{{ csrf_token() }}">
        <input type="text" name="name" value="" placeholder="">
        <input type="email" name="email" value="">
        <input type="text" name="comment" value="">
        <input type="submit" name="submit" value="OK">
    </form>
    {{ $msg }}
</body>
</html>
";i:1;s:3:"php";i:2;s:15:"index.blade.php";}i:2;i:13812;}i:575;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:13812;}i:576;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:111:"Và giờ ta chạy Functional Testing để kiểm tra kịch bản chạy có pass được hết hay không.";}i:2;i:14323;}i:577;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:14440;}i:578;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:293:"
// Chạy tất cả các file Functional Testing
$ php codecept.phar run functional 

// Chạy 1 Functional Testing
$ php codecept.phar run functional ContactCept

// Chạy 1 Functional Testing theo từng bước trong kịch bản
$ php codecept.phar run functional ContactCept --steps

";i:1;N;i:2;N;}i:2;i:14440;}i:579;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:14440;}i:580;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:37:"::capture_2015_08_28_09_08_29_282.png";i:1;s:23:"Fail Functional Testing";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:14743;}i:581;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:81:"
Demo chạy functional test bị lỗi. Khi pass test sẽ có dạng như sau :";}i:2;i:14808;}i:582;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:14889;}i:583;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:14889;}i:584;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:36:":capture_2015_08_28_09_23_37_673.png";i:1;s:26:"Success Functional Testing";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:14891;}i:585;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:14958;}i:586;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:14960;}i:587;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"3.1.4 Demo project";i:1;i:3;i:2;i:14960;}i:2;i:14960;}i:588;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:14960;}i:589;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:14960;}i:590;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"Link: ";}i:2;i:14990;}i:591;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:63:"https://github.com/janhenkgerritsen/codeception-laravel5-sample";i:1;s:28:"Codeception Laravel 5 Sample";}i:2;i:14996;}i:592;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15092;}i:593;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:15092;}i:594;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:"Clone repo";}i:2;i:15094;}i:595;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15110;}i:596;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:89:"
$ git clone https://github.com/janhenkgerritsen/codeception-laravel5-sample.git testing
";i:1;N;i:2;N;}i:2;i:15110;}i:597;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:15110;}i:598;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:45:"Create your .env file from the example file: ";}i:2;i:15208;}i:599;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15259;}i:600;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:24:"
$ cp .env.testing .env
";i:1;N;i:2;N;}i:2;i:15259;}i:601;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:15259;}i:602;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:31:"Install composer dependencies: ";}i:2;i:15292;}i:603;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15329;}i:604;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:20:"
$ composer install
";i:1;N;i:2;N;}i:2;i:15329;}i:605;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:15329;}i:606;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:49:"Create databases by creating the following files:";}i:2;i:15358;}i:607;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15413;}i:608;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:64:"
$ touch storage/database.sqlite
$ touch storage/testing.sqlite
";i:1;N;i:2;N;}i:2;i:15413;}i:609;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:15413;}i:610;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:"Run the following commands:";}i:2;i:15486;}i:611;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15519;}i:612;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:71:"
$ php artisan migrate
$ php artisan migrate --database=sqlite_testing
";i:1;N;i:2;N;}i:2;i:15519;}i:613;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:15600;}i:614;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"3.2 Acceptance Test";i:1;i:2;i:2;i:15600;}i:2;i:15600;}i:615;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:15600;}i:616;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:15600;}i:617;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:261:"Acceptance Test: dùng để test giao diện , dành cho những người không biết về kỹ thuật. Công việc của Tester chỉ là viết kịch bản và theo dõi test trực tiếp trên trình duyệt. 1 Kịch bản mẫu về acceptance test:";}i:2;i:15633;}i:618;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:15900;}i:619;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:150:"
I WANT TO SIGN IN
I am on page '/login'
I fill field 'username', 'davert'
I fill field 'password', 'qwerty'
I click 'LOGIN'
I see 'Welcome, Davert!'
";i:1;N;i:2;N;}i:2;i:15900;}i:620;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:15900;}i:621;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:"Chuyển qua php như sau :";}i:2;i:16060;}i:622;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:16093;}i:623;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:218:"
<?php
$I = new AcceptanceTester($scenario);
$I->wantTo('sign in');
$I->amOnPage('/login');
$I->fillField('username', 'davert');
$I->fillField('password', 'qwerty');
$I->click('LOGIN');
$I->see('Welcome, Davert!');
?>
";i:1;s:3:"php";i:2;N;}i:2;i:16093;}i:624;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:16325;}i:625;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"3.2.1 PHP Browser";i:1;i:3;i:2;i:16325;}i:2;i:16325;}i:626;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:16325;}i:627;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:16325;}i:628;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:185:"Nếu ta không muốn chạy trực tiếp trên trình duyệt ta có thể dùng PHP Browser chạy ngầm. Để cấu hình PHP Browser ta sửa file acceptance.suite.yml như sau:";}i:2;i:16353;}i:629;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:16544;}i:630;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:136:"
class_name: AcceptanceTester
modules:
    enabled:
        - PhpBrowser:
            url: http://demo.app
        - \Helper\Acceptance
";i:1;s:4:"java";i:2;N;}i:2;i:16544;}i:631;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:16544;}i:632;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:42:"Chạy lệnh build để load cấu hình";}i:2;i:16695;}i:633;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:16743;}i:634;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:27:"
$ php codecept.phar build
";i:1;N;i:2;N;}i:2;i:16743;}i:635;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:16743;}i:636;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:100:"Ta tạo 1 file kịch bản giống như trên ( functional Test) /tests/acceptance/ContactCept.php";}i:2;i:16780;}i:637;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:16886;}i:638;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:282:"
$I = new AcceptanceTester($scenario);

$I->amOnPage('/contact');

$I->submitForm('.contact-form', [
    'name' => 'Mario Basic',
    'email' => 'test@test.com',
    'comment' => 'This is a codeception test email.'
]);
$I->seeCurrentUrlEquals('/contact');
$I->see('Message sent!');
";i:1;s:3:"php";i:2;s:15:"ContactCept.php";}i:2;i:16886;}i:639;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:16886;}i:640;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:178:"Bắt đầu test: ( trước đó ta phải cài đặt desktop, Selenium server , java, firefox ) . Lệnh test này phải được chạy trong bên trong màn hình desktop.";}i:2;i:17198;}i:641;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:17382;}i:642;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:48:"
$ php codecept.phar run acceptance ContactCept
";i:1;N;i:2;N;}i:2;i:17382;}i:643;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:17441;}i:644;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:34:"3.2.2 Selenium Server & Phantom JS";i:1;i:3;i:2;i:17441;}i:2;i:17441;}i:645;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:17441;}i:646;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:17441;}i:647;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:121:"Để chạy testing trên trình duyệt ta phải cài đặt 1 server selenium hoặc 1 webdriver PhantomJS[optional].";}i:2;i:17487;}i:648;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:17609;}i:649;a:3:{i:0;s:10:"quote_open";i:1;a:0:{}i:2;i:17609;}i:650;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:287:"Selenium automates browsers. That's it! What you do with that power is entirely up to you. Primarily, it is for automating web applications for testing purposes, but is certainly not limited to just that. Boring web-based administration tasks can (and should!) also be automated as well.";}i:2;i:17611;}i:651;a:3:{i:0;s:11:"quote_close";i:1;a:0:{}i:2;i:17898;}i:652;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:17898;}i:653;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:62:"Download Selenium Server vào trong thư mục root của app:";}i:2;i:17900;}i:654;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:17962;}i:655;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:17962;}i:656;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:20:"http://goo.gl/yLJLZg";i:1;s:15:"Selenium Server";}i:2;i:17964;}i:657;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:18004;}i:658;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18005;}i:659;a:3:{i:0;s:10:"quote_open";i:1;a:0:{}i:2;i:18005;}i:660;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:153:"PhantomJS is a headless alternative to Selenium Server that implements the WebDriver protocol. It allows you to run Selenium tests on a server without a ";}i:2;i:18007;}i:661;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"GUI";}i:2;i:18160;}i:662;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:" installed.";}i:2;i:18163;}i:663;a:3:{i:0;s:11:"quote_close";i:1;a:0:{}i:2;i:18174;}i:664;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18174;}i:665;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:"Download & Install PhantomJS :";}i:2;i:18176;}i:666;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18206;}i:667;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18206;}i:668;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:34:"http://phantomjs.org/download.html";i:1;s:9:"PhantomJS";}i:2;i:18208;}i:669;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18256;}i:670;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:18259;}i:671;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:56:"3.2.3 Các bước chạy Acceptance Test với Selenium";i:1;i:3;i:2;i:18259;}i:2;i:18259;}i:672;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:18259;}i:673;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18259;}i:674;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:18327;}i:675;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:37:" Cài giao diện desktop cho Ubuntu ";}i:2;i:18329;}i:676;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:18366;}i:677;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18368;}i:678;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18368;}i:679;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"Link gốc : ";}i:2;i:18370;}i:680;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:97:"https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-vnc-on-ubuntu-14-04";i:1;s:29:"Tut install desktop on Ubuntu";}i:2;i:18383;}i:681;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:45:"
- Install Desktop Environment and VNC Server";}i:2;i:18514;}i:682;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18559;}i:683;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:77:"
sudo apt-get update
sudo apt-get install xfce4 xfce4-goodies tightvncserver
";i:1;N;i:2;N;}i:2;i:18566;}i:684;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18566;}i:685;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:106:"To complete the VNC server's initial configuration, use the vncserver command to set up a secure password:";}i:2;i:18652;}i:686;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18764;}i:687;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:11:"
vncserver
";i:1;N;i:2;N;}i:2;i:18764;}i:688;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18764;}i:689;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:172:" - Configure VNC Server
Since we are going to be changing how our VNC servers are configured, we'll need to first stop the VNC server instance that is running on port 5901:";}i:2;i:18784;}i:690;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:18962;}i:691;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:20:"
vncserver -kill :1
";i:1;N;i:2;N;}i:2;i:18962;}i:692;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:18962;}i:693;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:103:"Before we begin configuring our new xstartup file, let's back up the original in case we need it later:";}i:2;i:18992;}i:694;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:19095;}i:695;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:40:"
mv ~/.vnc/xstartup ~/.vnc/xstartup.bak
";i:1;N;i:2;N;}i:2;i:19102;}i:696;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:19102;}i:697;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:46:"Now we can open a new xstartup file with nano:";}i:2;i:19152;}i:698;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:19198;}i:699;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:22:"
nano ~/.vnc/xstartup
";i:1;N;i:2;N;}i:2;i:19205;}i:700;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:19205;}i:701;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:123:"Insert these commands into the file so that they are performed automatically whenever you start or restart your VNC server:";}i:2;i:19237;}i:702;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:19360;}i:703;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:49:"
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
";i:1;N;i:2;N;}i:2;i:19367;}i:704;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:19367;}i:705;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:67:"The first command in the file, xrdb $HOME/.Xresources, tells VNC's ";}i:2;i:19426;}i:706;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:3:"GUI";}i:2;i:19493;}i:707;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:202:" framework to read the server user's .Xresources file. .Xresources is where a user can make changes to certain settings of the graphical desktop, like terminal colors, cursor themes, and font rendering.";}i:2;i:19496;}i:708;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:19698;}i:709;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:19698;}i:710;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:166:"The second command simply tells the server to launch XFCE, which is where you will find all of the graphical software that you need to comfortably manage your server.";}i:2;i:19700;}i:711;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:19866;}i:712;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:19866;}i:713;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:130:"To ensure that the VNC server will be able to use this new startup file properly, we'll need to grant executable privileges to it:";}i:2;i:19868;}i:714;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:19998;}i:715;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:31:"
sudo chmod +x ~/.vnc/xstartup
";i:1;N;i:2;N;}i:2;i:20005;}i:716;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:20045;}i:717;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"Create a VNC Service File";i:1;i:3;i:2;i:20045;}i:2;i:20045;}i:718;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:20045;}i:719;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:20045;}i:720;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:152:"To easily control our new VNC server, we should set it up as an Ubuntu service. This will allow us to start, stop, and restart our VNC server as needed.";}i:2;i:20082;}i:721;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:20234;}i:722;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:20234;}i:723;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:56:"First, open a new service file in /etc/init.d with nano:";}i:2;i:20236;}i:724;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:20292;}i:725;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:33:"
sudo nano /etc/init.d/vncserver
";i:1;N;i:2;N;}i:2;i:20299;}i:726;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:20299;}i:727;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:152:"The first block of data will be where we declare some common settings that VNC will be referring to a lot, like our username and the display resolution.";}i:2;i:20342;}i:728;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:20494;}i:729;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:198:"
#!/bin/bash
PATH="$PATH:/usr/bin/"
export USER="vagrant"
DISPLAY="1"
DEPTH="16"
GEOMETRY="1024x768"
OPTIONS="-depth ${DEPTH} -geometry ${GEOMETRY} :${DISPLAY} -localhost"
. /lib/lsb/init-functions
";i:1;N;i:2;N;}i:2;i:20501;}i:730;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:20501;}i:731;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:80:"Be sure to replace user with the non-root user that you have set up, and change ";}i:2;i:20709;}i:732;a:3:{i:0;s:14:"multiplyentity";i:1;a:2:{i:0;s:4:"1024";i:1;s:3:"768";}i:2;i:20789;}i:733;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:71:" if you want to use another screen resolution for your virtual display.";}i:2;i:20797;}i:734;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:20868;}i:735;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:20868;}i:736;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:236:"Next, we can start inserting the command instructions that will allow us to manage the new service. The following block binds the command needed to start a VNC server, and feedback that it is being started, to the command keyword start.";}i:2;i:20870;}i:737;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:21106;}i:738;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:155:"
case "$1" in
start)
log_action_begin_msg "Starting vncserver for user '${USER}' on localhost:${DISPLAY}"
su ${USER} -c "/usr/bin/vncserver ${OPTIONS}"
;;
";i:1;N;i:2;N;}i:2;i:21113;}i:739;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:21113;}i:740;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:109:"The next block creates the command keyword stop, which will immediately kill an existing VNC server instance.";}i:2;i:21278;}i:741;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:21387;}i:742;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:148:"
stop)
log_action_begin_msg "Stopping vncserver for user '${USER}' on localhost:${DISPLAY}"
su ${USER} -c "/usr/bin/vncserver -kill :${DISPLAY}"
;;
";i:1;N;i:2;N;}i:2;i:21394;}i:743;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:21394;}i:744;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:137:"The final block is for the command keyword restart, which is simply the two previous commands (stop and start) combined into one command.";}i:2;i:21552;}i:745;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:21689;}i:746;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:42:"
restart)
$0 stop
$0 start
;;
esac
exit 0
";i:1;N;i:2;N;}i:2;i:21696;}i:747;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:21696;}i:748;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:178:"Once all of those blocks are in your service script, you can save and close that file. Make this service script executable, so that you can use the commands that you just set up:";}i:2;i:21748;}i:749;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:21926;}i:750;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:66:"
sudo chmod +x /etc/init.d/vncserver
sudo service vncserver start
";i:1;N;i:2;N;}i:2;i:21933;}i:751;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:21933;}i:752;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:207:"- Connect to Your VNC Desktop
To test your VNC server, you'll need to use a client that supports VNC connections over SSH tunnels. If you are using Windows, you could use TightVNC, RealVNC, or UltraVNC. Mac ";}i:2;i:22008;}i:753;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:2:"OS";}i:2;i:22215;}i:754;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:91:" X users can use the built-in Screen Sharing, or can use a cross-platform app like RealVNC.";}i:2;i:22217;}i:755;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:22308;}i:756;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:22308;}i:757;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:171:"First, we need to create an SSH connection on your local computer that securely forwards to the localhost connection for VNC. You can do this via the terminal on Linux or ";}i:2;i:22310;}i:758;a:3:{i:0;s:7:"acronym";i:1;a:1:{i:0;s:2:"OS";}i:2;i:22481;}i:759;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:" X via the following command:";}i:2;i:22483;}i:760;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:22512;}i:761;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:159:"
ssh -L 5901:127.0.0.1:5901 -N -f -l user server_ip_address

// Thay user vagrant , ip 192.168.10.10
ssh -L 5901:127.0.0.1:5901 -N -f -l vagrant 192.168.10.10
";i:1;N;i:2;N;}i:2;i:22519;}i:762;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:22519;}i:763;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:198:"Next, you can use your VNC viewer to connect to the VNC server at localhost:5901. Make sure you don't forget that :5901 at the end, as that is the only port that the VNC instance is accessible from.";}i:2;i:22688;}i:764;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:22886;}i:765;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:22886;}i:766;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:36:"::capture_2015_09_01_11_07_23_24.png";i:1;s:14:"Ubuntu Desktop";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:22888;}i:767;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:22943;}i:768;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:22943;}i:769;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:22946;}i:770;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"Chạy server Selenium";}i:2;i:22948;}i:771;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:22970;}i:772;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:" :";}i:2;i:22972;}i:773;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:22974;}i:774;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:22974;}i:775;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:33:"Chạy server Selenium dùng ssh.";}i:2;i:22976;}i:776;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:23015;}i:777;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:244:"
// Nếu server chưa có java thì ta phải cài đặt java
sudo apt-get install default-jre

// Nếu chưa có firefox 
sudeo apt-get install firefox

// Chạy server selenium bằng ssh
$ java -jar selenium-server-standalone-2.47.1.jar
";i:1;N;i:2;N;}i:2;i:23015;}i:778;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:23015;}i:779;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:23269;}i:780;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:46:"Cập nhật file config của Acceptance test";}i:2;i:23271;}i:781;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:23317;}i:782;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:43:", chọn trình duyệt chạy là firefox:";}i:2;i:23319;}i:783;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:23368;}i:784;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:231:"
class_name: AcceptanceTester
modules:
    enabled:
        - WebDriver:
            url: http://demo.app
            browser: firefox
            window_size: 1024x768
            wait: 10            
        - \Helper\Acceptance
";i:1;s:3:"xml";i:2;s:20:"acceptance.suite.yml";}i:2;i:23368;}i:785;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:23368;}i:786;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:23633;}i:787;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:24:"Build lại file config:";}i:2;i:23635;}i:788;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:23659;}i:789;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:23661;}i:790;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:27:"
$ php codecept.phar build
";i:1;N;i:2;N;}i:2;i:23668;}i:791;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:23668;}i:792;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:23705;}i:793;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:23:"Chạy Acceptance Test:";}i:2;i:23707;}i:794;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:23730;}i:795;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:74:"
Trong giao diện desktop của Ubuntu , chạy lệnh test trong console";}i:2;i:23732;}i:796;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:23812;}i:797;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:48:"
$ php codecept.phar run acceptance ContactCept
";i:1;N;i:2;N;}i:2;i:23812;}i:798;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:23812;}i:799;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:277:"Nội dung file ContactCept.php gần giống với file trong Functional Testing. Ta có thể thêm hàm wait để thấy rõ hơn trên duyệt. Khi chạy Test ta sẽ thấy 1 trình duyệt firefox bật lên trên màn hình và thực hiện các thao tác cần test.";}i:2;i:23869;}i:800;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:24146;}i:801;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:24146;}i:802;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:37:"::capture_2015_09_01_11_12_07_164.png";i:1;s:32:"Run acceptance test with browser";i:2;N;i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:24148;}i:803;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:24222;}i:804;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:371:"
<?php
$I = new AcceptanceTester($scenario);

$I->am('guest');
$I->wantTo('send email using contact form.');
 
$I->amOnPage('/contact');
 
$I->submitForm('.contact-form', [
    'name' => 'Mario Basic',
    'email' => 'test@test.com',
    'comment' => 'This is a codeception test email.'
]);
$I->seeCurrentUrlEquals('/contact');
$I->wait(10);
$I->see('Message sent!');
?>
";i:1;s:3:"php";i:2;s:15:"ContactCept.php";}i:2;i:24231;}i:805;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:24632;}i:806;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:24632;}}