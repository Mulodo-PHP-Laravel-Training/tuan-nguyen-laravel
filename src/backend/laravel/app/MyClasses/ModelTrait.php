<?php

namespace App\MyClasses;

trait ModelTrait
{
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
