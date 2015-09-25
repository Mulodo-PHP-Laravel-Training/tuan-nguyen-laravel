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
                                Comment Form
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body" id="commentForm">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <h5>List comments</h5>
            <div id="commentGrid" class="zecGrid">
            </div>
        </div>
    </div>
</div>

<script type="text/template" id="frmCommentsTpl">
<form id="frmComment">
    <div class="form-group">
        <label>Content:</label>
        <input type="hidden" id="idInput" value="<%=id %>" name="id">
        <textarea class="form-control" name="content" id="content"><%= content %></textarea>
        <span class="help-block hidden"></span>
    </div>
    <div class="form-group pull-right">
        <div class="btn-group">
            <button id="resetBtn" class="btn btn-warning" type="button">Reset</button>
        </div>
        <div class="btn-group">
            <button id="commentBtn" class="btn btn-success" type="button" data-loading-text="Saving...">Save</button>
        </div>
    </div>
    <div style="clear:both"></div>
    <div class="form-group" id="errMessages"></div>
</form>

</script>


<script type="text/template" id="commentTpl">
    <b><%= model.title %></b><br />
    <%= model.content %><br />
    <i>Written by <b><%= model.first_name %> <%= model.last_name %></b> on <%= model.created_at %></i>

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
    <script type="text/javascript" src="{{ asset('js/backbone/grid/commentGrid.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/backbone/collection/commentCollection.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/backbone/router/commentRouter.js') }}"></script>
@endsection