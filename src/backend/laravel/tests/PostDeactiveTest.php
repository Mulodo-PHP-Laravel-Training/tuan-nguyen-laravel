<?php
use Illuminate\Foundation\Testing\WithoutMiddleware;

use App\User;
use App\Post;

class PostDeactiveTest extends TestCase
{

    /**
     * Test Validate & authenticate Token.
     *
     * @return void
     */
    public function testValidateToken()
    {
        $this->put('/api/posts/1/deactive', [
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_FAILED'),
                        'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                        'messages'    => array(
                            array('message' => trans('validation.required', ['attribute' => 'token']) ),
                        )
                    )
             ]);
        $this->put('/api/posts/1/deactive', [
                'token' => 'P35sFhMkBv5Xg9vEvyWPLunIF9EnfReHsPyxwoGI6V9bi1clmlxLE0o8YTrJ1'
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_TOKEN_INVALID'),
                        'description' => trans('api.DESCRIPTION_TOKEN_INVALID'),
                        'messages'    => array(
                            array('message' => trans('api.DESCRIPTION_TOKEN_INVALID') )
                        )
                    )
             ]);

    }

    /**
     * Post ID must be an integer and test not found in database
     *
     * @return void
     */
    public function testPostID()
    {
        $user = $this->getUserLogin();

        $this->put('/api/posts/1.3/deactive', [
                'token' => $user->remember_token,
                'status' => 0
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_FAILED'),
                        'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                        'messages'    => array(
                            array('message' => trans('validation.integer', ['attribute' => 'Post ID']) ),
                        )
                    )
             ]);

        // not found in database
        $post = $this->createPost($user->id);
        $postId = $post->id;
        $post->delete();

        $this->put('/api/posts/'. $postId .'/deactive', [
                'token' => $user->remember_token,
                'status' => 1
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_DB_NOT_FOUND'),
                        'description' => trans('api.DESCRIPTION_DB_NOT_FOUND'),
                        'messages'    => array(
                            array('message' => trans('api.MSG_DB_NOT_FOUND',['attribute' => 'Post']) ),
                        )
                    )
            ]);

    }


    /**
     * Test permission denied.
     * User can't deactive other user post
     *
     * @return void
     */
    public function testPermissionDenied()
    {
        $user = $this->getUserLogin();
		$subUser = $this->getSubUser();
		$post = $this->createPost($subUser->id);
        $this->put('/api/posts/'. $post->id.'/deactive', [
                'token' => $user->remember_token
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_PERMISSION_DENIED'),
                        'description' => trans('api.DESCRIPTION_PERMISSION_DENIED'),
                        'messages'    => array(
                            array('message' => trans('api.MSG_PERMISSION_DENIED') ),
                        )
                    )
             ]);
    }



    /**
     * Test success deactive user.
     * @return void
     */
    public function testSuccess()
    {
        $user = $this->getUserLogin();
		$post = $this->createPost($user->id);
        $this->put('/api/posts/'. $post->id.'/deactive', [
                'token' => $user->remember_token
            ])
             ->seeJson([
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_SUCCESS'),
                        'description' => trans('api.DESCRIPTION_POST_DEACTIVE_SUCCESS'),
                        'messages'    => array(
                            array('message' => trans('api.MSG_POST_DEACTIVE_SUCCESS',['attribute' => $post->id]) ),
                        )
                    )
             ])
			 ->seeInDatabase('posts',
                [
                    'id' => $post->id,
                    'status' => 0,
                ]
            );
    }

}
