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
Route::get('/home', 'HomeController@home');
Route::get('/404', 'HomeController@requestNotFound');

Route::controllers([
    'auth' => 'Auth\AuthController',
    'password' => 'Auth\PasswordController',
]);

// Front end routes

Route::group([
    'middleware' => 'auth'
], function() {

    Route::match ( ['get', 'post'], 'users/password', 'UserController@password');
    Route::match ( ['get', 'post'], 'users/profile/change', 'UserController@getUpdate');

    Route::get('users/profile', 'UserController@profile');
    Route::get('users/articles', 'UserController@listArticles');
    Route::post('users/articles', 'UserController@getArticles');

    Route::get('users/articles/edit/{id}', 'PostController@editArticle');
    Route::get('users/articles/create', 'PostController@createArticle');
    Route::get('posts/collection', 'PostController@getCollection');
    Route::post('posts', 'PostController@store');
    Route::post('posts/{id}', 'PostController@update');
    Route::post('article/{id}', 'PostController@detail');
    Route::delete('posts/{id}', 'PostController@destroy');
    Route::delete('comment/{id}', 'PostController@destroyComment');
});

Route::get('users', 'UserController@index');
Route::get('users/{id}/articles', 'PostController@getArticles');
Route::get('article/{id}', 'PostController@detail');


// Admin Routes
Route::group([
    'namespace' => 'Admin',
    'middleware' => 'auth.admin'
], function() {
    // User route
    Route::get('admin', 'HomeController@index');
    Route::get('admin/users', 'UserController@index');

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
Route::get('admin/users/collection', 'Admin\UserController@getCollection');

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

