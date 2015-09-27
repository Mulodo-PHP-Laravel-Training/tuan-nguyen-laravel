<?php

namespace App\Http\Controllers\Admin;

use DB;
use Validator;
use App\Http\Controllers\Api\CommentController as ApiController;
use App\User;
use App\Post;
use App\Comment;
use App\MyClasses\MessageUtility;
use App\MyClasses\Utility;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CommentController extends ApiController
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }
    /**
     * Show the application dashboard to the post.
     *
     * @return Response
     */
    public function index()
    {
        return view('admin/comment');
    }


    /**
     * Get list comments.
     *
     * @param Request $request
     * @return Response
     */
    public function getCollection(Request $request) {
        // Pagination
        $totalEntries = Comment::get()->count();
        // Pagination
        $pagination = Utility::Pagination($request, $totalEntries);
        $sortby       = ($request->input('sort_by')) ? : 'id';
        $order        = ($request->input('order') == 'asc') ? 'asc' : 'desc';

        $data = Comment::select('comments.*', 'posts.title', 'users.first_name', 'users.last_name')
                    ->leftJoin('posts', function($join) {
                        $join->on('comments.post_id', '=' , 'posts.id');
                    })->leftJoin('users', function($join) {
                        $join->on('comments.author_id', '=', 'users.id');
                    })->orderBy('comments.' .$sortby, $order)
                    ->take($pagination['per_page'])
                    ->skip($pagination['per_page'] * ($pagination['page']-1) )
                    ->get()
                    ->toArray();
        return response()->json(array($pagination, $data));
    }


    /**
     * By pass checkpermiison
     *
     * @param  Request  $request
     * @param  Comment  $comment
     * @return void
     */
    protected function checkPermission($request, $comment) {
        // Update comment
        $comment->content = $request->input('content');
        $this->processUpdate($comment);
    }

    /**
     * Delete a comment
     *
     * @param Request $request
     * @return Response
     */
    public function destroy(Request $request, $id) {
        // Validate author id must be an integer
        if (!$this->validateInteger($id,'Comment ID')) return response()->json($this->response);
        $comment = Comment::find((int) $id);
        if ($comment) {
            $comment->delete();
            // Delete post successfully
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_SUCCESS'),
                trans('api.DESCRIPTION_DELETE_SUCCESS'),
                trans('api.MSG_DELETE_SUCCESS',['attribute' => 'Comment','id' => $id])
            );
        } else {
            $this->itemNotFound('Comment');
        }

        return response()->json($this->response);

    }

}