<?php

use Illuminate\Foundation\Testing\WithoutMiddleware;
use App\User;

class UserGetInfoTest extends TestCase
{

    /**
     * Test Validate Required.
     *
     * @return void
     */
    public function testValidateRequired()
    {
        $user = $this->getUserLogin();
        $this->get('/api/users/'. $user->id, [
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

        $this->get('/api/users/self', [
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

    }

    /**
     * Test Validate Token.
     *
     * @return void
     */
    public function testValidateToken()
    {
        $user = $this->getUserLogin();
        $this->get('/api/users/'.$user->id.'?token=xyz')
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

        $this->get('/api/users/self?token=xyz')
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
     * Test Validate Token.
     *
     * @return void
     */
    public function testGetInfoSuccess()
    {

        $user = $this->getUserLogin();
        $this->get('/api/users/'.$user->id.'?token='.$user->remember_token)
             ->seeJson([
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_SUCCESS'),
                        'description' => trans('api.DESCRIPTION_GET_INFO_SUCCESS'),
                        "messages"    => array(
                            array("message" => trans('api.MSG_GET_INFO_SUCCESS', ['attribute' => 'User']) )
                        )
                    ),
                 'data' => $user->toArray()

             ]);

        $this->get('/api/users/self?token='.$user->remember_token)
             ->seeJson([
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_SUCCESS'),
                        'description' => trans('api.DESCRIPTION_GET_INFO_SUCCESS'),
                        "messages"    => array(
                            array("message" => trans('api.MSG_GET_INFO_SUCCESS', ['attribute' => 'User']) )
                        )
                    ),
                 'data' => $user->toArray()

             ]);

    }

}
