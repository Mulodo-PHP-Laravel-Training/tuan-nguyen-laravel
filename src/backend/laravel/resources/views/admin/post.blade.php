@extends('admin/app')
@section('styles')
<link href="{{ asset('/css/tinyeditor.css') }}" rel="stylesheet">
@endsection
@section('content')
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">User Panel</h3>
    </div>
    <div class="panel-body">
        <div class="col-sm-6">
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                Post Form
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body" id="postForm">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <h5>List articles</h5>
            <div id="postGrid" class="zecGrid">
            </div>
        </div>
    </div>
</div>

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

@endsection


@section('scripts')
    <script type="text/javascript" src="{{ asset('js/tinyeditor.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/backbone/grid/postGrid.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/backbone/collection/postCollection.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/backbone/router/postRouter.js') }}"></script>
@endsection