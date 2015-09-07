<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;

use Validator;
use App\User;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\ThrottlesLogins;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Cache\RateLimiter;

class UserController extends Controller
{
    use ThrottlesLogins,AuthenticatesUsers;

    protected $username = 'username';

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
     * Register a user by post method.
     *
     * @param  Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        $response = array(
            'meta' => [],
            'data' => null
        );
        $validator = $this->validator($request->all());
        // Validation fails
        if ($validator->fails()) {
            $response['meta']['code'] = trans('api.CODE_INPUT_FAILED');
            $response['meta']['description'] = trans('api.DESCRIPTION_INPUT_FAILED');
            foreach ($validator->errors()->getMessages() as $messages) {
                foreach ($messages as $message) {
                    $response['meta']['messages'][] = array('message' => $message);
                }
            }
        } else {
            // Validation success
            $user = $this->createUser($request->all());
            if ($user) {
                // Create user successfully 
                $response = array(
                    'meta' => array(
                            'code' => trans('api.CODE_INPUT_SUCCESS'),
                            'message' => trans('api.CREATE_SUCCESS_MESSAGE',['objectCreated' => 'Account'])
                        ),
                    'data' => $user->toArray()
                );
            } else {
                // Create user failed 
                $response = array(
                    'meta' => array(
                            'code' => trans('api.CODE_DB_ERROR'),
                            'description' => trans('api.DESCRIPTION_DB_ERROR')
                        ),
                    'data' => null
                );

            }
        }        

        return response()->json($response);
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
        $response = array(
            'meta' => [],
            'data' => null
        );

        $validator =  Validator::make($request->all(), [
            'username' => 'required|min:3|max:50',
            'password' => 'required|min:6',
        ]);
        // Validation fails
        if ($validator->fails()) {
            $response['meta']['code'] = trans('api.CODE_INPUT_FAILED');
            $response['meta']['description'] = trans('api.DESCRIPTION_INPUT_FAILED');
            foreach ($validator->errors()->getMessages() as $messages) {
                foreach ($messages as $message) {
                    $response['meta']['messages'][] = array('message' => $message);
                }
            }
        } else {            

            $throttles = $this->isUsingThrottlesLoginsTrait();            

            // Too many login failed attempts
            if ($throttles && $this->hasTooManyLoginAttempts($request)) {
                $response['meta']['code'] = trans('api.CODE_ATTEMPT_LOGIN');
                $response['meta']['description'] = trans('api.DESCRIPTION_ATTEMPT_LOGIN');
                $response['meta']['messages'] = array('message' => $this->sendLockoutResponse($request));
                return response()->json($response);
            }

            $credentials = $this->getCredentials($request);
            
            // login succesffully
            if (Auth::attempt($credentials, $remember_token = true )) {
                $this->clearLoginAttempts($request);
                $user = Auth::user()->toArray();
                $response['meta']['code'] = trans('api.CODE_INPUT_SUCCESS');
                $response['meta']['description'] = trans('api.LOGIN_SUCCESS');
                $response['meta']['messages'] = array('message' => trans('api.MSG_LOGIN_SUCCESS', ['attribute' => $user['first_name'] . ' ' . $user['last_name'] ]) );
                $response['data']['token'] = $user['remember_token'];
            } else {
                // login failed:username or password is invalid
                $response['meta']['code'] = trans('api.CODE_AUTHENTICATE_FAILED');
                $response['meta']['description'] = trans('api.DESCRIPTION_AUTHENTICATE_FAILED');
                $response['meta']['messages'] = array('message' => trans('api.MSG_AUTHENTICATE_FAILED') );
            }

            // increase login attempts
            if ($throttles) {
                $this->incrementLoginAttempts($request);
            }

        }

        return response()->json($response);
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
                $response['meta']['code'] = trans('api.CODE_INPUT_SUCCESS');
                $response['meta']['description'] = trans('api.LOGOUT_SUCCESS');                
                $response['meta']['messages'] = array('message' => trans('api.LOGOUT_SUCCESS') );            
            } else {
                $response['meta']['code'] = trans('api.CODE_TOKEN_INVALID');
                $response['meta']['description'] = trans('api.DESCRIPTION_TOKEN_INVALID');                
                $response['meta']['messages'] = array('message' => trans('api.DESCRIPTION_TOKEN_INVALID') );            
            }
        } else {
            $response['meta']['code'] = trans('api.CODE_INPUT_FAILED');
            $response['meta']['description'] = trans('api.DESCRIPTION_INPUT_FAILED');            
            $response['meta']['messages'] = array('message' => trans('api.MSG_TOKEN_REQUIRED') );            
        }
        
        return response()->json($response);
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
            'username' => 'required|min:3|max:50|unique:users',
            'first_name' => 'required|max:50',
            'last_name' => 'required|max:50',
            'email' => 'required|email|max:50|unique:users',
            'password' => 'required|min:6',
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
            'username' => $data['username'],
            'first_name' => $data['first_name'],
            'last_name'  => $data['last_name'],
            'email' => $data['email'],
            'password' => bcrypt($data['password']),            
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
        return $this->getLockoutErrorMessage($seconds);
    }


}
