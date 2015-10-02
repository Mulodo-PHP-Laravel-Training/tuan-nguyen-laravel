@extends('app')
@include('user/menu')

@section('userForm')
<form method="POST" action="{{ url('users/profile/change') }}" id="userFrm">
    <div class="form-inputs">
        <div class="form-group @if ($errors && $errors->has('username')) has-error @endif">
            <label>Username:</label>
            <input type="hidden" name="_token" value="{{ csrf_token() }}" />
            <input type="text" class="form-control" name="username" value="{{ $user['username'] }}">
            @if ($errors && $errors->has('username')) <p class="help-block">{{ $errors->first('username') }}</p> @endif
        </div>
        <div class="form-group @if ($errors && $errors->has('first_name')) has-error @endif">
            <label>First name:</label>
            <input class="form-control" name="first_name" value="{{ $user['first_name'] }}">
            @if ($errors && $errors->has('first_name')) <p class="help-block">{{ $errors->first('first_name') }}</p> @endif
        </div>
        <div class="form-group  @if ($errors && $errors->has('last_name')) has-error @endif">
            <label>Last name:</label>
            <input class="form-control" name="last_name" value="{{ $user['last_name'] }}">
            @if ($errors && $errors->has('last_name')) <p class="help-block">{{ $errors->first('last_name') }}</p> @endif
        </div>
        <div class="form-group @if ($errors && $errors->has('email')) has-error @endif">
            <label>Email:</label>
            <input type="email" class="form-control" name="email" value="{{ $user['email'] }}">
            @if ($errors && $errors->has('email')) <p class="help-block">{{ $errors->first('email') }}</p> @endif
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
        <h3 class="panel-title">Change user profile</h3>
    </div>
    <div class="panel-body">
        @yield('userForm')
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