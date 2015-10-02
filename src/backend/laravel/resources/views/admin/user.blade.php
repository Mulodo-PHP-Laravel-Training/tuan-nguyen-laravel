@extends('admin/app')
@section('content')
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">User Panel</h3>
    </div>
    <div class="panel-body">
        <div class="col-sm-4">
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                User Form
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body" id="userForm">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <h5>List users</h5>
            <div id="userGrid" class="zecGrid">
            </div>
        </div>
    </div>
</div>

<script type="text/template" id="frmUsersTpl">
<form id="frmUser">
    <div class="form-inputs">
        <div class="form-group">
            <label>Username:</label>
            <input type="hidden" id="idInput" value="<%=id %>" name="id">
            <input type="text" class="form-control" name="username" value="<%=username%>">
            <span class="help-block hidden"></span>
        </div>
        <div class="form-group">
            <label>Role:</label>
            <select class="form-control" name="is_admin">
                <option value="0">Member</option>
                <option value="1">Admin</option>
            </select>
            <span class="help-block hidden"></span>
        </div>
        <div class="form-group">
            <label>Password:</label>
            <input class="form-control" name="password" type="password" value="">
            <span class="help-block hidden"></span>
        </div>
        <div class="form-group">
            <label>Confirm password:</label>
            <input class="form-control" name="password_confirmation" type="password" value="">
            <span class="help-block hidden"></span>
        </div>
        <div class="form-group">
            <label>First name:</label>
            <input class="form-control" name="first_name" value="<%=first_name%>">
            <span class="help-block hidden"></span>
        </div>
        <div class="form-group">
            <label>Last name:</label>
            <input class="form-control" name="last_name" value="<%=last_name%>">
            <span class="help-block hidden"></span>
        </div>
        <div class="form-group">
            <label>Email:</label>
            <input type="email" class="form-control" name="email" value="<%=email%>">
            <span class="help-block hidden"></span>
        </div>
    </div>
    <div class="form-group pull-right">
        <div class="btn-group">
            <button id="resetBtn" class="btn btn-warning" type="button">Reset</button>
        </div>
        <div class="btn-group">
            <button id="userBtn" class="btn btn-success" type="button" data-loading-text="Saving...">Save</button>
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
</div>
</script>
@endsection


@section('scripts')
    <script type="text/javascript" src="{{ asset('js/backbone/grid/userGrid.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/backbone/collection/userCollection.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/backbone/router/userRouter.js') }}"></script>
@endsection