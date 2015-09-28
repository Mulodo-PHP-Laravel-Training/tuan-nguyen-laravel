<?php

namespace App\Http\Controllers;


use Validator;
use Input;
use URL;
use DB;
use App\Http\Requests;
use App\MyClasses\MessageUtility;
use App\MyClasses\Utility;
use App\Http\Controllers\Api\PostController as ApiPostController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Post;

class PostController extends ApiPostController
{

    /**
     * Errors array
     *
     * @var array
     */
    public  $errors = [];

    /**
     * Create post
     *
     * @param  Request  $request
     * @return void
     */
    protected function processCreatePost(Request $request)
    {
        // Upload file
        $image = '';
        if (Input::file('image')) {
            $imageLink = $this->upload();
            $image = URL::to('/uploads/'. $imageLink);
        }
        // Validation success
        $post = Post::create([
            'author_id' => Auth::user()->id,
            'title'     => $request->input('title'),
            'content'   => $request->input('content'),
            'status'    => $request->input('status'),
            'image'     => $image
        ]);
        if ($post) {
            // Create post successfully
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_SUCCESS'),
                trans('api.DESCRIPTION_CREATE_SUCCESS'),
                trans('api.MSG_CREATE_SUCCESS',['attribute' => 'Post']),
                $post->toArray()
            );
        } else {
            // Create post failed
            $this->dbError();
        }
    }

}
