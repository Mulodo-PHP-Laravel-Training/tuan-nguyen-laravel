<?php
use Illuminate\Foundation\Testing\WithoutMiddleware;

use App\User;
use App\MyClasses\Utility;

class PostUpdateTest extends TestCase
{

    /**
     * Test Validate & authenticate Token.
     *
     * @return void
     */
    public function testValidateToken()
    {
        $user = $this->getUserLogin();
        $post = $this->createPost($user->id);

        $this->post('/api/posts/'. $post->id, [
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

        $this->post('/api/posts/'. $post->id, [
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
        $post = $this->createPost($user->id);

        $this->post('/api/posts/'. $post->id, [
                'token' => $user->remember_token,
                'title' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi efficitur nunc id accumsan feugiat. Fusce dui neque, fringilla id est quis, sodales dignissim leo. Phasellus egestas condimentum lacus, in lobortis dolor fringilla pharetra. Aliquam dignissim a sem vel porta. Nulla non volutpat neque. Phasellus tincidunt ullamcorper nibh quis commodo. Curabitur vitae neque ut nibh tempus dignissim. Nullam viverra in felis quis pulvinar. Integer convallis dignissim blandit. Nunc a aliquet ligula. Maecenas tincidunt vel neque nec interdum. Maecenas in porta lacus. Nunc varius id metus ut elementum. Sed at vulputate metus. Vestibulum ipsum elit, aliquet sed tortor a, pellentesque blandit mi. Mauris finibus enim eu est sagittis, vel laoreet risus fringilla.',
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
        $post = $this->createPost($user->id);

        $this->post('/api/posts/'. $post->id, [
                'token' => $user->remember_token,
                'status' => 5
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_FAILED'),
                        'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                        "messages"    => array(
                            array("message" => trans('validation.boolean',['attribute' => 'status'])),
                        )
                    )
             ]);
    }

    /**
     * Test Post ID is an integer and not found in database
     *
     * @return void
     */
    public function testPostID()
    {
        $user = $this->getUserLogin();

        $this->post('/api/posts/invalidInteger', [
                'token' => $user->remember_token,
                'status' => 1
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_FAILED'),
                        'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                        "messages"    => array(
                            array("message" => trans('validation.integer', ['attribute' => 'Post ID']) ),
                        )
                    )
             ]);
        // not found in database
        $post = $this->createPost($user->id);
        $postId = $post->id;
        $post->delete();

        $this->post('/api/posts/'. $postId, [
                'token' => $user->remember_token,
                'status' => 1
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_DB_NOT_FOUND'),
                        'description' => trans('api.DESCRIPTION_DB_NOT_FOUND'),
                        "messages"    => array(
                            array("message" => trans('api.MSG_DB_NOT_FOUND',['attribute' => 'Post']) ),
                        )
                    )
            ]);

    }


    /**
     * Test Validate Required.
     * Params must have least one of Post fields (exception: author_id)
     *
     * @return void
     */
    public function testValidateRequired()
    {
        $user = $this->getUserLogin();
        $post = $this->createPost($user->id);
        $fieldsList = Utility::removeArrayElement($post->getFillable(), 'author_id');

        $this->post('/api/posts/'. $post->id, [
                'token' => $user->remember_token
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_REQUIRED'),
                        'description' => trans('api.DESCRIPTION_INPUT_REQUIRED'),
                        "messages"    => array(
                            array("message" => trans('api.MSG_INPUT_REQUIRED', ['attribute' => implode(', ', $fieldsList)]) ),
                        )
                    )
             ]);
    }


    /**
     * Test permission denied.
     * User can't update other user posts.
     *
     * @return void
     */
    public function testPermissionDenied()
    {
        $user = $this->getUserLogin();
        $subUser = $this->getSubUser();
        $post = $this->createPost($subUser->id);

        $this->post('/api/posts/'. $post->id, [
                'token' => $user->remember_token,
                'status' => 1
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_PERMISSION_DENIED'),
                        'description' => trans('api.DESCRIPTION_PERMISSION_DENIED'),
                        "messages"    => array(
                            array("message" => trans('api.MSG_PERMISSION_DENIED') ),
                        )
                    )
             ]);
    }


    /**
     * Test update post successfully.
     * @return void
     */
    public function testSuccess()
    {
        $user = $this->getUserLogin();
        $post = $this->createPost($user->id);

        $dataPost = array(
            'token'     => $user->remember_token,
            'title'     => 'This is the first post title',
            'content'   => 'This is the first post content',
            'status'    => 1,
        );
        $user = $this->getUserLogin();
        $this->post('/api/posts/'. $post->id, $dataPost)
             ->seeJson([
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_SUCCESS'),
                        'description' => trans('api.DESCRIPTION_UPDATE_SUCCESS'),
                        "messages"    => array(
                            array("message" => trans('api.MSG_UPDATE_SUCCESS',['attribute' => 'Post', 'id' => $post->id]) )
                        )
                    )
             ])->seeInDatabase('posts',[
                'title'   => $dataPost['title'],
                'content' => $dataPost['content'],
                'status'  => $dataPost['status']
             ]);
    }

}
