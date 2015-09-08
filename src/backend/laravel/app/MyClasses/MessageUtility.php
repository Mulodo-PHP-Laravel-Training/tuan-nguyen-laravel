<?php
namespace App\MyClasses;

class MessageUtility
{
    public static function getErrorMessageForResponse (array $errorMessages)
    {
        $responseMessages = array();

        foreach ($errorMessages as $messages) {
            foreach ($messages as $message) {
                $responseMessages[] = array('message' => $message);
            }
        }
        return $responseMessages;
    }
}

?>