<?php
use Illuminate\Foundation\Testing\WithoutMiddleware;

use App\User;
use App\Post;

class PostDeleteTest extends TestCase
{

    /**
     * Test Validate & authenticate Token.
     *
     * @return void
     */
    public function testValidateToken()
    {
        $user = $this->getUserLogin();
        $post = $this->createPost($user->id);
        $this->delete('/api/posts/'. $post->id)
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
        $this->delete('/api/posts/'. $post->id, [
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
     * Test permission denied.
     * User can't active other user post
     *
     * @return void
     */
    public function testPermissionDenied()
    {
        $user = $this->getUserLogin();
        $subUser = $this->getSubUser();
        $post = $this->createPost($subUser->id);
        $this->delete('/api/posts/'. $post->id, [
                'token' => $user->remember_token
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code' => trans('api.CODE_PERMISSION_DENIED'),
                        'description' => trans('api.DESCRIPTION_PERMISSION_DENIED'),
                        "messages" => array(
                            array("message" => trans('api.MSG_PERMISSION_DENIED') ),
                        )
                    )
             ]);
    }

    /**
     * Test Post ID must be an integer and test not found in database
     *
     * @return void
     */
    public function testPostID()
    {
        $user = $this->getUserLogin();

        // test integer
        $this->delete('/api/posts/1.3', [
                'token' => $user->remember_token
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
        $post = $this->createPost($user->id);
        $postId = $post->id;
        $post->delete();

        $this->delete('/api/posts/'. $postId, [
                'token' => $user->remember_token,
            ])
             ->seeJson([
                 'data' => null,
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
     * Test success delete user.
     * @return void
     */
    public function testDeleteSuccess()
    {
        $user = $this->getUserLogin();
        $post = $this->createPost($user->id);
        $this->delete('/api/posts/'. $post->id, [
                'token' => $user->remember_token
            ])
             ->seeJson([
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_SUCCESS'),
                        'description' => trans('api.DESCRIPTION_DELETE_SUCCESS'),
                        "messages"    => array(
                            array("message" => trans('api.MSG_DELETE_SUCCESS',['attribute' => 'Post','id' => $post->id]) ),
                        )
                    )
             ])->notSeeInDatabase('posts',
                [
                    'id' => $post->id
                ]
            );
    }

}
