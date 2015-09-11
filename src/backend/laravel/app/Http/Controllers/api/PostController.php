<?php

namespace App\Http\Controllers\Api;

use Validator;
use Input;
use URL;
use Illuminate\Http\Request;
use App\MyClasses\MessageUtility;
use App\Post;

class PostController extends ApiController
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        return 'ok';
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create(Request $request)
    {
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        $auth = $this->authenticateToken($request->input('token'));
        if ($auth['success']) {
            $validator = $this->validator($request->all());
            // Validation fails
            if ($validator->fails()) {
                $this->response = MessageUtility::getResponse(
                    trans('api.CODE_INPUT_FAILED'),
                    trans('api.DESCRIPTION_INPUT_FAILED'),
                    MessageUtility::getErrorMessageForResponse($validator->errors()->getMessages())
                );

                return response()->json($this->response);
            } else {
                // Upload file
                $image = '';
                if (Input::file('image')) {
                    $imageLink = $this->upload();
                    $image = URL::to('/uploads/'. $imageLink);
                }
                // Validation success
                $post = Post::create([
                    'author_id' => $auth['user']->id,
                    'title'     => $request->input('title'),
                    'content'   => $request->input('content'),
                    'status'    => $request->input('status'),
                    'image'     => $image

                ]);
                if ($post) {
                    // Create post successfully
                    $this->response = MessageUtility::getResponse(
                        trans('api.CODE_INPUT_SUCCESS'),
                        trans('api.DESCRIPTION_CREATE_SUCCESS'),
                        trans('api.MSG_CREATE_SUCCESS',['objectCreated' => 'Post']),
                        $post->toArray()
                    );
                } else {
                    // Create post failed
                    $this->dbError();
                }
            }

        }
        return response()->json($this->response);
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
        dd($active);
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
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function putActive(Request $request, $id)
    {
        $auth = $this->authenticateToken($request->input('token'));
        if ($auth['success']) {
            // Check post author
            $post = $this->checkPostAuthor($auth['user']->id, $id);
            if ($post) {
                $post->active = 1;
                if ($post->save()) {

                } else {

                }
            }
        }
        return response()->json($this->response);
    }



    /**
     * Get post author.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function checkPostAuthor($author_id, $post_id)
    {
        $post = Post::where('id', (int) $post_id)->first();
        if ($post) {
            if ($post->author_id == $author_id) {
                return $post;
            } else {
                $this->response = MessageUtility::getResponse(
                    trans('api.CODE_AUTHENTICATE_FAILED'),
                    trans('api.DESCRIPTION_AUTHENTICATE_FAILED'),
                    trans('api.DESCRIPTION_AUTHENTICATE_FAILED')
                );
            }
        } else {
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_POST_NOT_FOUND'),
                trans('api.DESCRIPTION_INPUT_FAILED'),
                trans('api.DESCRIPTION_INPUT_FAILED')
            );

        }
        return false;
    }


    /**
     * Get a validator for an incoming request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'title'   => 'required',
            'content' => 'required',
            'status'  => 'required|boolean',
            'image'   => 'image|max:1000',
        ]);

    }

    /**
     * Upload image.
     *
     * @return string $imageLink
     */
    protected function upload()
    {
        // Upload path
        $destinationPath = 'uploads';
        // Getting image extension
        $extension = Input::file('image')->getClientOriginalExtension();
        // Getting image name
        $name = str_replace('.'. $extension,'',Input::file('image')->getClientOriginalName() );
        // renameing image
        $fileName = $name.'-'.rand(11111,99999).'.'.$extension;
        // uploading file to given path
        Input::file('image')->move($destinationPath, $fileName);

        return $fileName;
    }

}
