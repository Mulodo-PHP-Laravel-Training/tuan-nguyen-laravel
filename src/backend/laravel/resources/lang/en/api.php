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
    'DESCRIPTION_CREATE_SUCCESS'      => 'Created successfully',
    'MSG_CREATE_SUCCESS'              => ':objectCreated was created successfully!',
    'LOGIN_SUCCESS'                   => 'Login successfully!',
    'LOGOUT_SUCCESS'                  => 'Logout successfully!',
    'MSG_LOGIN_SUCCESS'               => 'Welcome, :attribute !',
    'CODE_NOT_FOUND'                  => '404',
    'DESCRIPTION_NOT_FOUND'           => '404 Not Found',
    'MSG_NOT_FOUND'                   => 'Your request is not found.',

    'CODE_INPUT_FAILED'               => '1001',
    'DESCRIPTION_INPUT_FAILED'        => 'Input validation failed.',
    'MSG_TOKEN_REQUIRED'              => 'The token field is required.',

    
    'CODE_DB_ERROR'                   => '2001',
    'DESCRIPTION_DB_ERROR'            => 'Database error.',
    'MSG_DB_ERROR'                    => 'Database error occured. Please try again later.',
    'CODE_ATTEMPT_LOGIN'              => '2002',
    'DESCRIPTION_ATTEMPT_LOGIN'       => 'Too many login attempts.',
    'MSG_ATTEMPT_LOGIN'               => 'Too many login attempts. Please try again in :attribute seconds.',
    'CODE_AUTHENTICATE_FAILED'        => '2003',
    'DESCRIPTION_AUTHENTICATE_FAILED' => 'Authenticate failed',
    'MSG_AUTHENTICATE_FAILED'         => 'Username or password is invalid.',
    'CODE_TOKEN_INVALID'              => '2004',
    'DESCRIPTION_TOKEN_INVALID'       => 'The token field is invalid.',

];
