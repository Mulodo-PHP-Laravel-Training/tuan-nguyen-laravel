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
     * Show post detail
     *
     * @param  Request  $request
     * @return void
     */
    public function detail(Request $request, $id)
    {
        $post = Post::where('id', (int)$id)
                    ->where('status',1)
                    ->first();
        return view('post/detail', ['post' => $post]);
    }

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

    /**
     * Get list posts.
     *
     * @param Request $request
     * @return Response
     */
    public function getCollection(Request $request) {
        $userId = Auth::user()->id;
        $totalEntries = Post::where('author_id', $userId)->get()->count();
        // Pagination
        $pagination = Utility::Pagination($request, $totalEntries);

        $sortby       = ($request->input('sort_by')) ? : 'id';
        $order        = ($request->input('order') == 'asc') ? 'asc' : 'desc';

        $data = Post::where('author_id', $userId)
                    ->orderBy($sortby, $order)
                    ->take($pagination['per_page'])
                    ->skip($pagination['per_page'] * ($pagination['page']-1) )
                    ->get()
                    ->toArray();
        return response()->json(array($pagination, $data));
    }

    /**
     * Check user permission.
     *
     * @param  Request  $request
     * @param  int  $id
     * @return void
     */
    protected function checkPermission($request, $id)
    {
        // Get post & Check permission
        $post = $this->checkPostAuthor(Auth::user()->id, $id);
        if ($post) {
            $this->processUpdate($request, $post);
        }
    }


    /**
     * Remove post by id.
     * URI: DELETE /api/posts/{id}
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy(Request $request,$id)
    {
        // Validate author id must be an integer
        if (!$this->validateInteger($id,'Post ID')) return response()->json($this->response);

        // Get post & Check permission
        $post = $this->checkPostAuthor(Auth::user()->id, (int) $id);
        if ($post && $post->delete()) {
            // Delete post successfully
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_SUCCESS'),
                trans('api.DESCRIPTION_DELETE_SUCCESS'),
                trans('api.MSG_DELETE_SUCCESS',['attribute' => 'Post','id' => $id])
            );
        }
        return response()->json($this->response);
    }

}
