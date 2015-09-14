<?php

use Illuminate\Foundation\Testing\WithoutMiddleware;
use App\User;

class UserUpdateTest extends TestCase
{

    /**
     * Test Validate Token.
     *
     * @return void
     */
    public function testValidateToken()
    {
        $user = $this->getUserLogin();
        $this->put('/api/users/'.$user->id, [
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

        $this->put('/api/users/'.$user->id, [
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
     * Test Required fields.
     * Data params must have least one of fields: username,email,first_name, last_name
     * @return void
     */
    public function testRequiredField()
    {
        $user = $this->getUserLogin();
        $this->put('/api/users/'.$user->id, [
                'token'      => $user->remember_token
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code' => trans('api.CODE_INPUT_REQUIRED'),
                        'description' => trans('api.DESCRIPTION_INPUT_REQUIRED'),
                        "messages" => array(
                            array("message" => trans('api.MSG_INPUT_REQUIRED',['attribute' => implode(', ', $user->getFillable())])),
                        )
                    )
             ]);
    }


    /**
     * Test Validate Min Character.
     * username: min 3
     * @return void
     */
    public function testValidateMin()
    {
        $user = $this->getUserLogin();
        $this->put('/api/users/'.$user->id, [
                'username' => 'ab',
                'first_name' => 'Ronan',
                'last_name'  => 'Tuan',
                'email'      => 'anh.tuan3snv@mulodo.com',
                'token'      => $user->remember_token
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code' => trans('api.CODE_INPUT_FAILED'),
                        'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                        "messages" => array(
                            array("message" => trans('validation.min.string',['attribute' => 'username', 'min' => 3])),
                        )
                    )
             ]);
    }

    /**
     * Test Validate Max Character.
     * username,first_name,last_name,email: max 50
     * @return void
     */
    public function testValidateMax()
    {
        $user = $this->getUserLogin();
        $this->put('/api/users/'.$user->id, [
                'username' => 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                'first_name' => 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                'last_name'  => 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                'email'      => 'abaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@mulodo.com',
                'token'      => $user->remember_token
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
     * @return void
     */
    public function testValidateEmail()
    {
        $user = $this->getUserLogin();
        $this->put('/api/users/'. $user->id, [
                'email'      => 'anh.tuan3.ds.sd.sd.sd.sd.@mulodo.com.abx.cyx',
                'token'      => $user->remember_token
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
        $user = $this->getUserLogin();
        $subUser = $this->getSubUser();

        $this->put('/api/users/'. $user->id, [
                'username'   => $subUser->username,
                'first_name' => 'Ronan',
                'last_name'  => 'Tuan',
                'email'      => $subUser->email,
                'token'      => $user->remember_token
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
     * Test Permission Denied.
     * User can't update infomation of other user
     * @return void
     */
    public function testPermissionDenied()
    {
        $user = $this->getUserLogin();
        $subUser = $this->getSubUser();

        $this->put('/api/users/'. $subUser->id, [
                'first_name' => 'Ronan',
                'last_name'  => 'Tuan',
                'token'      => $user->remember_token
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code' => trans('api.CODE_PERMISSION_DENIED'),
                        'description' => trans('api.DESCRIPTION_PERMISSION_DENIED'),
                        "messages" => array(
                            array("message" => trans('api.MSG_PERMISSION_DENIED') ),
                        )
                    )
             ]
        );

    }

    /**
     * Test success update user.
     * @return void
     */
    public function testUpdateSuccess()
    {
        $user = $this->getUserLogin();

        $subUsers = User::where('username', 'anh.tuan2')
                        ->orwhere('email','anh.tuan2@mulodo.com');
        if ($subUsers) {
            $subUsers->delete();
        }

        $this->put('/api/users/'. $user->id, [
                'username'   => 'anh.tuan2',
                'first_name' => 'Ronan',
                'last_name'  => 'Tuan',
                'email'      => 'anh.tuan2@mulodo.com',
                'token'      => $user->remember_token
            ])
             ->seeJson([
                 'meta' => array(
                        'code' => trans('api.CODE_INPUT_SUCCESS'),
                        'description' => trans('api.DESCRIPTION_UPDATE_SUCCESS'),
                        'messages' => array(
                            array('message' => trans('api.MSG_UPDATE_SUCCESS',['attribute' => 'User', 'id' => $user->id]) )
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
