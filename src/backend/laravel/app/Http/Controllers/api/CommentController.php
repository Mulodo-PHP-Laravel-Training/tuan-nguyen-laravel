<?php

namespace App\Http\Controllers\Api;

use Validator;
use App\Http\Controllers\Controller;
use App\MyClasses\MessageUtility;
use App\MyClasses\Utility;
use App\Post;
use App\User;
use App\Comment;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class CommentController extends ApiController
{

    /**
     * Get all comments for a post
     * URI: GET /api/posts/{postID}/comments
     *
     * @param  Request  $request
     * @param  Int $postId
     * @return Response
     */
    public function getForPost(Request $request, $postId)
    {
        // Validate postId must be an integer
        if (!$this->validateInteger($postId,'Post ID')) return response()->json($this->response);

        $post = Post::where('id', (int) $postId)
                    ->where('status',1)->first();
        if ($post) {
            // Post found
            // Get all comments
            $comments = Comment::where('post_id', $postId)->get();
            // Get comments successfully
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_SUCCESS'),
                trans('api.DESCRIPTION_GET_SUCCESS'),
                trans('api.MSG_GET_POST_COMMENT_SUCCESS',['attribute' => $postId]),
                $comments->toArray()
            );

        } else {
            // Post not found
            $this->itemNotFound('Post');
        }
        return response()->json($this->response);
    }

   /**
     * Get all comments for a user
     * URI: GET /api/users/{userID}/comments
     *
     * @param  Request  $request
     * @param  Int $userId
     * @return Response
     */
    public function getForUser(Request $request, $userId)
    {
        // Validate postId must be an integer
        if (!$this->validateInteger($userId,'User ID')) return response()->json($this->response);

        $user = User::where('id', (int) $userId)->first();
        if ($user) {
            // Post found
            // Get all comments
            $comments = Comment::where('author_id', $user->id)->get();
            // Get comments successfully
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_SUCCESS'),
                trans('api.DESCRIPTION_GET_SUCCESS'),
                trans('api.MSG_GET_USER_COMMENT_SUCCESS',['attribute' => $userId]),
                $comments->toArray()
            );

        } else {
            // User not found
            $this->itemNotFound('User');

        }
        return response()->json($this->response);
    }


    /**
     * Create new comment in a post
     * URI: POST /api/posts/{postID}/comments
     *
     * @param  Request  $request
     * @return Response
     */
    public function postCreate(Request $request, $postId)
    {
        // Validate postId must be an integer
        if (!$this->validateInteger($postId,'Post ID')) return response()->json($this->response);

        $post = Post::where('id', (int) $postId)
                    ->where('status',1)->first();
        if ($post) {
            // Post found
            // Validate content comment
            $this->validateComment($request, $post);
        } else {
            // Post not found
            $this->itemNotFound('Post');
        }
        return response()->json($this->response);
    }


    /**
     * Validate comment
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
     * Process create comment
     *
     * @param  Request  $request
     * @param  Post $post
     * @return void
     */
    protected function processCreateComment($request, $post)
    {
        // Insert new comment
        $comment = Comment::create([
            'author_id' => $this->getUser($request->input('token'))->id,
            'post_id'   => $post->id,
            'content'   => $request->input('content')
        ]);
        if ($comment) {
            // Create post successfully
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_SUCCESS'),
                trans('api.DESCRIPTION_CREATE_SUCCESS'),
                trans('api.MSG_CREATE_SUCCESS',['attribute' => 'Comment']),
                $comment->toArray()
            );
        } else {
            // Create post failed
            $this->dbError();
        }
    }


    /**
     * Update comment in a post
     * URI : PUT /api/posts/{postId}/comments/{commentId}
     *
     * @param  Request  $request
     * @param  Int  $postId
     * @param  Int  $commentId
     * @return Response
     */
    public function putUpdate(Request $request, $postId, $commentId)
    {
        // Validate postId, commentId must be an integer
        if (!$this->validateInteger($postId, 'Post ID'))
            return response()->json($this->response);
        if (!$this->validateInteger($commentId, 'Comment ID'))
            return response()->json($this->response);

        // Validate content comment
        $validator =  Validator::make($request->all(), [
            'content' => 'required',
        ]);
        if ($validator->fails()) {
            // Validation fails
            $this->validationFails($validator);
        } else {
            // Find comment
            $this->findComment($request, $postId, $commentId);
        }
        return response()->json($this->response);
    }

    /**
     * Find comment in database
     *
     * @param  Request  $request
     * @param  Int  $postId
     * @param  Int  $commentId
     * @return Response
     */
    protected function findComment($request, $postId, $commentId) {
        $comment = Comment::where('id', (int) $commentId)
                    ->where('post_id', (int) $postId)->first();
        if ($comment) {
            // Comment found
            // Check permission: comment author or post author can update comment
            $this->checkPermission($request, $comment);
        } else {
            // Comment not found
            $this->itemNotFound('Comment');
        }
    }

    /**
     * Check permission: comment author or post author can update comment
     *
     * @param  Request  $request
     * @param  Comment  $comment
     * @return void
     */
    protected function checkPermission($request, $comment) {
        if ($this->checkCommentPermission($comment, $request) ) {
            // Update comment
            $comment->content = $request->input('content');
            $this->processUpdate($comment);
        }
    }

    /**
     * Process update comment
     *
     * @param  Comment  $comment
     * @return void
     */
    protected function processUpdate($comment) {
        if ($comment->save()) {
            // Update post successfully
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_SUCCESS'),
                trans('api.DESCRIPTION_UPDATE_SUCCESS'),
                trans('api.MSG_UPDATE_SUCCESS',['attribute' => 'Comment', 'id' => $comment->id]),
                $comment->toArray()
            );
        } else {
            // Update commnet failed
            $this->dbError();
        }
    }

    /**
     * Delete comment in a post
     * URI : DELETE /api/posts/{postId}/comments/{commentId}
     *
     * @param  Request  $request
     * @param  Int  $postId
     * @param  Int  $commentId
     * @return Response
     */
    public function delete(Request $request, $postId, $commentId)
    {
        // Validate postId, commentId must be an integer
        if (!$this->validateInteger($postId, 'Post ID'))
            return response()->json($this->response);
        if (!$this->validateInteger($commentId, 'Comment ID'))
            return response()->json($this->response);

        // Find comment
        $comment = Comment::where('id', (int) $commentId)
                            ->where('post_id', (int) $postId)->first();
        if ($comment) {
            // Comment found
            // Check permission: comment author or post author can delete comment
            if ($this->checkCommentPermission($comment, $request) ) {
                // Check permission success
                $this->processDelete($comment);
            }
        } else {
            // Comment not found
            $this->itemNotFound('Comment');
        }
        return response()->json($this->response);
    }

    /**
     * Process delete comment
     *
     * @param  Comment  $comment
     * @return void
     */
    protected function processDelete($comment) {
        if ($comment->delete()) {
            // Delete comment successfully
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_SUCCESS'),
                trans('api.DESCRIPTION_DELETE_SUCCESS'),
                trans('api.MSG_DELETE_SUCCESS', ['attribute' => 'Comment', 'id' => $comment->id])
            );
        } else {
            // delete Comment failed
            $this->dbError();
        }
    }


    /**
     * Check comment permission.
     *
     * Permission denied when userID different with comments.author_id and posts.author_id
     * @param  App\Comment  $comment
     * @param  Request $request
     * @return boolean
     */
    protected function checkCommentPermission($comment, $request)
    {
        $userId = $this->getUser($request->input('token'))->id;
        if ($userId != $comment->author_id) {
            // User is not author of comment
            $post = Post::where('id',$comment->post_id)->first();
            if ($userId != $post->author_id) {
                // User is not author of post
                $this->permissionDenied();
                return false;
            }
        }
        return true;
    }

}
