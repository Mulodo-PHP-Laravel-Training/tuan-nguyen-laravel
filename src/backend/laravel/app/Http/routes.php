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
    Route::resource('api/users', 'UserController');
});

//Route::resource('/v1/users', 'v1\UserController');


Route::get('/show-autoloaders', function(){
    foreach(spl_autoload_functions() as $callback)
    {
        if(is_string($callback))
        {
            echo '- ',$callback,"\n<br>\n";
        }
 
        else if(is_array($callback))
        {
            if(is_object($callback[0]))
            {
                echo '- ',get_class($callback[0]);
            }
            elseif(is_string($callback[0]))
            {
                echo '- ',$callback[0];
            }
            echo '::',$callback[1],"\n<br>\n";            
        }
        else
        {
            var_dump($callback);
        }
    }
});  

Route::get('/mulodo', function() {
    new Mulodo\Common;
}) ;