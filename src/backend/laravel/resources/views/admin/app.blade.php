<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Mini blog Control Panel</title>

    <link href="{{ asset('/css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('/css/zecGrid.css') }}" rel="stylesheet">
    @yield('styles')

    <!-- Fonts -->
    <link href='//fonts.googleapis.com/css?family=Roboto:400,300' rel='stylesheet' type='text/css'>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle Navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">ACP</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="{{ url('/admin') }}">Home</a></li>
                    <li><a href="{{ url('/admin/users') }}">Users</a></li>
                    <li><a href="{{ url('/admin/posts') }}">Posts</a></li>
                    <li><a href="{{ url('/admin/comments') }}">Comments</a></li>
                </ul>

                <ul class="nav navbar-nav navbar-right">
                    @if (Auth::guest())
                        <li><a href="{{ url('/auth/login') }}">Login</a></li>
                        <li><a href="{{ url('/auth/register') }}">Register</a></li>
                    @else
                        <li><a>Welcome {{Auth::user()->first_name}} {{Auth::user()->last_name}}</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">{{ Auth::user()->name }} <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="{{ url('/auth/logout') }}">Logout</a></li>
                            </ul>
                        </li>
                    @endif
                </ul>
            </div>
        </div>
    </nav>

    <div class="container container-full">
    @yield('content')
    </div>

    <!-- Scripts -->
    <script type="text/javascript">
        var urlBase = '{{ url('/') }}';
        var token = '{{ csrf_token() }}';
        var userToken = '{{ Auth::user()->remember_token }}';
    </script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore-min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/backbone.js/1.2.3/backbone-min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/backbone-pageable/1.4.8/backbone-pageable.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/backbone.validation/0.11.5/backbone-validation-min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/alertify.js/0.5.0/alertify.min.js"></script>
    <script src="{{ asset('js/zecLoading.js') }}"></script>
    <script src="{{ asset('js/backbone/zecGrid.js') }}"></script>
    <script src="{{ asset('js/function.js') }}"></script>
    @yield('scripts')
</body>
</html>
