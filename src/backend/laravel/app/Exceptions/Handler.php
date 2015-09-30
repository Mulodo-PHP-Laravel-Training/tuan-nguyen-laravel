<?php

namespace App\Exceptions;

use Exception;
use Redirect;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\HttpKernel\Exception\MethodNotAllowedHttpException;
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
     * Response array.
     *
     * @var array
     */
    protected $response = [];

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
        $uri = $request->path();
        // Checking api uri
        if(preg_match('/^api/', $uri) == 1) {
            $response = $this->handlerAPIException($request, $e);
            return response()->json($response);
        } else {
            // Blog uri
            return $this->handlerBlogException($request, $e);
        }

        return parent::render($request, $e);
    }

    /**
     * Handler API exception
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Exception  $e
     * @return \Illuminate\Http\Response
     */
    private function handlerAPIException($request, $e)
    {
        if ($e instanceof ModelNotFoundException) {
//            $e = new NotFoundHttpException($e->getMessage(), $e);
            $response = MessageUtility::getResponse(
                trans('api.CODE_NOT_FOUND'),
                trans('api.DESCRIPTION_NOT_FOUND'),
                trans('api.MSG_NOT_FOUND')
            );
            return $response;
        }

        if ($e instanceof \Symfony\Component\HttpKernel\Exception\NotFoundHttpException){
            $response = MessageUtility::getResponse(
                trans('api.CODE_NOT_FOUND'),
                trans('api.DESCRIPTION_NOT_FOUND'),
                trans('api.MSG_NOT_FOUND')
            );
            return $response;
        }
        if ($e instanceof MethodNotAllowedHttpException) {
            $response = MessageUtility::getResponse(
                trans('api.CODE_METHOD_NOT_ALLOWED'),
                trans('api.DESCRIPTION_METHOD_NOT_ALLOWED'),
                trans('api.MSG_METHOD_NOT_ALLOWED')
            );
            return $response;
        }

        if ($e instanceof \Exception){
            $response = MessageUtility::getResponse(
                trans('api.CODE_SERVER_ERROR'),
                trans('api.DESCRIPTION_SERVER_ERROR'),
                $e->getMessage()
            );
            return $response;
        }
    }


    /**
     * Hanlder blog frontend & backend exception
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Exception  $e
     * @return \Illuminate\Http\Response
     */
    private function handlerBlogException($request, $e)
    {
        if ($request->isMethod('get')) {
            return Redirect::to('404');
        } else {
            return parent::render($request, $e);
        }
    }
}
