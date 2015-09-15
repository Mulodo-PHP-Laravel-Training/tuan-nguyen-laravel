<?php

namespace App\MyClasses;

trait ModelTrait
{

    /**
     * Set date time format string
     *
     * @var string
     */
    protected $dateFormatStr = 'm/d/Y H:i:s';

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

    /**
     * Get the unique identifier for the user.
     *
     * @return mixed
     */
    public function getCreatedAtAttribute($attr) {
        return date($this->dateFormatStr,$this->attributes['created_at']);
    }

    public function getUpdatedAtAttribute($attr) {
        return date($this->dateFormatStr,$this->attributes['updated_at']);
    }


}
