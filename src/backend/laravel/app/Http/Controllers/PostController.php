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
        if ($request->isMethod('post') && $post) {
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
            $this->processComment($request, $post);
        }
    }

    /**
     * Processing comment.
     *
     * @param  Request  $request
     * @param  Post $post
     * @return void
     */
    protected function processComment($request, $post) {
        if ($request->input('id')) {
            $this->updateComment($request, $post);
        } else {
            $this->createComment($request, $post);
        }
    }

    /**
     * Updating comment
     *
     * @param  Request  $request
     * @param  Post $post
     * @return void
     */
    protected function updateComment($request, $post) {
        $comment = Comment::find((int) $request->input('id'));
        if ($this->checkCommentPermission($comment, $post)) {
            $comment->content = $request->input('content');
            $comment->update();
        }
    }

    /**
     * Checking user permission for a comment.
     *
     * Permission denied when userID is different with comments.author_id and posts.author_id
     * @param  Comment  $comment
     * @param  Post $post
     * @return boolean
     */
    protected function checkCommentPermission($comment, $post)
    {
        $userId = Auth::user()->id;
        if (($userId != $comment->author_id) && ($userId != $post->author_id) ) {
            return false;
        }
        return true;
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
            'content'   => htmlentities($request->input('content')),
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
        $totalEntries = Post::where('author_id', $userId)->count();
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

    /**
     * Removing comment by id.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroyComment(Request $request, $id) {
        $comment = Comment::find((int) $id);
        if ($comment) {
            $this->processDeleteComment($comment);
        } else {
            $this->itemNotFound('Comment');
        }
        return response()->json($this->response);
    }

    /**
     * Process deleting comment.
     *
     * @param  Comment $comment
     * @return void
     */
    protected function processDeleteComment($comment) {
        $post = Post::find($comment->post_id);
        $isValid = $this->checkCommentPermission($comment, $post);
        if ($isValid) {
            $comment->delete();
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_SUCCESS'),
                trans('api.DESCRIPTION_DELETE_SUCCESS'),
                trans('api.MSG_DELETE_SUCCESS', ['attribute' => 'Comment', 'id' => $comment->id])
            );
        }
    }

}
