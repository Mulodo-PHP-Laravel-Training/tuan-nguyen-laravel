<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::group(['namespace' => 'api'], function(){
	Route::get('api/users/self', 'UserController@getSelf');
    Route::post('api/users/logout', 'UserController@postLogout');
    Route::post('api/users/login', 'UserController@postLogin');
    Route::put('api/users/password', 'UserController@putChangePassword');
    Route::post('api/users/search', 'UserController@postSearch');
    Route::resource('api/users', 'UserController');

    Route::put('api/posts/{id}/active', 'PostController@putActive');
    Route::put('api/posts/{id}/deactive', 'PostController@putDeactive');    
	Route::get('api/users/{id}/posts', 'PostController@getUserPosts');    
    Route::resource('api/posts', 'PostController');
});

