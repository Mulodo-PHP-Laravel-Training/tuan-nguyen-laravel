<?php 

use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use App\User;

class UserLogoutTest extends TestCase
{

    use DatabaseTransactions;

    /**
     * Test Validate Required.
     *
     * @return void
     */
    public function testValidateRequired()
    {
        $this->get('/api/users/logout', [
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_FAILED'),
                        'description' => trans('api.DESCRIPTION_INPUT_FAILED'),
                        "messages"    => array(                                              
                            array("message" => trans('validation.required', ['attribute' => 'token']) ),                        
                        )                        
                    )                 
             ]);
    }

    /**
     * Test Login Successfully.
     * 
     * @return void
     */
    public function testLoginSuccess()
    {
        // Check username in database
        $user = User::where('username', 'anh.tuan')
                    ->where('password', bcrypt('123456789') )->first();
        if (!$user) {
            // Check username existed
            $user = User::where('username', 'anh.tuan')->first();
            if ($user) {
                // change password
                $user->password = bcrypt('123456789');
                $user->save();
            } else {
                User::create([
                    'username'   => 'anh.tuan',
                    'first_name' => 'Tuan',
                    'last_name'  => 'Nguyen',
                    'email'      => 'anh.tuan@mulodo.com',
                    'password'   => bcrypt('123456789'),            
                ]);                
            }

        }                    
        $this->post('/api/users/login', [
                'username' => 'anh.tuan',
                'password' => '123456789',
            ])
            ->seeJson([                 
                'meta' => array
                    (
                        'code'        => trans('api.CODE_INPUT_SUCCESS'),
                        'description' => trans('api.LOGIN_SUCCESS'),
                        'messages'    => array(
                            array('message' => trans('api.MSG_LOGIN_SUCCESS', ['attribute' => $user['first_name'] . ' ' . $user['last_name'] ]) 
                        )
                    )
                )                 
            ]
        );
    }    

    /**
     * Test Logout Falied, invalid token.
     * 
     * @return void
     */
    
    public function testLogoutFailed()
    {
        $this->get('/api/users/logout?token=f8IKRC6ookhF1DjKTsI0eLYlBnm4tYT9FiAAMtXzObCLApQe3joPI3Mrx3OK')
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_TOKEN_INVALID'),
                        'description' => trans('api.DESCRIPTION_TOKEN_INVALID'),
                        "messages"    => array(                                              
                            array("message" => trans('api.DESCRIPTION_TOKEN_INVALID') )
                        )                        
                    )                 
             ]);
    }    


    /**
     * Test Logout Successfully.
     * 
     * @return void
     */
    
    public function testLogoutSuccess()
    {
        $this->testLoginSuccess();
        $user = User::where('username', 'anh.tuan')->first();
        $this->get('/api/users/logout?token='.$user->remember_token)
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code'        => trans('api.CODE_INPUT_SUCCESS'),
                        'description' => trans('api.LOGOUT_SUCCESS'),
                        "messages"    => array(                                              
                            array("message" => trans('api.LOGOUT_SUCCESS') )
                        )                        
                    )                 
             ])
            ->seeInDatabase('users', 
                [
                    'username' => 'anh.tuan',
                    'remember_token' => '',
                ]
            );
    }    



}
