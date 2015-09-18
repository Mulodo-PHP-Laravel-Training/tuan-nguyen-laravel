<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\MyClasses\MessageUtility;
use App\User;
use Illuminate\Support\Facades\Auth;

class ApiController extends Controller
{
    /**
     * Result array to convert json
     *
     * @var array
     */
    public  $response = array();

    /**
     * Display request not found.
     *
     * @return Response
     */
    protected function notFound()
    {
        $this->response = MessageUtility::getResponse(
            trans('api.CODE_NOT_FOUND'),
            trans('api.DESCRIPTION_NOT_FOUND'),
            trans('api.MSG_NOT_FOUND')
        );
        return response()->json($this->response);
    }

    /**
     * Method is not allowed.
     *
     * @return Response
     */
    protected function methodNotAllowed()
    {
        $this->response = MessageUtility::getResponse(
            trans('api.CODE_METHOD_NOT_ALLOWED'),
            trans('api.DESCRIPTION_METHOD_NOT_ALLOWED'),
            trans('api.MSG_METHOD_NOT_ALLOWED')
        );
        return response()->json($this->response);
    }


    /**
     * Empty Data Response.
     *
     * Require params have least one field
     *
     * @return Response
     */
    protected function emptyData($arrFields)
    {
        $this->response = MessageUtility::getResponse(
            trans('api.CODE_INPUT_REQUIRED'),
            trans('api.DESCRIPTION_INPUT_REQUIRED'),
            trans('api.MSG_INPUT_REQUIRED', ['attribute' => implode(', ', $arrFields)])
        );
        return response()->json($this->response);
    }

    /**
     * Send msg response when database occur error.
     *
     * @return Response
     */
    protected function dbError()
    {
        $this->response = MessageUtility::getResponse(
            trans('api.CODE_DB_ERROR'),
            trans('api.DESCRIPTION_DB_ERROR'),
            trans('api.MSG_DB_ERROR')
        );
        return response()->json($this->response);
    }

    /**
     * Get user info by token.
     *
     * @param  string  $token
     * @return mixed   $user
     */
    protected function getUser($token)
    {
        return User::where('remember_token',$token)->first();
    }

    /**
     * Validate string content must be an integer.
     *
     * @param  string  $strId
     * @return mixed
     */
    protected function validateInteger($strId, $fieldName)
    {
        if (preg_match('/^[1-9]([0-9]+)?$/', $strId) ) {
            return true;
        }
        // User id must be an integer
        $this->response = MessageUtility::getResponseInteger($fieldName);
        return false;
    }



}
