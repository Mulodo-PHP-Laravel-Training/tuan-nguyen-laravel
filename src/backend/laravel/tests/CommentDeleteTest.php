<?php
use Illuminate\Foundation\Testing\WithoutMiddleware;

use App\User;

class CommentDeleteTest extends TestCase
{

    /**
     * Test Validate & authenticate Token.
     *
     * @return void
     */
    public function testValidateToken()
    {

        $this->delete('/api/posts/1/comments/1', [
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_FAILED'),
                        'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                        "messages"    => array(
                            array("message" => trans('validation.required', ['attribute' => 'token']) ),
                        )
                    )
             ]);
        $this->delete('/api/posts/1/comments/1', [
                'token' => 'P35sFhMkBv5Xg9vEvyWPLunIF9EnfReHsPyxwoGI6V9bi1clmlxLE0o8YTrJ1'
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_TOKEN_INVALID'),
                        'description' => trans('api.DESCRIPTION_TOKEN_INVALID'),
                        "messages"    => array(
                            array("message" => trans('api.DESCRIPTION_TOKEN_INVALID') )
                        )
                    )
             ]);

    }


    /**
     * Test Post ID and Comment ID are integer and not found in database
     *
     * @return void
     */
    public function testID()
    {
        $user = $this->getUserLogin();
        $commentData = [
            'token'  => $user->remember_token,
        ];

        $this->delete('/api/posts/invalidInteger/comments/invalidInteger', $commentData)
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_FAILED'),
                        'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                        "messages"    => array(
                            array("message" => trans('validation.integer', ['attribute' => 'Post ID']) ),
                        )
                    )
             ]);
        $this->delete('/api/posts/1/comments/invalidInteger', $commentData)
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_FAILED'),
                        'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                        "messages"    => array(
                            array("message" => trans('validation.integer', ['attribute' => 'Comment ID']) ),
                        )
                    )
             ]);

        // not found in database
        $user = $this->getUserLogin();
        $post = $this->createPost($user->id);
        $comment = $this->createComment($user->id, $post->id);
        $commentId = $comment->id;
        $comment->delete();
        $this->delete('/api/posts/' .$post->id. "/comments/" .$commentId, $commentData)
             ->seeJson([
                 'meta' => array(
                        'code'        => trans('api.CODE_DB_NOT_FOUND'),
                        'description' => trans('api.DESCRIPTION_DB_NOT_FOUND'),
                        "messages"    => array(
                            array("message" => trans('api.MSG_DB_NOT_FOUND',['attribute' => 'Comment']) ),
                        )
                    )
            ]);

    }


    /**
     * Test permission denied.
     * User can't delete comment of the other user post
     * User can't delete other user comments.
     *
     * @return void
     */
    public function testPermissionDenied()
    {
        $user = $this->getUserLogin();
        $subUser = $this->getSubUser();
        $post = $this->createPost($subUser->id);
        $comment = $this->createComment($subUser->id, $post->id);

        $this->delete('/api/posts/'. $post->id. '/comments/' . $comment->id, [
                'token'  => $user->remember_token,
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_PERMISSION_DENIED'),
                        'description' => trans('api.DESCRIPTION_PERMISSION_DENIED'),
                        "messages"    => array(
                            array("message" => trans('api.MSG_PERMISSION_DENIED') ),
                        )
                    )
             ]);

    }



    /**
     * Test delete comment successfully.
     * @return void
     */
    public function testSuccess()
    {
        // Update comment for user
        $user = $this->getUserLogin();
        $post = $this->createPost($user->id);
        $comment = $this->createComment($user->id, $post->id);
        $dataComment = array(
            'token'     => $user->remember_token,
            'content'   => 'This is the first comment.',
        );
        $this->delete('/api/posts/'. $post->id. '/comments/'. $comment->id, $dataComment)
             ->seeJson([
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_SUCCESS'),
                        'description' => trans('api.DESCRIPTION_DELETE_SUCCESS'),
                        "messages"    => array(
                            array("message" => trans('api.MSG_DELETE_SUCCESS',['attribute' => 'Comment', 'id' => $comment->id]) )
                        )
                    )
             ]);

        // Update comment for user who is post author
        $user = $this->getUserLogin();
        $subUser = $this->getSubUser();
        $post = $this->createPost($user->id);
        // Comment is created by other user
        $comment = $this->createComment($subUser->id, $post->id);
        $dataComment = array(
            'token'     => $user->remember_token,
            'content'   => 'This is the first comment.',
        );
        $this->delete('/api/posts/'. $post->id. '/comments/'. $comment->id, $dataComment)
             ->seeJson([
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_SUCCESS'),
                        'description' => trans('api.DESCRIPTION_DELETE_SUCCESS'),
                        "messages"    => array(
                            array("message" => trans('api.MSG_DELETE_SUCCESS',['attribute' => 'Comment', 'id' => $comment->id]) )
                        )
                    )
             ]);


    }

}
