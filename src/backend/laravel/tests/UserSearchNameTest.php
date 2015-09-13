<?php

use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use App\User;

class UserSearchNameTest extends TestCase
{

    use DatabaseTransactions;

    /**
     * Test Validate Token.
     *
     * @return void
     */
    public function testValidateToken()
    {
        $this->get('/api/users/?token=nyMC8YChBO86QhnzckSDBSic9TOMTZZumUzUQVlBy1HRc8nu2Nt26tXimh')
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
     * Test Validate Required.
     *
     * @return void
     */
    public function testValidateRequired()
    {
        $user= $this->getUserLogin();
        $this->get('/api/users?token='. $user->remember_token)
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_FAILED'),
                        'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                        "messages"    => array(
                            array("message" => trans('validation.required', ['attribute' => 'name']) ),
                        )
                    )
             ]);
    }


    /**
     * Test searching by name Successfully.
     *
     * @return void
     */

    public function testSearchNameSuccess()
    {
        $user = $this->getUserLogin();
        $this->get('/api/users?name=tuan&token='.$user->remember_token)
             ->seeJson([
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_SUCCESS'),
                        'description' => trans('api.DESCRIPTION_SEARCH_SUCCESS'),
                        "messages"    => array(
                            array("message" => trans('api.MSG_SEARCH_SUCCESS', ['attribute' => 'User']) )
                        )
                    )
             ]);
    }



}
