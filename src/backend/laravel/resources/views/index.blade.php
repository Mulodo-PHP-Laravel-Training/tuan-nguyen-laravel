@extends('app')

@section('articles')
{!! $posts->render() !!}
<table class="table table-bordered table-striped">
    <tbody>
    @if (count($posts) > 0)
        @foreach($posts as $post)
            <tr>
                <td width="120px">
                    <img src="{{ (empty($post->image)) ? asset('images/no-image.png') : $post->image }}" width="100" height="100" class="postImage" />
                </td>
                <td>
                    <a href="{{ url('article/'. $post->id) }}"><h3>{{ $post->title }}</h3></a>
                    <div class="intro">
                        {{ $post->intro }}
                    </div>
                    <i>Written by <a href="{{ url('users/'. $post->author_id.'/articles') }}"><b>{{ $post->users->first_name }} {{ $post->users->last_name }}</b></a> on {{ $post->created_at }}</i>
                    <div class="pull-right">
                        <a href="{{ url('article/'. $post->id) }}">Readmore ...</a>
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
                <div class="panel-heading">Newest articles:</div>
                    <div class="panel-body">
                        @yield('articles')
                    </div>
            </div>
        </div>
    </div>
</div>
@endsection

