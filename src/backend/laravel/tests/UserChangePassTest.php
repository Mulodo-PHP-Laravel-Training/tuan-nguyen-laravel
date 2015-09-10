<?php

use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use App\User;

class UserChangePassTest extends TestCase
{

    use DatabaseTransactions;

    /**
     * Test Validate Token.
     *
     * @return void
     */
    public function testValidateToken()
    {
        $this->post('/api/users/changepassword', [
                'token' => 'abcxyz'
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
     * Test Validate Required.
     *
     * @return void
     */
    public function testValidateRequired()
    {
        $user= $this->getUserLogin();
        $this->post('/api/users/changepassword', [
            'token' => $user->remember_token
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_FAILED'),
                        'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                        "messages"    => array(
                            array("message" => trans('validation.required', ['attribute' => 'password']) ),
                        )
                    )
             ]);
    }


    /**
     * Test Validate Min Character.
     * password: min 6
     * @return void
     */
    public function testValidateMin()
    {
        $user = $this->getUserLogin();
        $this->post('/api/users/changepassword', [
                'password'   => '12345',
                'token'      => $user->remember_token
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code' => trans('api.CODE_INPUT_FAILED'),
                        'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                        "messages" => array(
                            array("message" => trans('validation.min.string',['attribute' => 'password', 'min' => 6])),
                        )
                    )
             ]);
    }


    /**
     * Test Change password Successfully.
     *
     * @return void
     */

    public function testChangePassSuccess()
    {
        $user = $this->getUserLogin();
        $this->post('/api/users/changepassword',[
                'token' => $user->remember_token,
                'password' => '9876654321'
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_SUCCESS'),
                        'description' => trans('api.DESCRIPTION_CHANGE_PASS_SUCCESS'),
                        "messages"    => array(
                            array("message" => trans('api.DESCRIPTION_CHANGE_PASS_SUCCESS') )
                        )
                    )
             ]);
    }



}
