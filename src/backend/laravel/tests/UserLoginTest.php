<?php

use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use App\User;

class UserLoginTest extends TestCase
{

    use DatabaseTransactions;

    /**
     * Test Validate Required.
     *
     * @return void
     */
    public function testValidateRequired()
    {
        $this->post('/api/users/login', [
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_FAILED'),
                        'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                        "messages"    => array(
                            array("message" => trans('validation.required', ['attribute' => 'username']) ),
                            array("message" => trans('validation.required', ['attribute' => 'password']) ),
                        )
                    )
             ]);
    }

    /**
     * Test Validate Min Character.
     * username: min 3, password: min 6
     * @return void
     */
    public function testValidateMin()
    {

        $this->post('/api/users/login', [
                'username' => 'ab',
                'password' => '12345',
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_FAILED'),
                        'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                        "messages"    => array(
                            array("message" => trans('validation.min.string',['attribute' => 'username', 'min' => 3])),
                            array("message" => trans('validation.min.string',['attribute' => 'password', 'min' => 6])),
                        )
                    )
             ]);
    }

    /**
     * Test Login Successfully.
     *
     * @return void
     */
    public function testLoginSuccess()
    {
        // Check username in database
        $user = User::where('username', 'anh.tuan')
                    ->where('password', bcrypt('123456789z') )->first();
        if (!$user) {
            // Check username existed
            $user = User::where('username', 'anh.tuan')->first();
            if ($user) {
                // change password
                $user->password = bcrypt('123456789');
                $user->save();
            } else {
                User::create([
                    'username'   => 'anh.tuan',
                    'first_name' => 'Tuan',
                    'last_name'  => 'Nguyen',
                    'email'      => 'anh.tuan@mulodo.com',
                    'password'   => bcrypt('123456789'),
                ]);
            }

        }
        $this->post('/api/users/login', [
                'username' => 'anh.tuan',
                'password' => '123456789',
            ])
            ->seeJson([
                'meta' => array
                    (
                        'code'        => trans('api.CODE_INPUT_SUCCESS'),
                        'description' => trans('api.LOGIN_SUCCESS'),
                        'messages'    => array(
                            array('message' => trans('api.MSG_LOGIN_SUCCESS', ['attribute' => $user['first_name'] . ' ' . $user['last_name'] ])
                        )
                    )
                )
            ]
        );
    }

    /**
     * Test Login Failed and too many attempt (5 times).
     *
     * @return void
     */
    public function testLoginFailedAndManyAttempt()
    {
        // Check username & password in database
        $user = User::where('username', 'anh.tuan')
                    ->where('password', bcrypt('123456') )->first();
        if ($user) {
            // change password
            $user->password = bcrypt('123456789');
            $user->save();
        }

        for ($i=0;$i<=5;$i++) {
            if ($i<5) {
                $this->post('/api/users/login', [
                        'username' => 'anh.tuan',
                        'password' => '123456789',
                    ])
                    ->seeJson([
                        'meta' => array
                            (
                                'code'        => trans('api.CODE_AUTHENTICATE_FAILED'),
                                'description' => trans('api.DESCRIPTION_AUTHENTICATE_FAILED'),
                                'messages'    => array(
                                    array('message' => trans('api.MSG_AUTHENTICATE_FAILED')
                                )
                            )
                        )
                    ]
                );
            } else {
                // too many attempt
                $this->post('/api/users/login', [
                        'username' => 'anh.tuan',
                        'password' => '123456789',
                    ])
                    ->seeJson([
                        'meta' => array
                            (
                                'code'        => trans('api.CODE_ATTEMPT_LOGIN'),
                                'description' => trans('api.DESCRIPTION_ATTEMPT_LOGIN'),
                                'messages'    => array(
                                    array('message' => trans('api.MSG_ATTEMPT_LOGIN', ['attribute' => 60])
                                )
                            )
                        )
                    ]
                );
            }

        }
    }


}
