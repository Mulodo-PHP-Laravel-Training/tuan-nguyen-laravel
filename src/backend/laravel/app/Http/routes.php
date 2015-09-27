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

Route::get('/', 'HomeController@index');
Route::get('home', '\Bestmomo\Scafold\Http\Controllers\HomeController@index');

Route::controllers([
    'auth' => 'Auth\AuthController',
    'password' => 'Auth\PasswordController',
]);

// Admin Routes
Route::group([
    'namespace' => 'Admin',
    'middleware' => 'auth'
], function() {
    // User route
    Route::get('admin', 'HomeController@index');
    Route::get('admin/users', 'UserController@index');
    Route::get('admin/users/collection', 'UserController@getCollection');
    Route::post('admin/users', 'UserController@store');
    Route::put('admin/users/{id}', 'UserController@update');

    // Post route
    Route::get('admin/posts', 'PostController@index');
    Route::get('admin/posts/collection', 'PostController@getCollection');
    Route::post('admin/posts', 'PostController@store');    
    Route::post('admin/posts/{id}', 'PostController@update');        
    Route::delete('admin/posts/{id}', 'PostController@destroy');

    // Comment route
    Route::get('admin/comments', 'CommentController@index');
    Route::get('admin/comments/collection', 'CommentController@getCollection');
    Route::put('admin/posts/{post_id}/comments/{comment_id}', 'CommentController@putUpdate');
    Route::delete('admin/comments/{comment_id}', 'CommentController@destroy');
});

Route::group(['namespace' => 'api', 'middleware' => 'auth.token'], function(){
    // User route
    Route::get('api/users/self', 'UserController@getSelf');
    Route::put('api/users/logout', 'UserController@putLogout');
    Route::put('api/users/login', 'UserController@putLogin');
    Route::put('api/users/password', 'UserController@putChangePassword');
    Route::post('api/users/search', 'UserController@postSearch');
    Route::resource('api/users', 'UserController',
         ['except' => ['create', 'edit', 'destroy']]
    );

    // Post route
    Route::post('api/posts', 'PostController@store');
    Route::post('api/posts/{id}', 'PostController@update');
    Route::put('api/posts/{id}/active', 'PostController@putActive');
    Route::put('api/posts/{id}/deactive', 'PostController@putDeactive');
    Route::delete('api/posts/{id}', 'PostController@destroy');

    // Comment route
    Route::post('api/posts/{postId}/comments','CommentController@postCreate');
    Route::put('api/posts/{postId}/comments/{commentId}','CommentController@putUpdate');
    Route::delete('api/posts/{postId}/comments/{commentId}','CommentController@delete');

});

// Routes not required token
Route::put('api/users/login', 'Api\UserController@putLogin');
Route::post('api/users', 'Api\UserController@store');

Route::get('api/posts', 'Api\PostController@index');
Route::get('api/posts/{id}', 'Api\PostController@show');
Route::get('api/users/{id}/posts', 'Api\PostController@getUserPosts');

Route::get('api/posts/{postId}/comments','Api\CommentController@getForPost');
Route::get('api/users/{userId}/comments','Api\CommentController@getForUser');

