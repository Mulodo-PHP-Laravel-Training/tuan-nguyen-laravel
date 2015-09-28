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
     * Errors array
     *
     * @var array
     */
    public  $errors = [];

    /**
     * Search user by name.
     *
     * @param Request $request
     * @return Response
     */
    public function index(Request $request)
    {
//        $user = Auth::user();
        return view('user/search');
    }


    /**
     * Display a user profile.
     *
     * @return Response
     */
    public function profile()
    {
        $user = Auth::user();
        return view('user/profile', ['user' => $user]);
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
        if ('POST' == $request->method()) {
            $this->validation($request, $user);
            $userArr = $request->all();
        } else {
            $userArr = $user->toArray();
        }
        return view('user/update', ['user' => $userArr, 'errors' => $this->errors]);
    }

    /**
     * Get articles.
     *
     * @param Request $request
     * @param Int $id
     * @return Response
     */
    public function getArticles(Request $request, $id)
    {
        $posts = Post::where('status',1)
                    ->where('author_id', (int) $id)
                    ->orderBy('id', 'desc')
                    ->paginate(10);
        return view('user/post', ['posts' => $posts]);
    }


    /**
     * Creat a articles.
     *
     * @param Request $request
     * @return Response
     */
    public function createArticle(Request $request)
    {
        return view('user/createPost');
    }


    /**
     * Change password.
     *
     * @param Request $request
     * @return Response
     */
    public function getPassword(Request $request)
    {
        // Process Post form
        if ('POST' == $request->method()) {
            $user = $this->validationPassword($request);
        } else {
            $user = array(
                'old_password' => '',
                'new_password' => '',
                'new_password_confirmation' => ''
            );
        }
        return view('user/password', ['user' => $user, 'errors' => $this->errors]);
    }

    /**
     * Validation password form.
     *
     *
     * @return mixed
     */
    protected function validationPassword($request)
    {
        $validator =  Validator::make($request->all(), [
            'old_password' => 'required|min:6|max:20|passcheck:password',
            'new_password' => 'required|min:6|max:20|confirmed',
            'new_password_confirmation' => 'required|min:6|max:20',
        ]);
        // Validation fails
        if ($validator->fails()) {
            // get the error messages from the validator
            $this->errors = $validator->errors();
            return $request->all();
        } else {
            // Change password success
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
