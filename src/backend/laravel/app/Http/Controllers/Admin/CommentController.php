<?php

namespace App\Http\Controllers\Admin;

use DB;
use Validator;
use App\Http\Controllers\Api\ApiController;
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
        $perPage      = ($request->input('per_page') > 0) ? (int) $request->input('per_page') : 10;
        $page         = ($request->input('page')) ? (int) $request->input('page') : 1;
        $totalEntries = Comment::get()->count();
        $totalPages   = ceil($totalEntries/$perPage);
        $sortby       = ($request->input('sort_by')) ? : 'id';
        $order        = ($request->input('order') == 'asc') ? 'asc' : 'desc';

        $data = Comment::select('comments.*', 'posts.title', 'users.first_name', 'users.last_name')
                    ->leftJoin('posts', function($join) {
                        $join->on('comments.post_id', '=' , 'posts.id');
                    })->leftJoin('users', function($join) {
                        $join->on('comments.author_id', '=', 'users.id');
                    })->orderBy('comments.' .$sortby, $order)
                    ->take($perPage)
                    ->skip($perPage * ($page-1) )
                    ->get()
                    ->toArray();
        $return = array(
            array(
                'per_page'      => $perPage,
                'total_entries' => $totalEntries,
                'total_pages'   => $totalPages,
                'page'          => $page,

            ),
            $data
        );
        return response()->json($return);
    }


    /**
     * Update comment in a post
     * URI : PUT /admin/posts/{postId}/comments/{commentId}
     *
     * @param  Request  $request
     * @param  Int  $postId
     * @param  Int  $commentId
     * @return Response
     */
    public function update(Request $request, $commentId)
    {
        // Validate postId, commentId must be an integer
        if (!$this->validateInteger($commentId, 'Comment ID'))
            return response()->json($this->response);

        // Validate content comment
        $validator =  Validator::make($request->all(), [
            'content' => 'required',
        ]);
        if ($validator->fails()) {
            // Validation fails
            $this->validationFails($validator);
        } else {
            // Find comment
            $comment = Comment::find($commentId);
            if ($comment) {
                // Update comment
                $comment->content = $request->input('content');
                $comment->save();
                // Update comment successfully
                $this->response = MessageUtility::getResponse(
                    trans('api.CODE_INPUT_SUCCESS'),
                    trans('api.DESCRIPTION_UPDATE_SUCCESS'),
                    trans('api.MSG_UPDATE_SUCCESS',['attribute' => 'Comment', 'id' => $comment->id]),
                    $comment->toArray()
                );
            } else {
                // Comment not found
                $this->response = MessageUtility::getResponse(
                    trans('api.CODE_DB_NOT_FOUND'),
                    trans('api.DESCRIPTION_DB_NOT_FOUND'),
                    trans('api.MSG_DB_NOT_FOUND', ['attribute' => 'Comment'])
                );
            }
        }
        return response()->json($this->response);
    }


    /**
     * Delet a post
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
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_DB_NOT_FOUND'),
                trans('api.DESCRIPTION_DB_NOT_FOUND'),
                trans('api.MSG_DB_NOT_FOUND',['attribute' => 'Comment'])
            );
        }

        return response()->json($this->response);

    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data, $method, $id = null)
    {
        switch($method)
        {
            case 'PUT':
            case 'PATCH':
            {
                return Validator::make($data, [
                    'username'   => 'sometimes|required|min:3|max:50|unique:users,username,'. $id,
                    'first_name' => 'sometimes|required|max:50',
                    'last_name'  => 'sometimes|required|max:50',
                    'email'      => 'sometimes|required|email|max:50|unique:users,email,'. $id,
                    'password'   => 'min:6|max:20|confirmed',
                    'password_confirmation'   => 'min:6|max:20',

                ]);
            }
            default: break;
        }

    }

}