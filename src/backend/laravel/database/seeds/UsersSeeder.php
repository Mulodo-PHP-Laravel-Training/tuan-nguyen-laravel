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
                'password' => bcrypt('123456'),                
        ] );
    }
}
