<?php

namespace App\Providers;
use Validator;
use Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $messages = array(
                'passcheck' => 'Your old password was incorrect',
        );

        Validator::extend('passcheck', function($attribute, $value, $parameters)
        {
            return Hash::check($value, Auth::user()->getAuthPassword());
        });
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
