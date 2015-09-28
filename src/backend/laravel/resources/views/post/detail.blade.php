@extends('app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                @if ($post)
                <div class="panel-heading">Article detail:</div>
                <div class="panel-body">
                    <h2>{{ $post->title }}</h2>
                    <h6><i>{{ $post->created_at }}</i></h6>
                    @if ('' != $post->image)
                        <img class="center-block margin-bottom-20" src="{{ $post->image }}" width="400" /> 
                    @endif
                    {{ $post->content }}
                    <div class="clear"></div>
                    <div class="pull-right">
                        <b>{{ $post->users->first_name }} {{ $post->users->last_name }}</b>
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

