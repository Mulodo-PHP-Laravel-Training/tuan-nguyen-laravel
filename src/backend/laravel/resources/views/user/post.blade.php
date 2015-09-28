@extends('app')

@section('articles')
{!! $posts->render() !!}
<table class="table table-bordered table-striped">
    <tbody>
    @if (count($posts) > 0)
        @foreach($posts as $post)
            <tr>
                <td width="120px">
                    <img src="@if (''!= $post->image) {{ $post->image }} @else {{ asset('images/no-image.png') }} @endif" width="100" height="100" class="postImage" />
                </td>
                <td>
                    <a href="{{ url('posts/'. $post->id) }}"><h3>{{ $post->title }}</h3></a>
                    <div class="intro">
                        {{ $post->intro }}
                    </div>
                    <i>Written by <b>{{ $post->users->first_name }} {{ $post->users->last_name }}</b> on {{ $post->created_at }}</i>
                    <div class="pull-right">
                        <a href="{{ url('posts/'. $post->id) }}">Readmore ...</a>
                    </div>
                </td>
            </tr>
        @endforeach
    @else
        <tr><td>No post found.</td></tr>
    @endif
    </tbody>
</table>
{!! $posts->render() !!}
@endsection

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">User articles:</div>
                    <div class="panel-body">
                        @yield('articles')
                    </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section('scripts')
    <script type="text/template" id="PostsTpl">
        <a href="{{ url('/') }}/users/<%=model.id%>/articles">View user articles</a>
    </script>
    <script type="text/javascript">
        var urlBase = '{{ url('/') }}';
        var token = '{{ csrf_token() }}';
        var userToken = '{{ Auth::user()->remember_token }}';
        var q = '{{ Request::input('q') }}';
    </script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore-min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/backbone.js/1.2.3/backbone-min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/backbone-pageable/1.4.8/backbone-pageable.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/backbone.validation/0.11.5/backbone-validation-min.js"></script>
    <script src="{{ asset('js/zecLoading.js') }}"></script>
    <script src="{{ asset('js/backbone/zecGrid.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/backbone/collection/userCollection.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/backbone/form/searchUserGrid.js') }}"></script>
@endsection
