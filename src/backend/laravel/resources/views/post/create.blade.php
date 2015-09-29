@extends('app')
@include('user/menu')
@include('user/backbone')

@section('mainContent')
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Create Post</h3>
    </div>
    <div class="panel-body" id="postForm">
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
<script type="text/template" id="frmPostsTpl">
<form id="frmPost">
    <div class="form-group">
        <label>Title:</label>
        <input type="hidden" id="idInput" value="<%=id %>" name="id">
        <input type="text" class="form-control" name="title" value="<%=title%>">
        <span class="help-block hidden"></span>
    </div>
    <div class="form-group">
        <label>Image:</label>
        <br /><img id="imgPreview" src="<% if (!_.isEmpty(image)) { print(image); } else { %>{{ asset('images/no-image.png') }} <% } %>" width="100px" height="100px" />
        <input type="file" class="form-control image" name="image" value="">
        <span class="help-block hidden"></span>
    </div>
    <div class="form-group">
        <label>Content:</label>
        <textarea class="form-control" name="content" id="content"><%= content %></textarea>
        <span class="help-block hidden"></span>
    </div>
    <div class="form-group">
        <label>Status:</label>
        <label class="radio-inline"><input type="radio" name="status" value="1" <% if (1 == status) { %> checked <% } %>  >Active</label>
        <label class="radio-inline"><input type="radio" name="status" value="0" <% if (0 == status) { %> checked <% } %> >Deactive</label>
        <span class="help-block hidden"></span>
    </div>
    <div class="form-group pull-right">
        <div class="btn-group">
            <button id="resetBtn" class="btn btn-warning" type="button">Reset</button>
        </div>
        <div class="btn-group">
            <button id="postBtn" class="btn btn-success" type="button" data-loading-text="Saving...">Save</button>
        </div>
    </div>
    <div style="clear:both"></div>
    <div class="form-group" id="errMessages"></div>
</form>

</script>

    <script type="text/javascript">
        var urlBase = '{{ url('/') }}';
        var token = '{{ csrf_token() }}';
    </script>
    @yield('backbone')
    <script type="text/javascript" src="{{ asset('js/tinyeditor.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/backbone/collection/postCollection.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/backbone/form/postForm.js') }}"></script>

@endsection