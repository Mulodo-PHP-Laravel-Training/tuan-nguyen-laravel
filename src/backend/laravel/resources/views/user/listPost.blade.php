@extends('app')
@include('user/menu')
@include('user/backbone')

@section('mainContent')
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">List articles</h3>
    </div>
    <div class="panel-body" id="postGrid">
    </div>
</div>
@endsection


@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">User info</div>
                <div class="panel-body">
                    @yield('userMenu')
                    <div class="col-md-9">
                        @yield('mainContent')
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection


@section('scripts')
<script type="text/template"  id="actionButtonTpl">
<div class="groupBtn" style="display:none;">
    </span>
    <span class="btn-group">
        <button type="button" class=" updRow btn btn-warning btn-xs" title="Update" data-id="<%= field %>">
            <span class="glyphicon glyphicon-pencil"></span>
        </button>
    </span>
    <span class="btn-group">
        <button type="button" class=" removeRow btn btn-danger btn-xs " title="Remove" data-id="<%= field %>">
            <span class="glyphicon glyphicon-remove"></span>
        </button>
    </span>

</div>
</script>

    <script type="text/javascript">
        var urlBase = '{{ url('/') }}';
        var token = '{{ csrf_token() }}';
    </script>
    @yield('backbone')
    <script type="text/javascript" src="{{ asset('js/tinyeditor.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/backbone/collection/postCollection.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/backbone/grid/listPostGrid.js') }}"></script>

@endsection
