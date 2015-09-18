<?php

namespace App\Providers;
use Validator;
use Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\ServiceProvider;
use App\User;
use Input;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Validator::extend('passcheck', function($attribute, $value, $parameters)
        {
            $user = User::where('remember_token', Input::get('token') )->first();
            return Hash::check($value, $user->password);
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
