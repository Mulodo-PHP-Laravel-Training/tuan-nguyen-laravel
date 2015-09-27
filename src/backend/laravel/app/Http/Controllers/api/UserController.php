<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;

use Validator;
use App\User;
use App\Http\Requests;
use App\MyClasses\MessageUtility;
use App\MyClasses\Utility;
use Illuminate\Foundation\Auth\ThrottlesLogins;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Cache\RateLimiter;

class UserController extends ApiController
{
    use ThrottlesLogins,AuthenticatesUsers;

    /**
     * Set the login field
     *
     * Potential values are 'username', 'email'
     *
     * @var string
     */
    protected $username = 'username';

    /**
     * Result array to convert json
     *
     * @var array
     */
    public  $response = array();


    /**
     * Search user by name
     * URI: GET /api/users?name=abc&token=xxx
     *
     * @return Response
     */
    public function index(Request $request)
    {
        $validator =  Validator::make($request->all(), [
            'name' => 'required',
        ]);
        // Validation fails
        if ($validator->fails()) {
            $this->validationFails($validator);
        } else {
            $users = User::where('username','LIKE', '%'.$request->input('name').'%')
                        ->orwhere('first_name','LIKE', '%'.$request->input('name').'%')
                        ->orwhere('last_name','LIKE', '%'.$request->input('name').'%')
                        ->get();
            $usersArr = [];
            foreach ($users as $userItem) {
                $usersArr[] = $userItem->toArray();
            }
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_SUCCESS'),
                trans('api.DESCRIPTION_SEARCH_SUCCESS'),
                trans('api.MSG_SEARCH_SUCCESS', ['attribute' => 'User']),
                $usersArr
            );
        }
        return response()->json($this->response);
    }

    /**
     * Get other user info by ID
     * URI : GET /api/users/{id}?token=xxx
     *
     * @return Response
     */
    public function show(Request $request, $id)
    {
        // Validate user id must be an integer
        if (!$this->validateInteger($id,'User ID')) return response()->json($this->response);

        $user = User::find($id);
        if ($user) {
            // Get user info success
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_SUCCESS'),
                trans('api.DESCRIPTION_GET_INFO_SUCCESS'),
                trans('api.MSG_GET_INFO_SUCCESS', ['attribute' => 'User']),
                $user->toArray()
            );
        } else {
            // User not found
            $this->itemNotFound('User');
        }
        return response()->json($this->response);
    }

    /**
     * Get user info
     * URI : /api/users/self?token=xxx
     *
     * @return Response
     */
    public function getSelf(Request $request)
    {
        // Get user info success
        $this->response = MessageUtility::getResponse(
            trans('api.CODE_INPUT_SUCCESS'),
            trans('api.DESCRIPTION_GET_INFO_SUCCESS'),
            trans('api.MSG_GET_INFO_SUCCESS', ['attribute' => 'User']),
            $this->getUser($request->input('token'))->toArray()
        );
        return response()->json($this->response);
    }


    /**
     * Register a user by post method.
     * URI: POST /api/users
     *
     * @param  Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        $validator = $this->validator($request->all(), $request->method());
        // Validation fails
        if ($validator->fails()) {
            $this->validationFails($validator);
        } else {
            // Validation success
            $this->processCreateUser($request);            
        }
        return response()->json($this->response);
    }

    /**
     * Process create user
     *
     * @param  Request  $request
     * @return Response
     */
    protected function processCreateUser($request)
    {
        $user = $this->createUser($request->all());
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
     * Update user infomation.
     * URI: PUT /api/users/{id}
     *
     * @param  Request  $request
     * @param  id  $id
     * @return Response
     */
    public function update(Request $request,$id)
    {
        // Validate user id must be an integer
        if (!$this->validateInteger($id,'User ID')) return response()->json($this->response);
        $user = $this->getUser($request->input('token'));
        if ($user->id != $id) {
            // You have not permission to perform the specified operation
            $this->permissionDenied();
        } else {
            $this->processUpdate($user, $request, $id);
        }

        return response()->json($this->response);
    }

    /**
     * Process update data.
     *
     * @param  User  $user
     * @param  Request $request
     * @param  Int $id
     * @param  Boolean $is_admin | 0: member, 1: admin
     * @param  String $password
     * @return void
     */
    protected function processUpdate($user, $request, $id, $is_admin = 0, $password = '') {
        // Check parameters have at least one field
        $userFillableField = $user->getFillable();
        $checkArrHaveKey = Utility::checkArrayHaveKey($user->getFillable(), array_keys($request->all() ) );
        if (!$checkArrHaveKey) {
            return $this->emptyData($userFillableField);
        }

        // Validate parameters
        $validator = $this->validator($request->all(), $request->method(), (int) $id);
        // Validation fails
        if ($validator->fails()) {
            $this->validationFails($validator);
        } else {
            // Validation success
            $this->updateUser($user, $request, $is_admin, $password);
        }
    }

    /**
     * Process update user.
     *
     * @param  User  $user
     * @param  Request $request
     * @param  Boolean $is_admin
     * @param  String $password
     * @return void
     */
    protected function updateUser($user, $request, $is_admin, $password) {
        $params = $request->all();
        $params['is_admin'] = $is_admin;            
        if ('' != $password) {            
            $user->password = bcrypt($password);
            $user->save();
        }
        if ($user->update($params)) {
            $this->responseUpdateSuccess($user);
        } else {
            $this->dbError();
        }
    }

    /**
     * Login API by passing username.
     * URI: PUT /users/login
     *
     * @param  Request  $request
     * @return Response
     */
    public function putLogin(Request $request)
    {
        $validator =  Validator::make($request->all(), [
            'username' => 'required|min:3|max:50',
            'password' => 'required|min:6|max:20',
        ]);
        // Validation fails
        if ($validator->fails()) {
            $this->validationFails($validator);
        } else {
            $this->processLoginAction($request);
        }

        return response()->json($this->response);
    }

    /**
     * Process login action
     *
     * @param  Request  $request
     * @return void
     */
    private function processLoginAction($request) {
        $throttles = $this->isUsingThrottlesLoginsTrait();
        // Too many login failed attempts
        if ($throttles && $this->hasTooManyLoginAttempts($request)) {
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_ATTEMPT_LOGIN'),
                trans('api.DESCRIPTION_ATTEMPT_LOGIN'),
                $this->sendLockoutResponse($request)
            );

            return response()->json($this->response);
        }

        $credentials = $this->getCredentials($request);

        // login succesffully
        if (Auth::attempt($credentials, $remember_token = true )) {
            $this->clearLoginAttempts($request);
            $user = Auth::user();
            $user->last_login = time();
            $user->save();
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_SUCCESS'),
                trans('api.LOGIN_SUCCESS'),
                trans('api.MSG_LOGIN_SUCCESS', ['attribute' => $user->first_name . ' ' . $user->last_name ]),
                array('token' => $user->remember_token)
            );

        } else {
            // login failed:username or password is invalid
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_AUTHENTICATE_FAILED'),
                trans('api.DESCRIPTION_AUTHENTICATE_FAILED'),
                trans('api.MSG_AUTHENTICATE_FAILED')
            );
        }

        // increase login attempts
        if ($throttles) {
            $this->incrementLoginAttempts($request);
        }
    }

    /**
     * Logout API .
     * URI: PUT /api/users/logout
     *
     * @param  Request  $request
     * @return Response
     */
    public function putLogout(Request $request)
    {
        $user = $this->getUser($request->input('token'));
        $user->remember_token = '';
        if ($user->save()) {
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_SUCCESS'),
                trans('api.LOGOUT_SUCCESS'),
                trans('api.LOGOUT_SUCCESS')
            );
        }
        return response()->json($this->response);
    }

    /**
     * Change password.
     * URI: PUT /users/password
     *
     * @param  Request  $request
     * @return Response
     */
    public function putChangePassword(Request $request)
    {
        $validator =  Validator::make($request->all(), [
            'old_password' => 'required|min:6|max:20|passcheck:password',
            'new_password' => 'required|min:6|max:20|confirmed',
            'new_password_confirmation' => 'required|min:6|max:20',
        ]);
        // Validation fails
        if ($validator->fails()) {
            $this->validationFails($validator);
        } else {
            // Change password success
            $this->processChangePassword($request);
        }
        return response()->json($this->response);
    }

    /**
     * Process Action change password.
     *
     * @param  Request  $request
     * @return Response
     */
    public function processChangePassword(Request $request) 
    {
        $user = $this->getUser($request->input('token'));
        $user->password = bcrypt($request->input('new_password') );
        if ($user->save()) {
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_SUCCESS'),
                trans('api.DESCRIPTION_CHANGE_PASS_SUCCESS'),
                trans('api.DESCRIPTION_CHANGE_PASS_SUCCESS')
            );
        } else {
            $this->dbError();
        }        
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
            case 'POST':
            {
                return Validator::make($data, [
                    'username'   => 'required|min:3|max:50|unique:users',
                    'first_name' => 'required|max:50',
                    'last_name'  => 'required|max:50',
                    'email'      => 'required|email|max:50|unique:users',
                    'password'   => 'required|min:6|max:20|confirmed',
                    'password_confirmation'   => 'required|min:6|max:20',
                ]);
            }
            case 'PUT':
            case 'PATCH':
            {
                return Validator::make($data, [
                    'username'   => 'sometimes|required|min:3|max:50|unique:users,username,'. $id,
                    'first_name' => 'sometimes|required|max:50',
                    'last_name'  => 'sometimes|required|max:50',
                    'email'      => 'sometimes|required|email|max:50|unique:users,email,'. $id,
                ]);
            }
            default: break;
        }
    }


    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @param boolean $is_admin  // 0: member , 1: admin
     * @return User
     */
    protected function createUser(array $data, $is_admin = 0)
    {
        $user = User::create([
            'username'   => $data['username'],
            'first_name' => $data['first_name'],
            'last_name'  => $data['last_name'],
            'email'      => $data['email'],
            'is_admin'   => (int) $is_admin
        ]);
        $user->password = bcrypt($data['password']);
        $user->save();

        return $user;
    }


    /**
     * Get block timer.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return String
     */
    protected function sendLockoutResponse(Request $request)
    {
        $seconds = app(RateLimiter::class)->availableIn(
            $request->input($this->loginUsername()).$request->ip()
        );
        return trans('api.MSG_ATTEMPT_LOGIN', ['attribute' =>$seconds]);
    }

    /**
     * Get response update User success.
     *
     * @param  User  $user
     * @return void
     */
    protected function responseUpdateSuccess($user)
    {
        $this->response = MessageUtility::getResponse(
            trans('api.CODE_INPUT_SUCCESS'),
            trans('api.DESCRIPTION_UPDATE_SUCCESS'),
            trans('api.MSG_UPDATE_SUCCESS',['attribute' => 'User', 'id' => $user->id]),
            $user->toArray()
        );
    }


}
