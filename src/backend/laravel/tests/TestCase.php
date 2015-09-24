<?php

use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Support\Facades\Auth;
use App\User;
use App\Post;
use App\Comment;

class TestCase extends Illuminate\Foundation\Testing\TestCase
{
    use DatabaseTransactions;
    /**
     * The base URL to use while testing the application.
     *
     * @var string
     */
    protected $baseUrl = 'http://api.app';

    /**
     * Creates the application.
     *
     * @return \Illuminate\Foundation\Application
     */
    public function createApplication()
    {
        $app = require __DIR__.'/../bootstrap/app.php';

        $app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();

        return $app;
    }


    /**
     * Get user login Successfully.
     *
     * @return Auth
     */
    protected function getUserLogin()
    {
        // Check username in database
        $userInput = [
            'username'   => 'anh.tuan'. mt_rand(),
            'firs_name' => 'Tuan',
            'last_name'  => 'Nguyen',
            'email'      => 'anh.tuan'.mt_rand().'@mulodo.com',
            'password'   => bcrypt('123456'),
        ];
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
                User::create($userInput);
            }
        }

        // User login
        $credentials = array(
            'username'  => 'anh.tuan',
            'password'  => '123456'
        );
        Auth::attempt($credentials, $remember_token = true );
        return Auth::user();
    }

    /**
     * Create an other user.
     *
     * Using in testing unique
     *
     * @return App\User $user
     */
    protected function getSubUser()
    {
        $subUser = [
            'username'   => 'anh.tuan'.mt_rand(),
            'first_name' => 'Tuan',
            'last_name'  => 'Nguyen',
            'email'      => 'anh.tuan'.mt_rand().'@mulodo.com',
            'password'   => bcrypt('123456'),
        ];
        // Check username in database
        $user = User::where('username', $subUser['username'])->first();
        if (!$user) {
            $user = User::create($subUser);
        }
        return $user;
    }

    /**
     * Create a sample post.
     *
     * @param Int   $author_id
     * @return App\Post $post
     */
	protected function createPost($authorId) {
		$post = Post::create([
            'title'     => 'Test post',
            'content'   => 'This is content post',
            'status'    => 1,
            'author_id' => $authorId
		]);
		return $post;
	}

    /**
     * Create a sample comment.
     *
     * @param Int   $authorId
     * @param Int   $postId
     * @return App\Comment $comment
     */
    protected function createComment($authorId, $postId) {
        $comment = Comment::create([
            'content'   => 'This is content post',
            'author_id' => $authorId,
            'post_id'   => $postId
        ]);
        return $comment;
    }

}
