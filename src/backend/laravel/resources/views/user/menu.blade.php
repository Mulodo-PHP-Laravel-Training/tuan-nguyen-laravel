@section('userMenu')
<div class="col-md-3">
    <div class="list-group">
        <a href="{{ url('users/profile') }}" class="list-group-item">User profile</a>
        <a href="{{ url('users/profile/change') }}" class="list-group-item">Change profile</a>
        <a href="{{ url('users/password') }}" class="list-group-item">Change password</a>
        <a href="{{ url('users/posts') }}" class="list-group-item">List articles</a>
        <a href="{{ url('users/comments') }}" class="list-group-item">List comments</a>
    </div>
</div>
@endsection
