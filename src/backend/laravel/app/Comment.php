<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\MyClasses\ModelTrait;

class Comment extends Model
{
    use ModelTrait;
   /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'comments';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['author_id','post_id','content'];


    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = true;

    /**
     * List date time fields
     *
     * @var string
     */
    protected $dates = ['created_at', 'updated_at'];


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

}
