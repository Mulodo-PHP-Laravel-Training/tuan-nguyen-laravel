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
                        'code' => trans('api.CODE_INPUT_FAILED'),
                        'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                        "messages" => array(
                            array("message" => trans('validation.required', ['attribute' => 'username']) ),
                            array("message" => trans('validation.required', ['attribute' => 'email']) ),
                            array("message" => trans('validation.required', ['attribute' => 'first name']) ),
                            array("message" => trans('validation.required', ['attribute' => 'last name']) ),
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

        $this->post('/api/users', [
                'username' => 'ab',
                'first_name' => 'Ronan',
                'last_name'  => 'Tuan',
                'email'      => 'anh.tuan3snv@mulodo.com',
                'password'   => '12345',
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code' => trans('api.CODE_INPUT_FAILED'),
                        'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                        "messages" => array(
                            array("message" => trans('validation.min.string',['attribute' => 'username', 'min' => 3])),
                            array("message" => trans('validation.min.string',['attribute' => 'password', 'min' => 6])),
                        )
                    )
             ]);
    }

    /**
     * Test Validate Max Character.
     * username,first_name,last_name,email: max 50, password: min 6
     * @return void
     */
    public function testValidateMax()
    {

        $this->post('/api/users', [
                'username' => 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                'first_name' => 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                'last_name'  => 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                'email'      => 'abaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@mulodo.com',
                'password'   => '123456',
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code' => trans('api.CODE_INPUT_FAILED'),
                        'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                        "messages" => array(
                            array("message" => trans('validation.max.string',['attribute' => 'first name', 'max' => 50])),
                            array("message" => trans('validation.max.string',['attribute' => 'last name', 'max' => 50])),
                            array("message" => trans('validation.max.string',['attribute' => 'username', 'max' => 50])),
                            array("message" => trans('validation.max.string',['attribute' => 'email', 'max' => 50])),
                            array("message" => trans('validation.email', ['attribute' => 'email']) ),
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
        $this->post('/api/users', [
                'username' => 'abcdef',
                'first_name' => 'Ronan',
                'last_name'  => 'Tuan',
                'email'      => 'anh.tuan3.ds.sd.sd.sd.sd.@mulodo.com',
                'password'   => '123456',
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code' => trans('api.CODE_INPUT_FAILED'),
                        'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                        "messages" => array(
                            array("message" => trans('validation.email', ['attribute' => 'email']) )
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
        $user = User::where('username', 'anh.tuan')->first();
        // User is not exist in database
        if (!$user) {
            User::create([
                'username'   => 'anh.tuan',
                'first_name' => 'Tuan',
                'last_name'  => 'Nguyen',
                'email'      => 'anh.tuan@mulodo.com',
                'password'   => bcrypt('123456'),
            ]);

        }

        $this->post('/api/users', [
                'username' => 'anh.tuan',
                'first_name' => 'Ronan',
                'last_name'  => 'Tuan',
                'email'      => 'anh.tuan@mulodo.com',
                'password'   => '123456',
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code' => trans('api.CODE_INPUT_FAILED'),
                        'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                        "messages" => array(
                            array("message" => trans('validation.unique', ['attribute' => 'email']) ),
                            array("message" => trans('validation.unique', ['attribute' => 'username']) ),
                        )
                    )
             ]
        );

    }

    /**
     * Test success create user.
     * @return void
     */
    public function testSuccess()
    {
        $users = User::where('username', 'anh.tuan2')
                        ->orwhere('email','anh.tuan2@mulodo.com');
        if ($users) {
            $users->delete();
        }
        $this->post('/api/users', [
                'username' => 'anh.tuan2',
                'first_name' => 'Ronan',
                'last_name'  => 'Tuan',
                'email'      => 'anh.tuan2@mulodo.com',
                'password'   => '123456',
            ])
             ->seeJson([
                 'meta' => array(
                        'code' => trans('api.CODE_INPUT_SUCCESS'),
                        'description' => trans('api.DESCRIPTION_CREATE_SUCCESS'),
                        'messages' => array(
                            array('message' => trans('api.MSG_CREATE_SUCCESS',['attribute' => 'User']) )
                        )
                    )
             ])
             ->seeInDatabase('users',
                [
                    'username' => 'anh.tuan2',
                    'email' => 'anh.tuan2@mulodo.com',
                    'first_name' => 'Ronan',
                    'last_name' => 'Tuan',
                ]
            );
    }

}
