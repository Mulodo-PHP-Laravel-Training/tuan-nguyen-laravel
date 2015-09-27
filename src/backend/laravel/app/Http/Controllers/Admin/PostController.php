<?php

namespace App\Http\Controllers\Admin;

use DB;
use Validator;
use App\Http\Controllers\Api\PostController as ApiController;
use App\User;
use App\Post;
use App\MyClasses\MessageUtility;
use App\MyClasses\Utility;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PostController extends ApiController
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
     * @param Request $request
     * @return Response
     */
    public function index(Request $request)
    {
        return view('admin/post');
    }

    /**
     * Bypass check user permission.
     *
     * @param  Request  $request
     * @param  int  $id
     * @return void
     */
    protected function checkPermission($request, $id)
    {
        // Get post & Check permission
        $post = Post::find($id);
        if ($post) {
            $this->processUpdate($request, $post);
        }        
    }

    /**
     * Get list posts.
     *
     * @param Request $request
     * @return Response
     */
    public function getCollection(Request $request) {
        // Pagination
        $totalEntries = Post::get()->count();
        // Pagination
        $pagination = Utility::Pagination($request, $totalEntries);

        $sortby       = ($request->input('sort_by')) ? : 'id';
        $order        = ($request->input('order') == 'asc') ? 'asc' : 'desc';

        $data = Post::orderBy($sortby, $order)
                    ->take($pagination['per_page'])
                    ->skip($pagination['per_page'] * ($pagination['page']-1) )
                    ->get()
                    ->toArray();
        return response()->json(array($pagination, $data));
    }

    /**
     * Delet a post
     *
     * @param Request $request
     * @return Response
     */
    public function destroy(Request $request, $id) {
        // Validate author id must be an integer
        if (!$this->validateInteger($id,'Post ID')) return response()->json($this->response);
        $post = Post::find((int) $id);
        if ($post) {
            $post->delete();
            // Delete post successfully
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_SUCCESS'),
                trans('api.DESCRIPTION_DELETE_SUCCESS'),
                trans('api.MSG_DELETE_SUCCESS',['attribute' => 'Post','id' => $id])
            );
        } else {
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_DB_NOT_FOUND'),
                trans('api.DESCRIPTION_DB_NOT_FOUND'),
                trans('api.MSG_DB_NOT_FOUND',['attribute' => 'Post'])
            );
        }

        return response()->json($this->response);

    }

}