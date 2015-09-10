<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\MyClasses\MessageUtility;
use App\User;
use Illuminate\Support\Facades\Auth;

class ApiController extends Controller
{

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
     * Authenticate token.
     *
     * @param  string  $token
     * @return array   $result
     */
    protected function authenticateToken($token)
    {

        $result = array(
            'success'  => false,
            'user'    => [],
        );

        // Validate token
        if (is_string($token) ) {
            $user = User::where('remember_token',$token)->first();
            // authentication
            if ($user) {
                $result['success'] = true;
                $result['user'] = $user;
            } else {
                // authentication failed
                $this->response = MessageUtility::getResponse(
                    trans('api.CODE_TOKEN_INVALID'),
                    trans('api.DESCRIPTION_TOKEN_INVALID'),
                    trans('api.DESCRIPTION_TOKEN_INVALID')
                );
            }
        } else {
            // Required token
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_FAILED'),
                trans('api.DESCRIPTION_INPUT_FAILED'),
                trans('validation.required', ['attribute' => 'token'])
            );
        }

        return $result;
    }


}
