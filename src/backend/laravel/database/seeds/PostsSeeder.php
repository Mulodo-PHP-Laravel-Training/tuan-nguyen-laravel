<?php

use Illuminate\Database\Seeder;
use App\User;
use App\Post;
use Faker\Factory as Faker;

class PostsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for ($i = 0; $i < 20; $i++)
        {        
            $faker = Faker::create();
            $user = User::all()->random(1);        
            Post::create([
                'author_id' => $user->id,
                'title'     => $faker->text(80),
                'content'   => $faker->paragraph($nbSentences = 5),
                'image'     => $faker->imageUrl($width = 640, $height = 480),
                'status'    => 1
            ]);
        }
    }
}