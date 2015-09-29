<?php

namespace App;

use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Foundation\Auth\Access\Authorizable;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Contracts\Auth\Access\Authorizable as AuthorizableContract;
use Illuminate\Contracts\Auth\CanResetPassword as CanResetPasswordContract;
use Carbon\Carbon;
use App\MyClasses\ModelTrait;

class User extends Model implements AuthenticatableContract,
                                    AuthorizableContract,
                                    CanResetPasswordContract
{
    use Authenticatable, Authorizable, CanResetPassword, ModelTrait;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'users';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['first_name','last_name','username', 'email', 'is_admin'];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = ['password','remember_token'];

    /**
     * List additional fields.
     *
     * @var array
     */
    protected $appends = array('role_name');


    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = true;

    /**
     * List date time fields.
     *
     * @var string
     */
    protected $dates = ['created_at', 'updated_at', 'last_login'];

    /**
     * Getting login time with date time format.
     *
     * @return string
     */
    public function getLastLoginAttribute($attr) {
        return ($this->attributes['last_login'] > 0)
            ? date($this->dateFormatStr, $this->attributes['last_login'])
            : '';
    }

    /**
     * Relationship with comments tables.
     *
     * @return string
     */
    public function comments()
    {
        return $this->hasMany('App\Comment', 'author_id', 'id');
    }

    /**
     * Relationship with posts tables.
     *
     * @return string
     */
    public function posts()
    {
        return $this->hasMany('App\Post', 'author_id', 'id');
    }

    /**
     * Deleting users.
     * Deleting posts before deleting user.
     *
     * @return string
     */
    public function delete()
    {
        // deleting all related comments
        $this->comments()->delete();
        // deleting all related posts
        $this->posts()->delete();

        // deleting user
        return parent::delete();
    }

    public function getRoleNameAttribute()
    {
        return (1 == $this->is_admin) ? 'Admin' : 'Member';
    }

}
