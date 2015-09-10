<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;

use Validator;
use App\User;
use App\Http\Requests;
use App\MyClasses\MessageUtility;
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
     * Display a listing of the resource.
     *
     * Not to be used
     *
     * @return Response
     */
    public function show()
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
                    trans('api.MSG_CREATE_SUCCESS',['objectCreated' => 'Account']),
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

        $auth = $this->authenticateToken($request->input('token'));

        if ($auth['success']) {
            if ($auth['user']->id != $id) {
                // authentication failed : user cann't not update other user infomation
                $this->response = MessageUtility::getResponse(
                    trans('api.CODE_TOKEN_INVALID'),
                    trans('api.DESCRIPTION_TOKEN_INVALID'),
                    trans('api.DESCRIPTION_TOKEN_INVALID')
                );

            } else {
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
                            trans('api.MSG_UPDATE_SUCCESS',['objectCreated' => 'Account']),
                            $auth['user']->toArray()
                        );
                    } else {
                        $this->dbError();
                    }
                }
            }
        }

        return response()->json($this->response);
    }


    /**
     * Login API by passing username.
     *
     * @param  Request  $request
     * @return Response
     */
    public function postLogin(Request $request)
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
    public function getLogout(Request $request)
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
    public function postChangePassword(Request $request)
    {
        $auth = $this->authenticateToken($request->input('token'));
        if ($auth['success']) {
            $validator =  Validator::make($request->all(), [
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
                // Chang password success
                $auth['user']->password = bcrypt($request->input('password') );
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
     * Search user by name.
     *
     * @param  Request  $request
     * @return Response
     */
    public function postSearch(Request $request)
    {
        $auth = $this->authenticateToken($request->input('token'));
        if ($auth['success']) {
            $validator =  Validator::make($request->all(), [
                'keyword' => 'required',
            ]);
            // Validation fails
            if ($validator->fails()) {
                $this->response = MessageUtility::getResponse(
                    trans('api.CODE_INPUT_FAILED'),
                    trans('api.DESCRIPTION_INPUT_FAILED'),
                    MessageUtility::getErrorMessageForResponse($validator->errors()->getMessages())
                );
            } else {
                $users = User::where('username','LIKE', '%'.$request->input('keyword').'%')
                            ->orwhere('first_name','LIKE', '%'.$request->input('keyword').'%')
                            ->orwhere('last_name','LIKE', '%'.$request->input('keyword').'%')
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
        return User::create([
            'username'   => $data['username'],
            'first_name' => $data['first_name'],
            'last_name'  => $data['last_name'],
            'email'      => $data['email'],
            'password'   => bcrypt($data['password']),
        ]);
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
