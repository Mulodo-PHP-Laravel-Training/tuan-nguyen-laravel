<?php

use Illuminate\Database\Seeder;
use App\User;
use Faker\Factory as Faker;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::create ( [
            'username'   => 'anh.tuan',
            'first_name' => 'Tuan',
            'last_name'  => 'Nguyen',
            'email'      => 'anh.tuan@mulodo.com',
            'is_admin'   => 1,
            'password'   => bcrypt('123456')
        ]);

        for ($i = 0; $i < 10; $i++)
        {
            $faker = Faker::create();
            User::create ( [
                'username'   => $faker->userName,
                'first_name' => $faker->firstName,
                'last_name'  => $faker->lastName ,
                'email'      => $faker->email,
                'is_admin'   => 0,
                'password'   => bcrypt('123456')
            ]);
        }
    }
}
