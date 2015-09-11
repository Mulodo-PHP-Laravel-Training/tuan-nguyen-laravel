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
    Route::get('api/users/logout', 'UserController@getLogout');
    Route::post('api/users/login', 'UserController@postLogin');
    Route::post('api/users/changepassword', 'UserController@postChangePassword');
    Route::post('api/users/search', 'UserController@postSearch');
    Route::resource('api/users', 'UserController');

    Route::resource('api/posts', 'PostController');
});

