<?php
use Illuminate\Foundation\Testing\WithoutMiddleware;

use App\User;

class PostCreateTest extends TestCase
{

    /**
     * Test Validate & authenticate Token.
     *
     * @return void
     */
    public function testValidateToken()
    {
        $this->post('/api/posts', [
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
        $this->post('/api/posts', [
                'token' => 'P35sFhMkBv5Xg9vEvyWPLunIF9EnfReHsPyxwoGI6V9bi1clmlxLE0o8YTrJ1'
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
     * Test Validate Max Character.
     * title: max 255
     * @return void
     */
    public function testValidateMax()
    {
		$user = $this->getUserLogin();
        $this->post('/api/posts', [
                'token'   => $user->remember_token,
                'title'   => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi efficitur nunc id accumsan feugiat. Fusce dui neque, fringilla id est quis, sodales dignissim leo. Phasellus egestas condimentum lacus, in lobortis dolor fringilla pharetra. Aliquam dignissim a sem vel porta. Nulla non volutpat neque. Phasellus tincidunt ullamcorper nibh quis commodo. Curabitur vitae neque ut nibh tempus dignissim. Nullam viverra in felis quis pulvinar. Integer convallis dignissim blandit. Nunc a aliquet ligula. Maecenas tincidunt vel neque nec interdum. Maecenas in porta lacus. Nunc varius id metus ut elementum. Sed at vulputate metus. Vestibulum ipsum elit, aliquet sed tortor a, pellentesque blandit mi. Mauris finibus enim eu est sagittis, vel laoreet risus fringilla.',
                'content' => 'This is post content',
                'status'  => 1
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_FAILED'),
                        'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                        "messages"    => array(
                            array("message" => trans('validation.max.string',['attribute' => 'title', 'max' => 255])),
                        )
                    )
             ]);
    }

    /**
     * Test Boolean.
     * Field : status
	 *
     * @return void
     */
    public function testBoolean()
    {
		$user = $this->getUserLogin();
        $this->post('/api/posts', [
                'token'   => $user->remember_token,
                'title'   => 'Lorem ipsum dolor sit amet',
                'content' => 'This is post content',
                'status'  => 5
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code' => trans('api.CODE_INPUT_FAILED'),
                        'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                        "messages" => array(
                            array("message" => trans('validation.boolean',['attribute' => 'status'])),
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
        $user = $this->getUserLogin();
        $this->post('/api/posts', [
                'token' => $user->remember_token
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code' => trans('api.CODE_INPUT_FAILED'),
                        'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                        "messages" => array(
                            array("message" => trans('validation.required', ['attribute' => 'status']) ),
                            array("message" => trans('validation.required', ['attribute' => 'title']) ),
                            array("message" => trans('validation.required', ['attribute' => 'content']) ),
                        )
                    )
             ]);
    }



    /**
     * Test success create user.
     * @return void
     */
    public function testSuccess()
    {
        $user = $this->getUserLogin();
        $dataPost = array(
            'token'     => $user->remember_token,
            'title'     => 'This is the first post title',
            'content'   => 'This is the first post content',
            'status'    => 1
        );
        $user = $this->getUserLogin();
        $this->post('/api/posts', $dataPost)
             ->seeJson([
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_SUCCESS'),
                        'description' => trans('api.DESCRIPTION_CREATE_SUCCESS'),
                        "messages"    => array(
                            array("message" => trans('api.MSG_CREATE_SUCCESS',['attribute' => 'Post']) )
                        )
                    )
             ]);

    }

}
