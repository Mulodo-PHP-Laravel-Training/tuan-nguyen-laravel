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
            $validator =  Validator::make($request->all(), [
                'content' => 'required',
            ]);

            if ($validator->fails()) {
                // Validation fails
                $this->response = MessageUtility::getResponse(
                    trans('api.CODE_INPUT_FAILED'),
                    trans('api.DESCRIPTION_INPUT_FAILED'),
                    MessageUtility::getErrorMessageForResponse($validator->errors()->getMessages())
                );

                return response()->json($this->response);
            } else {
                // Validate success.
                // Insert new comment
                $comment = Comment::create([
                    'author_id' => Auth::user()->id,
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
        } else {
            // Post not found
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_DB_NOT_FOUND'),
                trans('api.DESCRIPTION_DB_NOT_FOUND'),
                trans('api.MSG_DB_NOT_FOUND', ['attribute' => 'Post'])
            );

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
    public function putUpdate(Request $request, $postId, $commentId)
    {
        // Validate postId, commentId must be an integer
        if (!$this->validateInteger($postId,'Post ID')) return response()->json($this->response);
        if (!$this->validateInteger($commentId,'Comment ID')) return response()->json($this->response);

        // Validate content comment
        $validator =  Validator::make($request->all(), [
            'content' => 'required',
        ]);
        if ($validator->fails()) {
            // Validation fails
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_FAILED'),
                trans('api.DESCRIPTION_INPUT_FAILED'),
                MessageUtility::getErrorMessageForResponse($validator->errors()->getMessages())
            );

            return response()->json($this->response);
        } else {
            // Find comment
            $comment = Comment::where('id', (int) $commentId)
                        ->where('post_id', (int) $postId)->first();
            if ($comment) {
                // Comment found
                // Check permission: comment author or post author can update comment
                if ($this->checkCommentPermission($comment) ) {
                    // Update comment
                    $comment->content = $request->input('content');
                    if ($comment->save()) {
                        // Update post successfully
                        $this->response = MessageUtility::getResponse(
                            trans('api.CODE_INPUT_SUCCESS'),
                            trans('api.DESCRIPTION_UPDATE_SUCCESS'),
                            trans('api.MSG_UPDATE_SUCCESS',['attribute' => 'Comment', 'id' => $comment->id]),
                            $comment->toArray()
                        );
                    } else {
                        // Update post failed
                        $this->dbError();
                    }
                }
            } else {
                // Comment not found
                $this->response = MessageUtility::getResponse(
                    trans('api.CODE_DB_NOT_FOUND'),
                    trans('api.DESCRIPTION_DB_NOT_FOUND'),
                    trans('api.MSG_DB_NOT_FOUND', ['attribute' => 'Comment'])
                );
            }
        }
        return response()->json($this->response);
    }

    /**
     * Check comment permission.
     *
     * Permission denied when userID different with comments.author_id and posts.author_id
     * @param  App\Comment  $comment
     * @return boolean
     */
    public function checkCommentPermission($comment)
    {
        $userId = Auth::user()->id;
        if ($userId != $comment->author_id) {
            // User is not author of comment
            $post = Post::where('id',$comment->post_id)->first();
            if ($userId != $post->author_id) {
                // User is not author of post
                $this->response = MessageUtility::getResponse(
                    trans('api.CODE_PERMISSION_DENIED'),
                    trans('api.DESCRIPTION_PERMISSION_DENIED'),
                    trans('api.MSG_PERMISSION_DENIED')
                );
                return false;
            }
        }
        return true;
    }


}
