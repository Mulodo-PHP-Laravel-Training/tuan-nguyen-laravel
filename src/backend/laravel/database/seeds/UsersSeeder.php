<?php

use Illuminate\Database\Seeder;
use App\User;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //User::truncate ();
        // add 1st row
        User::create ( [ 
                'username' => 'anh.tuan',
                'first_name' => 'Tuan',
                'last_name' => 'Nguyen' ,
                'email' => 'anh.tuan@mulodo.com',
                'password' => '$2y$10$Qsfad3yzjM0NBHCStjKvZ.w7EEM2ZOX1qnAjZbszXFs6H07qJkk/e',
                'created_at' => 1441278311
        ] );
    }
}
