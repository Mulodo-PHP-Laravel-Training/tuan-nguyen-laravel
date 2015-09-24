<?php
use Illuminate\Foundation\Testing\WithoutMiddleware;
use App\User;

class UserCreateTest extends TestCase
{

    /**
     * Test Validate Required.
     *
     * @return void
     */
    public function testValidateRequired()
    {
        $this->post('/api/users', [
            ])
             ->seeJson([
                'data' => null,
                'meta' => array(
                    'code'        => trans('api.CODE_INPUT_FAILED'),
                    'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                    'messages'    => array(
                        array('message' => trans('validation.required', ['attribute' => 'username']) ),
                        array('message' => trans('validation.required', ['attribute' => 'email']) ),
                        array('message' => trans('validation.required', ['attribute' => 'first name']) ),
                        array('message' => trans('validation.required', ['attribute' => 'last name']) ),
                        array('message' => trans('validation.required', ['attribute' => 'password']) ),
                        array('message' => trans('validation.required', ['attribute' => 'password confirmation']) ),
                    )
                )
             ]);
        // empty input
        $userInput = [
            'username'   => '',
            'first_name' => '',
            'last_name'  => '',
            'email'      => '',
            'password'   => '',
            'password_confirmation'   => '',
        ];
        $this->post('/api/users', [
            ])
             ->seeJson([
                'data' => null,
                'meta' => array(
                    'code'        => trans('api.CODE_INPUT_FAILED'),
                    'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                    'messages'    => array(
                        array('message' => trans('validation.required', ['attribute' => 'username']) ),
                        array('message' => trans('validation.required', ['attribute' => 'email']) ),
                        array('message' => trans('validation.required', ['attribute' => 'first name']) ),
                        array('message' => trans('validation.required', ['attribute' => 'last name']) ),
                        array('message' => trans('validation.required', ['attribute' => 'password']) ),
                        array('message' => trans('validation.required', ['attribute' => 'password confirmation']) ),
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

        $userInput = [
            'username' => 'ab',
            'first_name' => 'Ronan',
            'last_name'  => 'Tuan',
            'email'      => 'anh.tuan'.mt_rand().'@mulodo.com',
            'password'   => '12345',
            'password_confirmation'   => '12345',
        ];

        $this->post('/api/users', $userInput)
             ->seeJson([
                'data' => null,
                'meta' => array(
                    'code'        => trans('api.CODE_INPUT_FAILED'),
                    'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                    'messages'    => array(
                        array('message' => trans('validation.min.string',['attribute' => 'username', 'min' => 3])),
                        array('message' => trans('validation.min.string',['attribute' => 'password', 'min' => 6])),
                        array('message' => trans('validation.min.string',['attribute' => 'password confirmation', 'min' => 6])),
                    )
                )
             ]);
    }

    /**
     * Test Validate Max Character.
     * username,first_name,last_name,email: max 50, password:max 20
     * @return void
     */
    public function testValidateMax()
    {

        $userInput = [
            'username'   => 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
            'first_name' => 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
            'last_name'  => 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
            'email'      => 'abaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@mulodo.com',
            'password'   => '123456789012345678900',
            'password_confirmation'   => '123456789012345678900',
        ];
        $this->post('/api/users', $userInput)
            ->seeJson([
                'data' => null,
                'meta' => array(
                    'code'        => trans('api.CODE_INPUT_FAILED'),
                    'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                    'messages'    => array(
                        array('message' => trans('validation.max.string',['attribute' => 'first name', 'max' => 50])),
                        array('message' => trans('validation.max.string',['attribute' => 'last name', 'max' => 50])),
                        array('message' => trans('validation.max.string',['attribute' => 'username', 'max' => 50])),
                        array('message' => trans('validation.max.string',['attribute' => 'password', 'max' => 20])),
                        array('message' => trans('validation.max.string',['attribute' => 'password confirmation', 'max' => 20])),
                        array('message' => trans('validation.max.string',['attribute' => 'email', 'max' => 50])),
                        array('message' => trans('validation.email', ['attribute' => 'email']) ),
                    )
                )
             ]);
    }


    /**
     * Test confirm password.
     * Fields: password, password_confirmation
     *
     * @return void
     */
    public function testConfirmPassword()
    {
        $userInput = [
            'username' => 'abcdef',
            'first_name' => 'Ronan',
            'last_name'  => 'Tuan',
            'email'      => 'anh.tuan'.mt_rand().'@mulodo.com',
            'password'   => '123456',
            'password_confirmation' => '1234567'
        ];
        $this->post('/api/users', $userInput)
             ->seeJson([
                'data' => null,
                'meta' => array(
                    'code'        => trans('api.CODE_INPUT_FAILED'),
                    'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                    'messages'    => array(
                        array('message' => trans('validation.confirmed', ['attribute' => 'password']) )
                    )
                )
             ]);
    }

    /**
     * Test Validate Email.
     *
     * @return void
     */
    public function testValidateEmail()
    {
        $userInput = [
            'username' => 'abcdef',
            'first_name' => 'Ronan',
            'last_name'  => 'Tuan',
            'email'      => 'anh.tuan3.ds.sd.sd.sd.sd.@mulodo.com',
            'password'   => '123456',
            'password_confirmation' => '123456'
        ];
        $this->post('/api/users', $userInput)
             ->seeJson([
                'data' => null,
                'meta' => array(
                    'code'        => trans('api.CODE_INPUT_FAILED'),
                    'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                    'messages'    => array(
                        array('message' => trans('validation.email', ['attribute' => 'email']) )
                    )
                )
             ]);
    }


    /**
     * Test Validate Unique.
     * Unique fields: username,email
     * @return void
     */
    public function testValidateUnique()
    {
        $user = $this->getUserLogin();

        $userInput = [
                'username'   => $user->username,
                'first_name' => $user->first_name,
                'last_name'  => $user->last_name,
                'email'      => $user->email,
                'password'   => '123456',
                'password_confirmation'   => '123456'
        ];
        $this->post('/api/users', $userInput)
            ->seeJson([
                'data' => null,
                'meta' => array(
                    'code'        => trans('api.CODE_INPUT_FAILED'),
                    'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                    'messages'    => array(
                        array('message' => trans('validation.unique', ['attribute' => 'email']) ),
                        array('message' => trans('validation.unique', ['attribute' => 'username']) ),
                    )
                )
             ]
        );

    }

    /**
     * Test success create user.
     * @return void
     */
    public function testCreateSuccess()
    {

        $userInput = [
            'username' => 'anh.tuan'.mt_rand(),
            'first_name' => 'Ronan',
            'last_name'  => 'Tuan',
            'email'      => 'anh.tuan'.mt_rand().'@mulodo.com',
            'password'   => '123456',
            'password_confirmation'   => '123456',
        ];
        $users = User::where('username', $userInput['username'])
                        ->orwhere('email',$userInput['email']);
        if ($users) {
            $users->delete();
        }

        $this->post('/api/users', $userInput)
            ->seeJson([
                'meta' => array(
                    'code'        => trans('api.CODE_INPUT_SUCCESS'),
                    'description' => trans('api.DESCRIPTION_CREATE_SUCCESS'),
                    'messages'    => array(
                        array('message' => trans('api.MSG_CREATE_SUCCESS',['attribute' => 'User']) )
                    )
                )
             ])
             ->seeInDatabase('users',
                [
                    'username'   => $userInput['username'],
                    'email'      => $userInput['email'],
                    'first_name' => $userInput['first_name'],
                    'last_name'  => $userInput['last_name'],
                ]
            );
    }

}
