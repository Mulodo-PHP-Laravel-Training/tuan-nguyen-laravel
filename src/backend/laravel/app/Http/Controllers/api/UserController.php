<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;

use Validator;
use App\User;
use App\Http\Requests;
use App\Http\Controllers\Controller;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        //
        return trans('validation.api.CODE_INPUT_FAILED');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
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
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit($id)
    {
        //
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
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id)
    {
        //
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


}
