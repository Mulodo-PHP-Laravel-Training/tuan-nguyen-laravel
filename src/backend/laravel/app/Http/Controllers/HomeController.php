<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Post;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //$this->middleware('auth');
    }

    /**
     * Show the application dashboard to the user.
     *
     * @return Response
     */
    public function index()
    {
        $posts = Post::where('status',1)
                    ->orderBy('id', 'desc')
                    ->paginate(10);
        return view('index', ['posts' => $posts]);
    }

    /**
     * Show homepage when login.
     *
     * @return Response
     */
    public function home()
    {
        return view('home');
    }

}