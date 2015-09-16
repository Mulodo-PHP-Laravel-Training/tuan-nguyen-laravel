<?php
use Illuminate\Foundation\Testing\WithoutMiddleware;

use App\User;
use App\Post;

class PostGetDetailTest extends TestCase
{

    /**
     * Test Post ID is an integer and not found in database
     *
     * @return void
     */
    public function testPostID()
    {

        $this->get('/api/posts/invalidInteger')
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

        $this->get('/api/posts/'. $postId)
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
     * Test get post details successfully.
     * @return void
     */
    public function testSuccess()
    {
        $user = $this->getUserLogin();
        $post = $this->createPost($user->id);

        $this->get('/api/posts/'. $post->id)
             ->seeJson([
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_SUCCESS'),
                        'description' => trans('api.DESCRIPTION_GET_INFO_SUCCESS'),
                        "messages"    => array(
                            array("message" => trans('api.MSG_GET_INFO_SUCCESS',['attribute' => 'Post']) ),
                        )
                    )
             ]);
    }

}
