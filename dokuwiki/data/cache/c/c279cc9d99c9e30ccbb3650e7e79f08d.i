a:28:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:16:"Laravel Database";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:33;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"1.Configuration";i:1;i:2;i:2;i:33;}i:2;i:33;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:33;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:33;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:54:"The database configuration file is config/database.php";}i:2;i:61;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:115;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:115;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:90:"Currently Laravel supports four database systems: MySQL, Postgres, SQLite, and SQL Server.";}i:2;i:117;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:207;}i:12;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:209;}i:13;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:28:"1.1 Read / Write Connections";i:1;i:3;i:2;i:209;}i:2;i:209;}i:14;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:209;}i:15;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:326:"
'mysql' => [
    'read' => [
        'host' => '192.168.1.1',
    ],
    'write' => [
        'host' => '196.168.1.2'
    ],
    'driver'    => 'mysql',
    'database'  => 'database',
    'username'  => 'root',
    'password'  => '',
    'charset'   => 'utf8',
    'collation' => 'utf8_unicode_ci',
    'prefix'    => '',
],
";i:1;s:4:"java";i:2;N;}i:2;i:254;}i:16;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:594;}i:17;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"1.2 Running Queries";i:1;i:2;i:2;i:594;}i:2;i:594;}i:18;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:594;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:627;}i:20;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:26:"1.3 Running A Select Query";i:1;i:3;i:2;i:627;}i:2;i:627;}i:21;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:3;}i:2;i:627;}i:22;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:65:"
$results = DB::select('select * from users where id = ?', [1]);
";i:1;s:3:"php";i:2;N;}i:2;i:670;}i:23;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:749;}i:24;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:12:"2. Migration";i:1;i:2;i:2;i:749;}i:2;i:749;}i:25;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:749;}i:26;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:775;}i:27;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:775;}}