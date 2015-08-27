a:248:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"Blade Template";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:31;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"Introduction";i:1;i:2;i:2;i:31;}i:2;i:31;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:31;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:31;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:449:"Blade is the simple, yet powerful templating engine provided with Laravel. Unlike other popular PHP templating engines, Blade does not restrict you from using plain PHP code in your views. All Blade views are compiled into plain PHP code and cached until they are modified, meaning Blade adds essentially zero overhead to your application. Blade view files use the .blade.php file extension and are typically stored in the resources/views directory.";}i:2;i:57;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:506;}i:9;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:508;}i:10;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"Directive";i:1;i:2;i:2;i:508;}i:2;i:508;}i:11;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:508;}i:12;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:530;}i:13;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:530;}i:14;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:530;}i:15;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:534;}i:16;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:535;}i:17;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"@yield";}i:2;i:537;}i:18;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:543;}i:19;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:64:" : directive is used to display the contents of a given section.";}i:2;i:545;}i:20;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:609;}i:21;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:609;}i:22;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:609;}i:23;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:609;}i:24;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:613;}i:25;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:614;}i:26;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:8:"@section";}i:2;i:616;}i:27;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:624;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:64:" : directive, as the name implies, defines a section of content.";}i:2;i:626;}i:29;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:690;}i:30;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:690;}i:31;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:690;}i:32;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:690;}i:33;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:694;}i:34;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:695;}i:35;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:"@endsection";}i:2;i:697;}i:36;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:708;}i:37;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:27:" : close the section above.";}i:2;i:710;}i:38;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:737;}i:39;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:737;}i:40;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:737;}i:41;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:737;}i:42;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:"Ex :";}i:2;i:738;}i:43;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:748;}i:44;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:79:"
@section('title', 'This is title')
...
<title>Home - @yield('title') </title>
";i:1;s:11:"html4strict";i:2;N;}i:2;i:748;}i:45;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:840;}i:46;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:840;}i:47;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:840;}i:48;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:844;}i:49;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:845;}i:50;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:8:"@extends";}i:2;i:847;}i:51;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:855;}i:52;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:50:" :  to specify which layout the child page should ";}i:2;i:857;}i:53;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:907;}i:54;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"inherit";}i:2;i:908;}i:55;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:915;}i:56;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:".";}i:2;i:916;}i:57;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:917;}i:58;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:917;}i:59;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:917;}i:60;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:917;}i:61;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:921;}i:62;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:922;}i:63;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:"@show";}i:2;i:924;}i:64;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:929;}i:65;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:" :";}i:2;i:931;}i:66;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:933;}i:67;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:933;}i:68;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:933;}i:69;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:933;}i:70;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:937;}i:71;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:938;}i:72;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:8:"@include";}i:2;i:940;}i:73;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:948;}i:74;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:111:" :  allows you to easily include a Blade view from within an existing view. You can also pass paramters to view";}i:2;i:950;}i:75;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1061;}i:76;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1061;}i:77;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:1061;}i:78;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1061;}i:79;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:4:"Ex :";}i:2;i:1062;}i:80;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1072;}i:81;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:43:"
@include('view.name', ['some' => 'data'])
";i:1;s:11:"html4strict";i:2;N;}i:2;i:1072;}i:82;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:1128;}i:83;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1128;}i:84;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1128;}i:85;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1132;}i:86;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1133;}i:87;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"@parent";}i:2;i:1135;}i:88;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1142;}i:89;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:157:" :  to append (rather than overwriting) content to the layout. The @parent directive will be replaced by the content of the layout when the view is rendered.";}i:2;i:1144;}i:90;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1301;}i:91;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1301;}i:92;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1301;}i:93;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1301;}i:94;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1305;}i:95;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1306;}i:96;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:"@each";}i:2;i:1308;}i:97;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1313;}i:98;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:74:" :  combine loops and includes into one line with Blade's @each directive.";}i:2;i:1315;}i:99;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1389;}i:100;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1389;}i:101;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:1389;}i:102;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:1389;}i:103;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:1393;}i:104;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:1394;}i:105;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:"@show";}i:2;i:1396;}i:106;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:1401;}i:107;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:" :";}i:2;i:1403;}i:108;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:1405;}i:109;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:1405;}i:110;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:1405;}i:111;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1407;}i:112;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:21:"Include CSS & JS file";i:1;i:2;i:2;i:1407;}i:2;i:1407;}i:113;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1407;}i:114;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1442;}i:115;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"For CSS";i:1;i:3;i:2;i:1442;}i:2;i:1442;}i:116;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1442;}i:117;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:156:"
<link href="{{ asset('css/app.css') }}" rel="stylesheet" type="text/css" >
<link href="{{ URL::asset('css/app.css') }}" rel="stylesheet" type="text/css" >
";i:1;s:11:"html4strict";i:2;N;}i:2;i:1465;}i:118;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1636;}i:119;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:6:"For JS";i:1;i:3;i:2;i:1636;}i:2;i:1636;}i:120;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1636;}i:121;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:156:"
<script type="text/javascript" src="{{ asset('js/custom.js') }}"></script>
<script type="text/javascript" src="{{ URL::asset('js/custom.js') }}"></script>
";i:1;s:11:"html4strict";i:2;N;}i:2;i:1658;}i:122;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1829;}i:123;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:10:"For Images";i:1;i:3;i:2;i:1829;}i:2;i:1829;}i:124;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1829;}i:125;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:31:"
{{ asset('img/photo.jpg'); }}
";i:1;s:11:"html4strict";i:2;N;}i:2;i:1855;}i:126;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1900;}i:127;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"Template Inheritance";i:1;i:2;i:2;i:1900;}i:2;i:1900;}i:128;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1900;}i:129;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1934;}i:130;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"Defining A Layout";i:1;i:3;i:2;i:1934;}i:2;i:1934;}i:131;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:1934;}i:132;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1934;}i:133;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:162:"Two of the primary benefits of using Blade are template inheritance and sections. To get started, let's take a look at a simple example. First, we will examine a ";}i:2;i:1963;}i:134;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:2125;}i:135;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"master";}i:2;i:2126;}i:136;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:2132;}i:137;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:" page layout.";}i:2;i:2133;}i:138;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:2146;}i:139;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:333:"
<!-- Stored in resources/views/layouts/master.blade.php -->

<html>
    <head>
        <title>App Name - @yield('title')</title>
    </head>
    <body>
        @section('sidebar')
            This is the master sidebar.
        @show

        <div class="container">
            @yield('content')
        </div>
    </body>
</html>
";i:1;s:5:"html5";i:2;s:16:"master.blade.php";}i:2;i:2153;}i:140;a:3:{i:0;s:10:"listu_open";i:1;a:0:{}i:2;i:2518;}i:141;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2518;}i:142;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2518;}i:143;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:2:"  ";}i:2;i:2522;}i:144;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:2524;}i:145;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:8:"@section";}i:2;i:2526;}i:146;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:2534;}i:147;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:61:" directive, as the name implies, defines a section of content";}i:2;i:2536;}i:148;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2597;}i:149;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2597;}i:150;a:3:{i:0;s:13:"listitem_open";i:1;a:1:{i:0;i:1;}i:2;i:2597;}i:151;a:3:{i:0;s:16:"listcontent_open";i:1;a:0:{}i:2;i:2597;}i:152;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:" ";}i:2;i:2601;}i:153;a:3:{i:0;s:11:"strong_open";i:1;a:0:{}i:2;i:2602;}i:154;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:6:"@yield";}i:2;i:2604;}i:155;a:3:{i:0;s:12:"strong_close";i:1;a:0:{}i:2;i:2610;}i:156;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:62:" directive is used to display the contents of a given section.";}i:2;i:2612;}i:157;a:3:{i:0;s:17:"listcontent_close";i:1;a:0:{}i:2;i:2674;}i:158;a:3:{i:0;s:14:"listitem_close";i:1;a:0:{}i:2;i:2674;}i:159;a:3:{i:0;s:11:"listu_close";i:1;a:0:{}i:2;i:2674;}i:160;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2676;}i:161;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"Extending A Layout";i:1;i:3;i:2;i:2676;}i:2;i:2676;}i:162;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:2676;}i:163;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:2676;}i:164;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:115:"When defining a child page, you may use the Blade @extends directive to specify which layout the child page should ";}i:2;i:2706;}i:165;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:2821;}i:166;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"inherit";}i:2;i:2822;}i:167;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:2829;}i:168;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:227:". Views which @extends a Blade layout may inject content into the layout's sections using @section directives. Remember, as seen in the example above, the contents of these sections will be displayed in the layout using @yield:";}i:2;i:2830;}i:169;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3057;}i:170;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:279:"
<!-- Stored in resources/views/child.blade.php -->

@extends('layouts.master')

@section('title', 'Page Title')

@section('sidebar')
    @parent

    <p>This is appended to the master sidebar.</p>
@endsection

@section('content')
    <p>This is my body content.</p>
@endsection
";i:1;s:11:"html4strict";i:2;s:15:"child.blade.php";}i:2;i:3064;}i:171;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3064;}i:172;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:235:"In this example, the sidebar section is utilizing the @parent directive to append (rather than overwriting) content to the layout's sidebar. The @parent directive will be replaced by the content of the layout when the view is rendered.";}i:2;i:3374;}i:173;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3609;}i:174;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3611;}i:175;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"Displaying Data";i:1;i:2;i:2;i:3611;}i:2;i:3611;}i:176;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:3611;}i:177;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3611;}i:178;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:76:"You may display data passed to your Blade views by wrapping the variable in ";}i:2;i:3640;}i:179;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:3716;}i:180;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:"curly";}i:2;i:3717;}i:181;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:3722;}i:182;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:8:" braces.";}i:2;i:3723;}i:183;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3737;}i:184;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:94:"
Route::get('greeting', function () {
    return view('welcome', ['name' => 'Samantha']);
});
";i:1;s:3:"php";i:2;N;}i:2;i:3737;}i:185;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:3737;}i:186;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:58:"You may display the contents of the name variable like so:";}i:2;i:3845;}i:187;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:3903;}i:188;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:136:"
Hello, {{ $name }}.
// you can put any PHP code you wish inside of a Blade echo statement:
The current UNIX timestamp is {{ time() }}.
";i:1;s:11:"html4strict";i:2;N;}i:2;i:3910;}i:189;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4061;}i:190;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:29:"Blade & JavaScript Frameworks";i:1;i:3;i:2;i:4061;}i:2;i:4061;}i:191;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:4061;}i:192;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4061;}i:193;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:42:"Since many JavaScript frameworks also use ";}i:2;i:4101;}i:194;a:3:{i:0;s:18:"doublequoteopening";i:1;a:0:{}i:2;i:4143;}i:195;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:"curly";}i:2;i:4144;}i:196;a:3:{i:0;s:18:"doublequoteclosing";i:1;a:0:{}i:2;i:4149;}i:197;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:188:" braces to indicate a given expression should be displayed in the browser, you may use the @ symbol to inform the Blade rendering engine an expression should remain untouched. For example:";}i:2;i:4150;}i:198;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4344;}i:199;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:38:"
<h1>Laravel</h1>
Hello, @{{ name }}.
";i:1;s:11:"html4strict";i:2;N;}i:2;i:4344;}i:200;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4344;}i:201;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:48:"the @ symbol will be removed by Blade; however, ";}i:2;i:4396;}i:202;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:4:"name";i:1;N;i:2;s:6:"center";i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:4444;}i:203;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:119:" expression will remain untouched by the Blade engine, allowing it to instead be rendered by your JavaScript framework.";}i:2;i:4454;}i:204;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4573;}i:205;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4575;}i:206;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"Echoing Data If It Exists";i:1;i:3;i:2;i:4575;}i:2;i:4575;}i:207;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:4575;}i:208;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4575;}i:209;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:141:"Sometimes you may wish to echo a variable, but you aren't sure if the variable has been set. We can express this in verbose PHP code like so:";}i:2;i:4611;}i:210;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:4752;}i:211;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:77:"
{{ isset($name) ? $name : 'Default' }}
// Shortcut
{{ $name or 'Default' }}
";i:1;s:11:"html4strict";i:2;N;}i:2;i:4759;}i:212;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4851;}i:213;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:25:"Displaying Unescaped Data";i:1;i:3;i:2;i:4851;}i:2;i:4851;}i:214;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:4851;}i:215;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:4851;}i:216;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:18:"By default, Blade ";}i:2;i:4887;}i:217;a:3:{i:0;s:13:"internalmedia";i:1;a:7:{i:0;s:0:"";i:1;N;i:2;s:6:"center";i:3;N;i:4;N;i:5;s:5:"cache";i:6;s:7:"details";}i:2;i:4905;}i:218;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:172:" statements are automatically sent through PHP's htmlentities function to prevent XSS attacks. If you do not want your data to be escaped, you may use the following syntax:";}i:2;i:4910;}i:219;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5088;}i:220;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:23:"
Hello, {!! $name !!}.
";i:1;s:11:"html4strict";i:2;N;}i:2;i:5088;}i:221;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5126;}i:222;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"Control Structures";i:1;i:2;i:2;i:5126;}i:2;i:5126;}i:223;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:5126;}i:224;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5158;}i:225;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"If Statements";i:1;i:3;i:2;i:5158;}i:2;i:5158;}i:226;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:5158;}i:227;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:236:"
@if (count($records) === 1)
    I have one record!
@elseif (count($records) > 1)
    I have multiple records!
@else
    I don't have any records!
@endif

// or using unless
@unless (Auth::check())
    You are not signed in.
@endunless
";i:1;N;i:2;N;}i:2;i:5188;}i:228;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5434;}i:229;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:5:"Loops";i:1;i:3;i:2;i:5434;}i:2;i:5434;}i:230;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:5434;}i:231;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:307:"
@for ($i = 0; $i < 10; $i++)
    The current value is {{ $i }}
@endfor

@foreach ($users as $user)
    <p>This is user {{ $user->id }}</p>
@endforeach

@forelse ($users as $user)
    <li>{{ $user->name }}</li>
@empty
    <p>No users</p>
@endforelse

@while (true)
    <p>I'm looping forever.</p>
@endwhile
";i:1;N;i:2;N;}i:2;i:5456;}i:232;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:5773;}i:233;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"Including Sub-Views";i:1;i:3;i:2;i:5773;}i:2;i:5773;}i:234;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:5773;}i:235;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5773;}i:236;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:196:"Blade's @include directive, allows you to easily include a Blade view from within an existing view. All variables that are available to the parent view will be made available to the included view:";}i:2;i:5804;}i:237;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6000;}i:238;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:185:"
<div>
    @include('shared.errors')
    <!-- You may also pass parameter -->
    @include('view.name', ['some' => 'data'])
    <form>
        <!-- Form Contents -->
    </form>
</div>
";i:1;s:11:"html4strict";i:2;N;}i:2;i:6007;}i:239;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6207;}i:240;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:31:"Rendering Views For Collections";i:1;i:3;i:2;i:6207;}i:2;i:6207;}i:241;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:6207;}i:242;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:6207;}i:243;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:78:"You may combine loops and includes into one line with Blade's @each directive:";}i:2;i:6249;}i:244;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:6327;}i:245;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:176:"
@each('view.name', $jobs, 'job')
<!--  This argument determines the view that will be rendered if the given array is empty. -->
@each('view.name', $jobs, 'job', 'view.empty')
";i:1;s:11:"html4strict";i:2;N;}i:2;i:6334;}i:246;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6524;}i:247;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6524;}}