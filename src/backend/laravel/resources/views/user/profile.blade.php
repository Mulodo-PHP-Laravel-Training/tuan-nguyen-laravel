@extends('app')
@include('user/menu')

@section('userTable')
<table class="table table-boredered table-striped">
    <tbody>
        <tr>
            <td>Username:</td>
            <td>{{ $user->username }}</td>
        </tr>
        <tr>
            <td>First name:</td>
            <td>{{ $user->first_name }}</td>
        </tr>
        <tr>
            <td>Last name:</td>
            <td>{{ $user->last_name }}</td>
        </tr>
        <tr>
            <td>Email:</td>
            <td>{{ $user->email }}</td>
        </tr>
        <tr>
            <td>Role:</td>
            <td>{{ $user->role_name }}</td>
        </tr>
    </tbody>
</table>
@endsection

@section('mainContent')
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">User profile</h3>
    </div>
    <div class="panel-body">
        @yield('userTable')
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