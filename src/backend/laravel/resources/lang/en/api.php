<?php

return [


    /*
    |-------------------------------------------------------------------------
    | Custom API Messages
    |-------------------------------------------------------------------------
    | The following lines are used to defined API messages
    |
    */
    'CODE_INPUT_SUCCESS'              => '200',
    'DESCRIPTION_CREATE_SUCCESS'      => 'Created successfully.',
    'DESCRIPTION_UPDATE_SUCCESS'      => 'Updated successfully.',
    'MSG_CREATE_SUCCESS'              => ':attribute was created successfully.',
    'MSG_UPDATE_SUCCESS'              => ':attribute #:id was updated successfully.',
    'LOGIN_SUCCESS'                   => 'Login successfully.',
    'LOGOUT_SUCCESS'                  => 'Logout successfully.',
    'MSG_LOGIN_SUCCESS'               => 'Welcome, :attribute .',
    'DESCRIPTION_GET_INFO_SUCCESS'    => 'Get info successfully.',
    'MSG_GET_INFO_SUCCESS'            => 'Get :attribute info successfully.',
    'DESCRIPTION_CHANGE_PASS_SUCCESS' => 'Change password successfully.',
    'DESCRIPTION_SEARCH_SUCCESS'      => 'Search data successfully.',
    'MSG_SEARCH_SUCCESS'              => 'Search :attribute successfully.',
    'DESCRIPTION_POST_ACTIVE_SUCCESS' => 'Activate post successfully.',
    'MSG_POST_ACTIVE_SUCCESS'         => 'Activate post #:attribute successfully.',
    'DESCRIPTION_POST_DEACTIVE_SUCCESS' => 'Deactivate post successfully.',
    'MSG_POST_DEACTIVE_SUCCESS'         => 'Deactivate post #:attribute successfully.',
	
	'DESCRIPTION_DELETE_SUCCESS'	  => 'Item was deleted successfully.',
	'MSG_DELETE_SUCCESS'			  => ':attribute #:id was deleted successfully.',
	'DESCRIPTION_GET_SUCCESS'		  => 'Get infomation successfully.',
	'MSG_GET_SUCCESS'				  => 'Get :attribute successfully.',
	'MSG_GET_USER_POST_SUCCESS'		  => 'Get all posts of user #:attribute successfully',


    'CODE_NOT_FOUND'                  => '404',
    'DESCRIPTION_NOT_FOUND'           => '404 Not Found.',
    'MSG_NOT_FOUND'                   => 'Your request is not found.',
    'CODE_SERVER_ERROR'               => '500',
    'DESCRIPTION_SERVER_ERROR'        => 'Internal server error',


    'CODE_INPUT_FAILED'               => '1001',
    'DESCRIPTION_INPUT_FAILED'        => 'Input validation failed.',
    'MSG_TOKEN_REQUIRED'              => 'The token field is required.',


    'CODE_DB_ERROR'                   => '1501',
    'DESCRIPTION_DB_ERROR'            => 'Database error.',
    'MSG_DB_ERROR'                    => 'Database error occured. Please try again later.',
    'CODE_ATTEMPT_LOGIN'              => '1502',
    'DESCRIPTION_ATTEMPT_LOGIN'       => 'Too many login attempts.',
    'MSG_ATTEMPT_LOGIN'               => 'Too many login attempts. Please try again in :attribute seconds.',
    'CODE_AUTHENTICATE_FAILED'        => '1503',
    'DESCRIPTION_AUTHENTICATE_FAILED' => 'Authenticate failed.',
    'MSG_AUTHENTICATE_FAILED'         => 'Username or password is invalid.',
    'CODE_TOKEN_INVALID'              => '1504',
    'DESCRIPTION_TOKEN_INVALID'       => 'Authenticate token failed.',

    'CODE_DB_NOT_FOUND'               => '9001',
    'DESCRIPTION_DB_NOT_FOUND'        => 'Not found this item in databse.',
    'MSG_DB_NOT_FOUND'                => 'This :attribute is not found in database.',
    'CODE_PERMISSION_DENIED'          => '9002',
    'DESCRIPTION_PERMISSION_DENIED'   => 'Permission denied.',
    'MSG_PERMISSION_DENIED'           => 'You have not permission to perform the specified operation.',

];
