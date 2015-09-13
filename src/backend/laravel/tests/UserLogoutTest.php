<?php

use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use App\User;

class UserLogoutTest extends TestCase
{

    use DatabaseTransactions;

    /**
     * Test Validate Required.
     *
     * @return void
     */
    public function testValidateRequired()
    {
        $this->post('/api/users/logout', [
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
     * Test Logout Falied, invalid token.
     *
     * @return void
     */

    public function testLogoutFailed()
    {
        $this->post('/api/users/logout', [
            'token' => 'f8IKRC6ookhF1DjKTsI0eLYlBnm4tYT9FiAAMtXzObCLApQe3joPI3Mrx3OK'
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
     * Test Logout Successfully.
     *
     * @return void
     */

    public function testLogoutSuccess()
    {
        $user = $this->getUserLogin();
        $this->post('/api/users/logout', [
            'token' => $user->remember_token
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_SUCCESS'),
                        'description' => trans('api.LOGOUT_SUCCESS'),
                        "messages"    => array(
                            array("message" => trans('api.LOGOUT_SUCCESS') )
                        )
                    )
             ])
            ->seeInDatabase('users',
                [
                    'username' => 'anh.tuan',
                    'remember_token' => '',
                ]
            );
    }



}
