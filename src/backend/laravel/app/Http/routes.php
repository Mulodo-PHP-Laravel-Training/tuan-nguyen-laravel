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

Route::group(['namespace' => 'api', 'middleware' => 'auth.token'], function(){

	Route::get('api/users/self', 'UserController@getSelf');
    Route::put('api/users/logout', 'UserController@putLogout');
    Route::put('api/users/login', 'UserController@putLogin');
    Route::put('api/users/password', 'UserController@putChangePassword');
    Route::post('api/users/search', 'UserController@postSearch');
    Route::resource('api/users', 'UserController',
         ['except' => ['create', 'edit', 'destroy']]
    );

    Route::post('api/posts', 'PostController@store');
    Route::post('api/posts/{id}', 'PostController@update');
    Route::put('api/posts/{id}/active', 'PostController@putActive');
    Route::put('api/posts/{id}/deactive', 'PostController@putDeactive');
    Route::delete('api/posts/{id}', 'PostController@destroy');
});

// Route with not required token
Route::put('api/users/login', 'Api\UserController@putLogin');
Route::post('api/users', 'Api\UserController@store');

Route::get('api/posts', 'Api\PostController@index');
Route::get('api/posts/{id}', 'Api\PostController@show');
Route::get('api/users/{id}/posts', 'Api\PostController@getUserPosts');

