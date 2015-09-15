<?php
namespace App\MyClasses;

class MessageUtility
{
    /**
     * Get messages from an array messages.
     *
     * @param array $errorMessages
     * @return array $responseMessages
     */
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

    /**
     * Process response array.
     *
     * @param string $code
     * @param string $description
     * @param mixed $messages
     * @param array $data
     *
     * @return array $response
     */
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

        if (is_array($data) ) {
            $response['data'] = $data;
        }
        return $response;
    }

    /**
     * Response when validation integer failed.
     *
     * @param string $attribute
     * @param array $data
     *
     * @return array $response
     */
    public static function getResponseInteger($attribute) {
        return self::getResponse(
            trans('api.CODE_INPUT_FAILED'),
            trans('api.DESCRIPTION_INPUT_FAILED'),
            trans('validation.integer', ['attribute' => $attribute])
        );
    }
}

?>