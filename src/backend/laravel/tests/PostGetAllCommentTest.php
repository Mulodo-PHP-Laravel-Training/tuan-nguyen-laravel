<?php
use Illuminate\Foundation\Testing\WithoutMiddleware;

use App\User;
use App\Post;

class PostGetAllCommentTest extends TestCase
{

    /**
     * Test Post ID is an integer and not found in database
     *
     * @return void
     */
    public function testUserID()
    {
        $user = $this->getUserLogin();

        $this->get('/api/posts/invalidInteger/comments')
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
        $post->delete();
        $this->get('/api/posts/'. $post->id.'/comments')
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
     * Test get all comments of post successfully.
     * @return void
     */
    public function testSuccess()
    {
        $user = $this->getUserLogin();
        $post = $this->createPost($user->id);
        $this->get('/api/posts/'.$post->id. '/comments')
             ->seeJson([
                 'meta' => array(
                        'code' => trans('api.CODE_INPUT_SUCCESS'),
                        'description' => trans('api.DESCRIPTION_GET_SUCCESS'),
                        "messages" => array(
                            array("message" => trans('api.MSG_GET_POST_COMMENT_SUCCESS',['attribute' => $post->id]) ),
                        )
                    )
             ]);
    }

}
