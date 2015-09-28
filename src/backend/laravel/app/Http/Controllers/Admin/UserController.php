<?php

namespace App\Http\Controllers\Admin;

use DB;
use Validator;
use App\Http\Controllers\Api\UserController as ApiController;
use App\User;
use App\MyClasses\MessageUtility;
use App\MyClasses\Utility;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends ApiController
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
     * Show the application dashboard to the user.
     *
     * @return Response
     */
    public function index(Request $request)
    {
        return view('admin/user');
    }

    /**
     * Process create user
     *
     * @param  Request  $request
     * @return void
     */
    protected function processCreateUser($request)
    {
        $is_admin = (1 == (int) $request->is_admin) ? 1 : 0;
        $user = $this->createUser($request->all(), $is_admin);
        if ($user) {
            // Create user successfully
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_SUCCESS'),
                trans('api.DESCRIPTION_CREATE_SUCCESS'),
                trans('api.MSG_CREATE_SUCCESS',['attribute' => 'User']),
                $user->toArray()
            );
        } else {
            // Create user failed
            $this->dbError();
        }
    }


    /**
     * Update user inforamation.
     *
     * @param Request $request
     * @param Int $id
     * @return Response
     */
    public function update(Request $request, $id)
    {
        $user = User::find($id);
        if ($user) {
            $is_admin = ("1" == $request->is_admin) ? 1 : 0;
            $password = (!empty($request->input('password'))) ? $request->input('password') : '';
            $this->processUpdate($user, $request, $id, $is_admin, $password);
        } else {
            $this->itemNotFound('User');
        }
        return response()->json($this->response);

    }

    /**
     * Get list users.
     *
     * @param Request $request
     * @return Response
     */
    public function getCollection(Request $request) {
        // Search user by name
        if ($request->input('q')) {
            $keySearch = $request->input('q');
            $users = User::where('username','LIKE', '%'.$keySearch.'%')
                        ->orwhere('first_name','LIKE', '%'.$keySearch.'%')
                        ->orwhere('last_name','LIKE', '%'.$keySearch.'%');
        } else {
            $users = new User();
        }
        $totalEntries = $users->get()->count();
        // Pagination
        $pagination = Utility::Pagination($request, $totalEntries);

        $sortby       = ($request->input('sort_by')) ? : 'id';
        $order        = ($request->input('order') == 'asc') ? 'asc' : 'desc';

        $data = $users->orderBy($sortby, $order)
                    ->take($pagination['per_page'])
                    ->skip($pagination['per_page'] * ($pagination['page']-1) )
                    ->get()
                    ->toArray();
        $return = array($pagination, $data);
        return response()->json($return);
    }
}