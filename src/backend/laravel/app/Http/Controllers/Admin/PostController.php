<?php

namespace App\Http\Controllers\Admin;

use DB;
use Validator;
use App\Http\Controllers\Api\ApiController;
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
     * @return Response
     */
    public function index()
    {
        return view('admin/post');
    }

    /**
     * Update user inforamation.
     *
     * @return Response
     */
    public function update(Request $request, $id)
    {
        $user = User::find($id);
        if ($user) {
            // Check parameters have at least one field
            $userFillableField = $user->getFillable();
            if (! Utility::checkArrayHaveKey($user->getFillable(), array_keys($request->all() ) ) ) {
                return $this->emptyData($userFillableField);
            }

            // Validate parameters
            $validator = $this->validator($request->all(), $request->method(), (int) $id);
            // Validation fails
            if ($validator->fails()) {
                $response = MessageUtility::getResponse(
                    trans('api.CODE_INPUT_FAILED'),
                    trans('api.DESCRIPTION_INPUT_FAILED'),
                    MessageUtility::getErrorMessageForResponse($validator->errors()->getMessages())
                );
            } else {
                // Updated successfully
                if ($request->input('password')) {
                    $user->password = bcrypt($request->input('password'));
                }
                if ($user->update($request->all()) ) {
                    $response = MessageUtility::getResponse(
                        trans('api.CODE_INPUT_SUCCESS'),
                        trans('api.DESCRIPTION_UPDATE_SUCCESS'),
                        trans('api.MSG_UPDATE_SUCCESS',['attribute' => 'User', 'id' => $user->id]),
                        $user->toArray()
                    );
                }
            }
        } else {

        }

        return response()->json($response);

    }

    /**
     * Get list posts.
     *
     * @param Request $request
     * @return Response
     */
    public function getCollection(Request $request) {
        // Pagination
        $perPage      = ($request->input('per_page') > 0) ? (int) $request->input('per_page') : 10;
        $page         = ($request->input('page')) ? (int) $request->input('page') : 1;
        $totalEntries = Post::get()->count();
        $totalPages   = ceil($totalEntries/$perPage);
        $sortby       = ($request->input('sort_by')) ? : 'id';
        $order        = ($request->input('order') == 'asc') ? 'asc' : 'desc';

        $data = Post::orderBy($sortby, $order)
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