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
    protected $fillable = ['first_name','last_name','username', 'email'];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = ['password','remember_token'];

    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = true;

    /**
     * Set date time format string
     *
     * @var string
     */
    protected $dateFormatStr = 'm/d/Y H:i:s';

    /**
     * List date time fields
     *
     * @var string
     */
    protected $dates = ['created_at', 'updated_at', 'last_login'];


    /**
     * Change time format to Unix timestamp
     *
     * @return string
     */

    protected function getDateFormat()
    {
        // return Unix timestamp (10 numbers)
        return 'U';
    }

    public function getLastLoginAttribute($attr) {
        return ($this->attributes['last_login'] > 0)
            ? date($this->dateFormatStr,$this->attributes['updated_at'])
            : '';
    }

}
