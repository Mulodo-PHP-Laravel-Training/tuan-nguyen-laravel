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

    public static function getResponse($code, $description , $messages , $data = null) {
        $response = array(
            'meta' => array(
                'code'        => '',
                'description' => '',
                'messages'    => []
            ),
            'data' => null
        );        
        $response['meta']['code'] = (string) $code;        
        $response['meta']['description'] = (string) $description;
        if (is_string($messages)) {
            $response['meta']['messages'] = array(
                array('message' => $messages)
            );
        } 

        if (is_array($messages)) {
            $response['meta']['messages'] = $messages;
        }
        
        return $response;
    }
}

?>