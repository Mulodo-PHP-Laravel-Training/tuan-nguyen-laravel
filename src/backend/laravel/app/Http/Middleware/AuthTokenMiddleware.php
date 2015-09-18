<?php

namespace App\Http\Middleware;
use App\MyClasses\MessageUtility;
use App\User;

use Closure;

class AuthTokenMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $token = $request->input('token');
        $result = array(
            'success'  => false,
            'user'    => [],
        );

        // Validate token
        if (!empty($token) ) {
            $user = User::where('remember_token', $token)->first();
            // authentication
            if (!$user)
            {
                // authentication failed
                $response = MessageUtility::getResponse(
                    trans('api.CODE_TOKEN_INVALID'),
                    trans('api.DESCRIPTION_TOKEN_INVALID'),
                    trans('api.DESCRIPTION_TOKEN_INVALID')
                );
                return response()->json($response);
            }
        } else {
            // Required token
            $response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_FAILED'),
                trans('api.DESCRIPTION_INPUT_FAILED'),
                trans('validation.required', ['attribute' => 'token'])
            );
            return response()->json($response);
        }
        return $next($request);
    }
}
