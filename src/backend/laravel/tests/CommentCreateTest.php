<?php
use Illuminate\Foundation\Testing\WithoutMiddleware;

use App\User;

class CommentCreateTest extends TestCase
{

    /**
     * Test Validate & authenticate Token.
     *
     * @return void
     */
    public function testValidateToken()
    {

        $this->post('/api/posts/1/comments', [
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
        $this->post('/api/posts/1/comments', [
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
     * Test Post ID is an integer and not found in database
     *
     * @return void
     */
    public function testPostID()
    {
        $user = $this->getUserLogin();

        $this->get('/api/posts/invalidInteger/comments', [
                'token'  => $user->remember_token
            ])
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
        // not found in database
        $user = $this->getUserLogin();
        $post = $this->createPost($user->id);
        $postId = $post->id;
        $post->delete();
        $this->post('/api/posts/'. $postId.'/comments',[
                'token' => $user->remember_token
            ])
             ->seeJson([
                 'meta' => array(
                        'code'        => trans('api.CODE_DB_NOT_FOUND'),
                        'description' => trans('api.DESCRIPTION_DB_NOT_FOUND'),
                        "messages"    => array(
                            array("message" => trans('api.MSG_DB_NOT_FOUND',['attribute' => 'Post']) ),
                        )
                    )
            ]);

    }


    /**
     * Test Validate Required.
     *
     * Required fields: content
     * @return void
     */
    public function testValidateRequired()
    {
        $user = $this->getUserLogin();
        $post = $this->createPost($user->id);

        $this->post('/api/posts/'. $post->id. '/comments', [
                'token' => $user->remember_token
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code' => trans('api.CODE_INPUT_FAILED'),
                        'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                        "messages" => array(
                            array("message" => trans('validation.required', ['attribute' => 'content']) ),
                        )
                    )
             ]);
    }



    /**
     * Test success create comment.
     * @return void
     */
    public function testSuccess()
    {
        $user = $this->getUserLogin();
        $post = $this->createPost($user->id);
        $dataComment = array(
            'token'     => $user->remember_token,
            'content'   => 'This is the first comment.',
        );
        $this->post('/api/posts/'. $post->id. '/comments', $dataComment)
             ->seeJson([
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_SUCCESS'),
                        'description' => trans('api.DESCRIPTION_CREATE_SUCCESS'),
                        "messages"    => array(
                            array("message" => trans('api.MSG_CREATE_SUCCESS',['attribute' => 'Comment']) )
                        )
                    )
             ]);

    }

}
