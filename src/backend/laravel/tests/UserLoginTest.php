<?php

use Illuminate\Foundation\Testing\WithoutMiddleware;
use App\User;

class UserLoginTest extends TestCase
{

    /**
     * Test Validate Required.
     *
     * @return void
     */
    public function testValidateRequired()
    {
        $this->put('/api/users/login', [
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

        $this->put('/api/users/login', [
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
     * Test Validate Max Character.
     * username: max 50, password:max 20
     * @return void
     */
    public function testValidateMax()
    {

        $userInput = [
            'username'   => 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
            'password'   => '123456789012345678900',
        ];
        $this->put('/api/users/login', $userInput)
            ->seeJson([
                'data' => null,
                'meta' => array(
                    'code'        => trans('api.CODE_INPUT_FAILED'),
                    'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                    'messages'    => array(
                        array('message' => trans('validation.max.string',['attribute' => 'username', 'max' => 50])),
                        array('message' => trans('validation.max.string',['attribute' => 'password', 'max' => 20])),
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
                    ->where('password', bcrypt('123456') )->first();
        if (!$user) {
            // Check username existed
            $user = User::where('username', 'anh.tuan')->first();
            if ($user) {
                // change password
                $user->password = bcrypt('123456');
                $user->save();
            } else {
                User::create([
                    'username'   => 'anh.tuan',
                    'first_name' => 'Tuan',
                    'last_name'  => 'Nguyen',
                    'email'      => 'anh.tuan@mulodo.com',
                    'password'   => bcrypt('123456'),
                ]);
                $this->seeInDatabase('users',['username' => 'anh.tuan']);
            }

        }
        $this->put('/api/users/login', [
                'username' => 'anh.tuan',
                'password' => '123456',
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
                $this->put('/api/users/login', [
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
                $this->put('/api/users/login', [
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
