<?php

use Illuminate\Support\Facades\Auth;
use App\User;

class TestCase extends Illuminate\Foundation\Testing\TestCase
{
    /**
     * The base URL to use while testing the application.
     *
     * @var string
     */
    protected $baseUrl = 'http://localhost';

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
     * Test Login Successfully.
     *
     * @return Auth
     */
    protected function getUserLogin()
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
     * Create sub user.
     *
     * Using in testing unique
     *
     * @return User
     */
    protected function getSubUser()
    {
        $subUser = [
            'username'   => 'anh.tuan2',
            'first_name' => 'Tuan',
            'last_name'  => 'Nguyen',
            'email'      => 'anh.tuan2@mulodo.com',
            'password'   => bcrypt('123456'),
        ];
        // Check username in database
        $user = User::where('username', 'anh.tuan2')
                    ->where('email', 'anh.tuan2@mulodo.com' )->first();
        if (!$user) {
            $user = User::create($subUser);
        }
        return $user;
    }

}
