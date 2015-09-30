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
     * List date time fields.
     *
     * @var string
     */
    protected $dates = ['created_at', 'updated_at'];

    /**
     * List additional fields.
     *
     * @var array
     */
    protected $appends = array('status_name', 'intro', 'author_name');

    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = true;


    /**
     * Relationship with users tables.
     *
     * @return string
     */
    public function users()
    {
        return $this->belongsTo('App\User', 'author_id', 'id');
    }

    /**
     * Relationship with comments tables.
     *
     * @return string
     */
    public function comments()
    {
        return $this->hasMany('App\Comment', 'post_id', 'id');
    }

    /**
     * Deleteting posts.
     * Deleting comments before deleting posts.
     *
     * @return string
     */
    public function delete()
    {
        // deleting all related comments
        $this->comments()->delete();

        // deleting posts
        return parent::delete();
    }

    /**
     * Changing time format to Unix timestamp
     *
     * @return string
     */
    protected function getDateFormat()
    {
        // returning Unix timestamp (10 numbers)
        return 'U';
    }

    /**
     * Getting status name: Active or Deactive
     *
     * @return string
     */
    public function getStatusNameAttribute()
    {
        return (1 == $this->status) ? 'Active' : 'Deactive';
    }

    /**
     * Getting content of intro field
     *
     * @return string
     */
    public function getIntroAttribute()
    {
        $content = strip_tags(html_entity_decode($this->attributes['content']));
        $content = preg_replace("/&#?[a-z0-9]+;/i","",$content);
        $strpos  = (strlen($content) <= 100) ? strlen($content) : 100;
        $intro = substr($content, 0, strpos($content, ' ', $strpos)) . ' ...';
        return $intro;
    }

    /**
     * Getting author name
     *
     * @return string
     */
    public function getAuthorNameAttribute()
    {
        return $this->users->first_name . ' '. $this->users->last_name;
    }

}
