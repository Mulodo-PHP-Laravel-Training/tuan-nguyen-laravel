<?php
namespace App\MyClasses;

class Utility
{
    public static function checkArrayHaveKey($arrKey, $dataKey) {
        foreach ($arrKey as $key) {
            if (in_array($key, $dataKey)) {
                return true;
            }
        }
        return false;
    }
}