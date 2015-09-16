<?php
use Illuminate\Foundation\Testing\WithoutMiddleware;

use App\User;
use App\Post;

class UserGetAllPostTest extends TestCase
{

    /**
     * Test User ID is an integer and not found in database
     *
     * @return void
     */
    public function testUserID()
    {
        $user = $this->getUserLogin();

        $this->get('/api/users/invalidInteger/posts')
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code' => trans('api.CODE_INPUT_FAILED'),
                        'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                        "messages" => array(
                            array("message" => trans('validation.integer', ['attribute' => 'Author ID']) ),
                        )
                    )
             ]);
        // not found in database
        $subUser = $this->getSubUser();
        $userId  = $subUser->id;
        $subUser->delete();
        $this->get('/api/users/'. $userId.'/posts')
             ->seeJson([
                 'meta' => array(
                        'code' => trans('api.CODE_DB_NOT_FOUND'),
                        'description' => trans('api.DESCRIPTION_DB_NOT_FOUND'),
                        "messages" => array(
                            array("message" => trans('api.MSG_DB_NOT_FOUND',['attribute' => 'User']) ),
                        )
                    )
            ]);

    }



    /**
     * Test get all posts successfully.
     * @return void
     */
    public function testSuccess()
    {
        $user = $this->getUserLogin();
        $this->get('/api/users/'.$user->id. '/posts')
             ->seeJson([
                 'meta' => array(
                        'code' => trans('api.CODE_INPUT_SUCCESS'),
                        'description' => trans('api.DESCRIPTION_GET_SUCCESS'),
                        "messages" => array(
                            array("message" => trans('api.MSG_GET_USER_POST_SUCCESS',['attribute' => $user->id]) ),
                        )
                    )
             ]);
    }

}
