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
     * Get user info.
     *
     * @return Response
     */
    public function index(Request $request)
    {
        $auth = $this->authenticateToken($request->input('token'));
        if ($auth['success']) {
            $validator =  Validator::make($request->all(), [
                'name' => 'required',
            ]);
            // Validation fails
            if ($validator->fails()) {
                $this->response = MessageUtility::getResponse(
                    trans('api.CODE_INPUT_FAILED'),
                    trans('api.DESCRIPTION_INPUT_FAILED'),
                    MessageUtility::getErrorMessageForResponse($validator->errors()->getMessages())
                );
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
        }
        return response()->json($this->response);
    }

    /**
     * Get user info by ID
     *
     * @return Response
     */
    public function show(Request $request, $id)
    {
        if ($id > 0) {
            $auth = $this->authenticateToken($request->input('token'));
            if ($auth['success']) {
                $user = User::where('id', (int) $id)->first();
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
                    $this->response = MessageUtility::getResponse(
                        trans('api.CODE_DB_NOT_FOUND'),
                        trans('api.DESCRIPTION_DB_NOT_FOUND'),
                        trans('api.MSG_DB_NOT_FOUND', ['attribute' => 'User'])
                    );
                }
            }
        } else {
            // Not a valid user id
            $this->notFound();
        }
        return response()->json($this->response);
    }

	/**
     * Get user info
     *
     * @return Response
     */
    public function getSelf(Request $request)
    {
        $auth = $this->authenticateToken($request->input('token'));
        if ($auth['success']) {
			// Get user info success
			$this->response = MessageUtility::getResponse(
				trans('api.CODE_INPUT_SUCCESS'),
				trans('api.DESCRIPTION_GET_INFO_SUCCESS'),
				trans('api.MSG_GET_INFO_SUCCESS', ['attribute' => 'User']),
				$auth['user']->toArray()
			);
        }
        return response()->json($this->response);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create(Request $request)
    {
        return $this->notFound();
    }


    /**
     * Register a user by post method.
     *
     * @param  Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        $validator = $this->validator($request->all(), $request->method());
        // Validation fails
        if ($validator->fails()) {
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_FAILED'),
                trans('api.DESCRIPTION_INPUT_FAILED'),
                MessageUtility::getErrorMessageForResponse($validator->errors()->getMessages())
            );

            return response()->json($this->response);
        } else {
            // Validation success
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
        return response()->json($this->response);
    }


    /**
     * Update user infomation.
     *
     * @param  Request  $request
     * @param  id  $id
     * @return Response
     */
    public function update(Request $request,$id)
    {
        if ($id > 0) {
            $auth = $this->authenticateToken($request->input('token'));
            if ($auth['success']) {
                if ($auth['user']->id != $id) {
                    // You have not permission to perform the specified operation
                    $this->response = MessageUtility::getResponse(
                        trans('api.CODE_PERMISSION_DENIED'),
                        trans('api.DESCRIPTION_PERMISSION_DENIED'),
                        trans('api.MSG_PERMISSION_DENIED')
                    );

                } else {
                    // Check parameters have at least one field
                    $userFillableField = $auth['user']->getFillable();
                    if (! Utility::checkArrayHaveKey($auth['user']->getFillable(), array_keys($request->all() ) ) ) {
                        return $this->emptyData($userFillableField);
                    }

                    // Validate parameters
                    $validator = $this->validator($request->all(), $request->method(), (int) $id);
                    // Validation fails
                    if ($validator->fails()) {
                        $this->response = MessageUtility::getResponse(
                            trans('api.CODE_INPUT_FAILED'),
                            trans('api.DESCRIPTION_INPUT_FAILED'),
                            MessageUtility::getErrorMessageForResponse($validator->errors()->getMessages())
                        );
                    } else {
                        // Updated successfully
                        if ($auth['user']->update($request->all()) ) {
                            $this->response = MessageUtility::getResponse(
                                trans('api.CODE_INPUT_SUCCESS'),
                                trans('api.DESCRIPTION_UPDATE_SUCCESS'),
                                trans('api.MSG_UPDATE_SUCCESS',['attribute' => 'User', 'id' => $auth['user']->id]),
                                $auth['user']->toArray()
                            );
                        } else {
                            $this->dbError();
                        }
                    }
                }
            }
        } else {
            // Not a valid user id
            $this->notFound();
        }
        return response()->json($this->response);
    }

    /**
     * Not use this function
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy(Request $request,$id)
    {
        return $this->notFound();
    }

    /**
     * Login API by passing username.
     *
     * @param  Request  $request
     * @return Response
     */
    public function putLogin(Request $request)
    {
        $validator =  Validator::make($request->all(), [
            'username' => 'required|min:3|max:50',
            'password' => 'required|min:6',
        ]);
        // Validation fails
        if ($validator->fails()) {
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_FAILED'),
                trans('api.DESCRIPTION_INPUT_FAILED'),
                MessageUtility::getErrorMessageForResponse($validator->errors()->getMessages())
            );
        } else {

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

        return response()->json($this->response);
    }

    /**
     * Logout API .
     *
     * @param  Request  $request
     * @return Response
     */
    public function putLogout(Request $request)
    {
        $auth = $this->authenticateToken($request->input('token'));
        if ($auth['success']) {
            $auth['user']->remember_token = '';
            if ($auth['user']->save()) {
                $this->response = MessageUtility::getResponse(
                    trans('api.CODE_INPUT_SUCCESS'),
                    trans('api.LOGOUT_SUCCESS'),
                    trans('api.LOGOUT_SUCCESS')
                );
            } else {
                $this->dbError();
            }

        }

        return response()->json($this->response);
    }


    /**
     * Change password.
     *
     * @param  Request  $request
     * @return Response
     */
    public function putChangePassword(Request $request)
    {
        $auth = $this->authenticateToken($request->input('token'));
        if ($auth['success']) {
            $validator =  Validator::make($request->all(), [
                'old_password' => 'required|min:6|passcheck:password,123456',
                'new_password' => 'required|min:6',
            ]);
            // Validation fails
            if ($validator->fails()) {
                $this->response = MessageUtility::getResponse(
                    trans('api.CODE_INPUT_FAILED'),
                    trans('api.DESCRIPTION_INPUT_FAILED'),
                    MessageUtility::getErrorMessageForResponse($validator->errors()->getMessages())
                );
            } else {
                // Chang password success
                $auth['user']->password = bcrypt($request->input('new_password') );
                if ($auth['user']->save()) {
                    $this->response = MessageUtility::getResponse(
                        trans('api.CODE_INPUT_SUCCESS'),
                        trans('api.DESCRIPTION_CHANGE_PASS_SUCCESS'),
                        trans('api.DESCRIPTION_CHANGE_PASS_SUCCESS')
                    );
                } else {
                    $this->dbError();
                }
            }
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
            case 'POST':
            {
                return Validator::make($data, [
                    'username'   => 'required|min:3|max:50|unique:users',
                    'first_name' => 'required|max:50',
                    'last_name'  => 'required|max:50',
                    'email'      => 'required|email|max:50|unique:users',
                    'password'   => 'required|min:6',
                ]);
            }
            case 'PUT':
            case 'PATCH':
            {
                return Validator::make($data, [
                    'username'   => 'min:3|max:50|unique:users,username,'. $id,
                    'first_name' => 'max:50',
                    'last_name'  => 'max:50',
                    'email'      => 'email|max:50|unique:users,email,'. $id,
                ]);
            }
            default: break;
        }


    }


    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return User
     */
    protected function createUser(array $data)
    {
        $user = User::create([
            'username'   => $data['username'],
            'first_name' => $data['first_name'],
            'last_name'  => $data['last_name'],
            'email'      => $data['email'],
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


}
