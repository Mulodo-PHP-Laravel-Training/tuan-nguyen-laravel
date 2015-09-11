<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
   /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'posts';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['author_id','title','content', 'status','image'];


    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = true;

    /**
     * Set date time format
     *
     * @var string
     */
    protected $dateFormat = 'U';


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
