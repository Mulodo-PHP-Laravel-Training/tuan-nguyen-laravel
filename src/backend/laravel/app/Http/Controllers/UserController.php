<?php

namespace App\Http\Controllers;


use Validator;
use App\Http\Requests;
use App\Http\Controllers\Api\UserController as ApiUserController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Post;

class UserController extends ApiUserController
{

    /**
     * Array of errors
     *
     * @var array
     */
    public  $errors = [];

    /**
     * Searching user by name.
     *
     * @param Request $request
     * @return Response
     */
    public function index(Request $request)
    {
        return view('user.search');
    }


    /**
     * Displaying a user profile.
     *
     * @return Response
     */
    public function profile()
    {
        $user = Auth::user();
        return view('user.profile', ['user' => $user]);
    }

    /**
     * Update profile.
     *
     *
     * @return Response
     */
    public function getUpdate(Request $request)
    {
        $user = Auth::user();
        // Process Post form
        if ($request->isMethod('post')) {
            $this->validation($request, $user);
            $userArr = $request->all();
        } else {
            $userArr = $user->toArray();
        }
        return view('user.update', ['user' => $userArr, 'errors' => $this->errors]);
    }

    /**
     * Displaying list articles of a logged user.
     *
     * @param Request $request
     * @param Int $id
     * @return Response
     */
    public function listArticles(Request $request)
    {
        return view('user/listPost');
    }

    /**
     * Changing password.
     *
     * @param Request $request
     * @return Response
     */
    public function password(Request $request)
    {
        // Process Post form
        if ($request->isMethod('post')) {
            $user = $this->validatingPassword($request);
        } else {
            $user = array(
                'old_password' => '',
                'new_password' => '',
                'new_password_confirmation' => ''
            );
        }
        return view('user.password', ['user' => $user, 'errors' => $this->errors]);
    }

    /**
     * Validating password form.
     *
     *
     * @return mixed
     */
    protected function validatingPassword($request)
    {
        $validator =  Validator::make($request->all(), [
            'old_password' => 'required|min:6|max:20|passcheck:password',
            'new_password' => 'required|min:6|max:20|confirmed',
            'new_password_confirmation' => 'required|min:6|max:20',
        ]);
        // Validation fails
        if ($validator->fails()) {
            // Getting the error messages from the validator
            $this->errors = $validator->errors();
            return $request->all();
        } else {
            // Changing password success
            $user = $this->getUser($request->input('token'));
            $user->password = bcrypt($request->input('new_password') );
            $user->save();
            $request->session()->flash('success', 'Password was changed successfully!');
            return array(
                'old_password' => '',
                'new_password' => '',
                'new_password_confirmation' => ''
            );
        }
    }

    /**
     * Validation form.
     *
     *
     * @return mixed
     */
    protected function validation($request, $user)
    {
        // Validate parameters
        $validator = $this->validator($request->all(), 'PUT', $user->id);
        // Validation fails
        if ($validator->fails()) {
            // get the error messages from the validator
            $this->errors = $validator->errors();
        } else {
            $params = $request->all();
            unset($params['is_admin']);
            $user->update($params);
            $request->session()->flash('success', 'Profile was updated successfully!');
        }

    }

}
