<?php

use Illuminate\Database\Seeder;
use App\User;
use App\Post;
use App\Comment;
use Faker\Factory as Faker;

class CommentsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for ($i = 0; $i < 200; $i++)
        {
            $faker = Faker::create();
            $user = User::all()->random(1);
            $post = Post::all()->random(1);
            Comment::create([
                'author_id' => $user->id,
                'post_id'   => $post->id,
                'content'   => $faker->text(120)
            ]);
        }
    }
}
