<?php

use Illuminate\Foundation\Testing\WithoutMiddleware;
use App\User;

class UserChangePassTest extends TestCase
{


    /**
     * Test Validate Token.
     *
     * @return void
     */
    public function testValidateToken()
    {
        $this->put('/api/users/password', [
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
        $this->put('/api/users/password', [
            'token' => $user->remember_token
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_FAILED'),
                        'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                        "messages"    => array(
                            array("message" => trans('validation.required', ['attribute' => 'new password']) ),
                            array("message" => trans('validation.required', ['attribute' => 'old password']) ),
                        )
                    )
             ]);
    }


    /**
     * Test Validate Min Character & validate old password.
     * password: min 6
     * @return void
     */
    public function testValidateMin()
    {
        $user = $this->getUserLogin();
        $this->put('/api/users/password', [
                'old_password'   => '12345',
                'new_password'   => '1234',
                'token'      => $user->remember_token
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_FAILED'),
                        'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                        "messages"    => array(
                            array("message" => trans('validation.min.string',['attribute' => 'new password', 'min' => 6])),
                            array("message" => trans('validation.min.string',['attribute' => 'old password', 'min' => 6])),
                            array("message" => trans('validation.passcheck'))
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
        $this->put('/api/users/password',[
                'token' => $user->remember_token,
                'old_password' => '123456',
                'new_password' => '1234567'
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
