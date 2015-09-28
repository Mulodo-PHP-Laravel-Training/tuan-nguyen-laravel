<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\MyClasses\ModelTrait;

class Post extends Model
{
    use ModelTrait;
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
     * List date time fields
     *
     * @var string
     */
    protected $dates = ['created_at', 'updated_at'];

    /**
     * List additional fields.
     *
     * @var array
     */
    protected $appends = array('statusName', 'intro');

    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = true;


    /**
     * Relationship with users tables
     *
     * @return string
     */
    public function users()
    {
        return $this->belongsTo('App\User', 'author_id', 'id');
    }

    /**
     * Relationship with comments tables
     *
     * @return string
     */
    public function comments()
    {
        return $this->hasMany('App\Comment', 'post_id', 'id');
    }

    /**
     * Delete posts
     * Delete comments bebfore delete posts
     *
     * @return string
     */
    public function delete()
    {
        // delete all related comments
        $this->comments()->delete();

        // delete the post
        return parent::delete();
    }

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

    public function getStatusNameAttribute()
    {
        return (1 == $this->status) ? 'Active' : 'Deactive';
    }

    public function getIntroAttribute()
    {
        $content = strip_tags($this->content);
        $title = substr($content, 0, 100) . ' ...';
        return $title;
    }


}
