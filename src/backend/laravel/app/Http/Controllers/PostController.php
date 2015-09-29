<?php

namespace App\Http\Controllers;


use Validator;
use Input;
use URL;
use DB;
use App\Http\Requests;
use App\MyClasses\MessageUtility;
use App\MyClasses\Utility;
use App\Http\Controllers\Api\PostController as ApiPostController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Post;
use App\Comment;

class PostController extends ApiPostController
{

    /**
     * Array of errors
     *
     * @var array
     */
    public  $errors = [];

    /**
     * Displaying post detail
     *
     * @param  Request  $request
     * @return void
     */
    public function detail(Request $request, $id)
    {
        $post = Post::where('id', (int) $id)
                    ->where('status',1)
                    ->first();
        if ($request->isMethod('post')) {
            $this->validatingComment($request, $post);
        }
        $comments = ($post) ? Comment::where('post_id',$post->id)
                                ->orderBy('id', 'desc')
                                ->paginate(10)
                            : [];
        return view('post/detail', [
            'post'     => $post,
            'comments' => $comments,
            'errors'   => $this->errors
        ]);
    }

    /**
     * Validating comment
     *
     * @param  Request  $request
     * @param  Post $post
     * @return void
     */
    protected function validatingComment($request, $post) {
        $validator =  Validator::make($request->all(), [
            'content' => 'required',
        ]);
        // Validation fails
        if ($validator->fails()) {
            $this->errors = $validator->errors();
        } else {
            $this->createComment($request, $post);
        }
    }

    /**
     * Creating comment
     *
     * @param  Request  $request
     * @param  Post $post
     * @return void
     */
    protected function createComment($request, $post) {
         // Inserting new comment
        Comment::create([
            'author_id' => Auth::user()->id,
            'post_id'   => $post->id,
            'content'   => $request->input('content')
        ]);
    }

    /**
     * Displaying article form.
     *
     * @param Request $request
     * @return Response
     */
    public function createArticle(Request $request)
    {
        return view('post/create');
    }

    /**
     * Editing a article.
     *
     * @param Request $request
     * @param Int $id
     * @return Response
     */
    public function editArticle(Request $request, $id)
    {
        $post = Post::where('id', (int) $id)
                    ->where('author_id', Auth::user()->id)
                    ->first();
        return view('post/update', ['post' => $post]);
    }


    /**
     * Validating comment
     *
     * @param  Request  $request
     * @param  Post $post
     * @return void
     */
    protected function validateComment($request, $post)
    {
        $validator =  Validator::make($request->all(), [
            'content' => 'required',
        ]);

        if ($validator->fails()) {
            // Validation fails
            $this->validationFails($validator);
        } else {
            // Validate success.
            $this->processCreateComment($request, $post);
        }
    }

    /**
     * Geting all articles of an user.
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
        return view('post/articles', ['posts' => $posts]);
    }

    /**
     * Creating post
     *
     * @param  Request  $request
     * @return void
     */
    protected function processCreatePost(Request $request)
    {
        // Upload file
        $image = '';
        if (Input::file('image')) {
            $imageLink = $this->upload();
            $image = URL::to('/uploads/'. $imageLink);
        }
        // Validation success
        $post = Post::create([
            'author_id' => Auth::user()->id,
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
                trans('api.MSG_CREATE_SUCCESS',['attribute' => 'Post']),
                $post->toArray()
            );
        } else {
            // Create post failed
            $this->dbError();
        }
    }

    /**
     * Getting list of posts.
     *
     * @param Request $request
     * @return Response
     */
    public function getCollection(Request $request) {
        $userId = Auth::user()->id;
        $totalEntries = Post::where('author_id', $userId)->get()->count();
        // Pagination
        $pagination = Utility::Pagination($request, $totalEntries);

        $sortby       = ($request->input('sort_by')) ? : 'id';
        $order        = ($request->input('order') == 'asc') ? 'asc' : 'desc';

        $data = Post::where('author_id', $userId)
                    ->orderBy($sortby, $order)
                    ->take($pagination['per_page'])
                    ->skip($pagination['per_page'] * ($pagination['page']-1) )
                    ->get()
                    ->toArray();
        return response()->json(array($pagination, $data));
    }

    /**
     * Checking user permission.
     *
     * @param  Request  $request
     * @param  int  $id
     * @return void
     */
    protected function checkPermission($request, $id)
    {
        // Get post & Check permission
        $post = $this->checkPostAuthor(Auth::user()->id, $id);
        if ($post) {
            $this->processUpdate($request, $post);
        }
    }


    /**
     * Removing post by id.
     * URI: DELETE posts/{id}
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy(Request $request,$id)
    {
        // Validate author id must be an integer
        if (!$this->validateInteger($id,'Post ID')) return response()->json($this->response);

        // Get post & Check permission
        $post = $this->checkPostAuthor(Auth::user()->id, (int) $id);
        if ($post && $post->delete()) {
            // Delete post successfully
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_SUCCESS'),
                trans('api.DESCRIPTION_DELETE_SUCCESS'),
                trans('api.MSG_DELETE_SUCCESS',['attribute' => 'Post','id' => $id])
            );
        }
        return response()->json($this->response);
    }

}
