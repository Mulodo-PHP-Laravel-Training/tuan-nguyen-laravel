<?php

namespace App\Exceptions;

use Exception;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use App\MyClasses\MessageUtility;

class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that should not be reported.
     *
     * @var array
     */
    protected $dontReport = [
        HttpException::class,
        ModelNotFoundException::class,
    ];

    /**
     * Report or log an exception.
     *
     * This is a great spot to send exceptions to Sentry, Bugsnag, etc.
     *
     * @param  \Exception  $e
     * @return void
     */
    public function report(Exception $e)
    {
        return parent::report($e);
    }

    /**
     * Render an exception into an HTTP response.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Exception  $e
     * @return \Illuminate\Http\Response
     */
    public function render($request, Exception $e)
    {
        if ($e instanceof ModelNotFoundException) {
            $e = new NotFoundHttpException($e->getMessage(), $e);
        }

        if ($e instanceof \Symfony\Component\HttpKernel\Exception\NotFoundHttpException){
            $response = MessageUtility::getResponse(
                trans('api.CODE_NOT_FOUND'),
                trans('api.DESCRIPTION_NOT_FOUND'),
                trans('api.MSG_NOT_FOUND')
            );
            return response()->json($response);
        }
        /*
        // Code will be used in the future
        if ($e instanceof \Exception){
            $response = MessageUtility::getResponse(
                trans('api.CODE_SERVER_ERROR'),
                trans('api.DESCRIPTION_SERVER_ERROR'),
                $e->getMessage()
            );
            return response()->json($response);
        }
        */
        return parent::render($request, $e);
    }


}
