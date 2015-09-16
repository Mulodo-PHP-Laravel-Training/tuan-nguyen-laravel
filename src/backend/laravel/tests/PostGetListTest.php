<?php
use Illuminate\Foundation\Testing\WithoutMiddleware;

use App\User;
use App\Post;

class PostGetListTest extends TestCase
{


    /**
     * Test get all posts successfully.
     * @return void
     */
    public function testSuccess()
    {
        $this->get('/api/posts/')
             ->seeJson([
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_SUCCESS'),
                        'description' => trans('api.DESCRIPTION_GET_SUCCESS'),
                        "messages"    => array(
                            array("message" => trans('api.MSG_GET_SUCCESS',['attribute' => 'Posts']) ),
                        )
                    )
             ]);
    }

}
