<?php

namespace App\Http\Controllers\Admin;

use DB;
use Validator;
use App\Http\Controllers\Controller;
use App\User;
use App\MyClasses\MessageUtility;
use App\MyClasses\Utility;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
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
    public function index()
    {
        return view('admin/user');
    }

    /**
     * Show the application dashboard to the user.
     *
     * @return Response
     */
    public function update(Request $request, $id)
    {
		$user = User::where('id', $id)->first();
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
	
	
    public function getCollection(Request $request) {
        // Pagination
        $perPage      = ($request->input('per_page') > 0) ? (int) $request->input('per_page') : 10;
        $page         = ($request->input('page')) ? (int) $request->input('page') : 1;
        $totalEntries = User::get()->count();
        $totalPages   = ceil($totalEntries/$perPage);
        $sortby       = ($request->input('sort_by')) ? : 'id';
        $order        = ($request->input('order') == 'asc') ? 'asc' : 'desc';

        $data = User::orderBy($sortby, $order)
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