@extends('app')
@include('user/backbone')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">Search user:</div>
                    <div class="panel-body">
                        <div id="userGrid" class="zecGrid">
                        </div>
                    </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section('scripts')
    <script type="text/template" id="PostsTpl">
        <a href="{{ url('/') }}/users/<%=model.id%>/articles">View user articles</a>
    </script>
    <script type="text/javascript">
        var urlBase = '{{ url('/') }}';
        var token = '{{ csrf_token() }}';
        var userToken = '{{ Auth::user()->remember_token }}';
        var q = '{{ Request::input('q') }}';
    </script>
    @yield('backbone')
    <script type="text/javascript" src="{{ asset('js/backbone/collection/userCollection.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/backbone/grid/searchUserGrid.js') }}"></script>
@endsection
