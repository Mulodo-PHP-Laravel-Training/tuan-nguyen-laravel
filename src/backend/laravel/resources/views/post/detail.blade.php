@extends('app')

@section('comments')
    <h4>Comments:</h4>
    @if(Auth::guest())
        <p>To comment this article, please <a href="{{ url('auth/login') }}">login here</a>.</p>
    @else
        <form method="POST" action="" id="frmComment">
            <div class="form-group">
                <input type="hidden" name="_token" value="{{ csrf_token() }}">
                <textarea class="form-control" name="content"></textarea>
                @if ($errors && $errors->has('content')) <p class="text-danger">{{ $errors->first('content') }}</p> @endif
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-success margin-top-10">Comment</button>
            </div>
        </form>
    @endif

    @if (count($comments) > 0)
        <table class="table table-striped">
            <tbody>
            @foreach($comments as $comment)
                <tr>
                    <td class="commentItem">
                        <p class="commentContent">{{ $comment->content }}</p>
                        <i>Written by <b>{{ $comment->users->first_name }} {{ $comment->users->last_name }}</b> at {{ $comment->created_at }}</i>
                        @if (($user = Auth::user()) && ($user->id == $post->id || $user->id == $comment->author_id))
                            <div class="modifiedComment">
                                <a href="javascript:void(0);" class="editComment" data-id="{{ $comment->id }}">Edit</a>
                                | <a href="javascript:void(0);" class="deleteComment" data-id="{{ $comment->id }}">Delete</a>
                            </div>
                        @endif
                    </td>
                </tr>
            @endforeach
            </tbody>
        </table>
        {!! $comments->render() !!}
    @endif
@endsection

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                @if ($post)
                    <div class="panel-heading">Article detail:</div>
                    <div class="panel-body">
                        <div class="col-md-12">
                            <h2>{{ $post->title }}</h2>
                            <h6><i>{{ $post->created_at }}</i></h6>
                            @if (!empty($post->image))
                                <img class="center-block margin-bottom-20" src="{{ $post->image }}" width="400" />
                            @endif
                            {{ $post->content }}
                            <div class="clear"></div>
                            <div class="pull-right margin-bottom-20">
                                <b>{{ $post->users->first_name }} {{ $post->users->last_name }}</b>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <div id="comments" class="col-md-12">
                            @yield('comments')
                        </div>
                    </div>
                @else
                    <div class="panel-heading">Error:</div>
                    <div class="panel-body">
                        Article not found.
                    </div>
                @endif
            </div>
        </div>
    </div>
</div>
@endsection

@section('scripts')
    <script type="text/javascript" src="{{ asset('js/comment.js') }}"></script>
@endsection