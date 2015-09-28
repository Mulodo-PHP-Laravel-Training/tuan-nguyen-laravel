@extends('app')
@include('user/menu')

@section('passwordForm')
<form method="POST" action="{{ url('users/password') }}" id="userFrm">
    <div class="form-inputs">
        <div class="form-group @if ($errors && $errors->has('old_password')) has-error @endif">
            <label>Old password:</label>
            <input type="hidden" name="_token" value="{{ csrf_token() }}" />
            <input type="password" class="form-control" name="old_password" value="{{ $user['old_password'] }}">
            @if ($errors && $errors->has('old_password')) <p class="help-block">{{ $errors->first('old_password') }}</p> @endif
        </div>
        <div class="form-group @if ($errors && $errors->has('new_password')) has-error @endif">
            <label>New password:</label>
            <input type="password" class="form-control" name="new_password" value="{{ $user['new_password'] }}">
            @if ($errors && $errors->has('new_password')) <p class="help-block">{{ $errors->first('new_password') }}</p> @endif
        </div>
        <div class="form-group @if ($errors && $errors->has('new_password_confirmation')) has-error @endif">
            <label>Old password:</label>
            <input type="password" class="form-control" name="new_password_confirmation" value="{{ $user['new_password_confirmation'] }}">
            @if ($errors && $errors->has('new_password_confirmation')) <p class="help-block">{{ $errors->first('new_password_confirmation') }}</p> @endif
        </div>

    </div>
    <div class="form-group pull-right">
        <div class="btn-group">
            <button class="btn btn-warning" type="button" onclick="location.href = '';">Reset</button>
        </div>
        <div class="btn-group">
            <button class="btn btn-success" type="submit" data-loading-text="Saving...">Save</button>
        </div>
    </div>
    <div style="clear:both"></div>
    @if(Session::has('success'))
        <div class="alert-box success text-success pull-right">
            {{ Session::get('success') }}
        </div>
    @endif
</form>
@endsection

@section('mainContent')
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Change password</h3>
    </div>
    <div class="panel-body">
        @yield('passwordForm')
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