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


    public static function removeArrayElement( $array, $item ) {
        $index = array_search($item, $array);
        if ( $index !== false ) {
            unset( $array[$index] );
        }
        return $array;
    }

    public static function pagination($request, $totalEntries) {
        $perPage      = ($request->input('per_page') > 0) ? (int) $request->input('per_page') : 10;
        $page         = ($request->input('page')) ? (int) $request->input('page') : 1;
        $totalPages   = ceil($totalEntries/$perPage);
        return array(
            'per_page'      => $perPage,
            'total_entries' => $totalEntries,
            'total_pages'   => $totalPages,
            'page'          => $page,
        );   
    }
}