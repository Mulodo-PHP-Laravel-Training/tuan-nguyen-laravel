<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;

use Validator;
use App\User;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\MyClasses\MessageUtility;
use Illuminate\Foundation\Auth\ThrottlesLogins;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Cache\RateLimiter;

class UserController extends Controller
{
    use ThrottlesLogins,AuthenticatesUsers;

    protected $username = 'username';
    public    $response = array();

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        return '';
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function show()
    {
        $this->response = MessageUtility::getResponse(
            trans('api.CODE_NOT_FOUND'), 
            trans('api.DESCRIPTION_NOT_FOUND'),
            trans('api.MSG_NOT_FOUND')
        );
        return response()->json($this->response);
    }


    /**
     * Register a user by post method.
     *
     * @param  Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        $validator = $this->validator($request->all());
        // Validation fails
        if ($validator->fails()) {
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_FAILED'), 
                trans('api.DESCRIPTION_INPUT_FAILED'),
                MessageUtility::getErrorMessageForResponse($validator->errors()->getMessages())
            );            
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
                $this->response = MessageUtility::getResponse(                    
                    trans('api.CODE_DB_ERROR'),
                    trans('api.DESCRIPTION_DB_ERROR'),
                    trans('api.MSG_DB_ERROR')
                );

            }
        }        

        return response()->json($this->response);
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  Request  $request
     * @param  int  $id
     * @return Response
     */
    public function update(Request $request, $id)
    {
        //
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
                    array('token' => $user['remember_token'])
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
        $response = array(
            'meta' => [],
            'data' => null
        );        
        $token = $request->input('token');        
        if ($token) {
            $user  = User::where('remember_token', $token)->first();            
            if ($user) {
                $user->remember_token = '';
                $user->save();

                $this->response = MessageUtility::getResponse(
                    trans('api.CODE_INPUT_SUCCESS'),
                    trans('api.LOGOUT_SUCCESS'),
                    trans('api.LOGOUT_SUCCESS')
                );
            } else {
                $this->response = MessageUtility::getResponse(
                    trans('api.CODE_TOKEN_INVALID'),
                    trans('api.DESCRIPTION_TOKEN_INVALID'),
                    trans('api.DESCRIPTION_TOKEN_INVALID')
                );
            }
        } else {
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_FAILED'),
                trans('api.DESCRIPTION_INPUT_FAILED'),
                trans('api.MSG_TOKEN_REQUIRED')
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
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'username'   => 'required|min:3|max:50|unique:users',
            'first_name' => 'required|max:50',
            'last_name'  => 'required|max:50',
            'email'      => 'required|email|max:50|unique:users',
            'password'   => 'required|min:6',
        ]);
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
