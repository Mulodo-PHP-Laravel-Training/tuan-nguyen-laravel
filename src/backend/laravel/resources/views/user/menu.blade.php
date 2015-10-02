@section('userMenu')
<div class="col-md-3">
    <div class="list-group">
        <a href="{{ url('users/profile') }}" class="list-group-item">User profile</a>
        <a href="{{ url('users/profile/change') }}" class="list-group-item">Change profile</a>
        <a href="{{ url('users/password') }}" class="list-group-item">Change password</a>
        <a href="{{ url('users/articles') }}" class="list-group-item">List articles</a>
    </div>
</div>
@endsection
