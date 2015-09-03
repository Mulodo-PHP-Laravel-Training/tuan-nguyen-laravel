<?php 
use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Foundation\Testing\DatabaseMigrations;

class CreateUserTest extends TestCase
{
    //use DatabaseMigrations;
    /**
     * Test Validate Required.
     *
     * @return void
     */
    public function testValidateRequired()
    {

        $this->post('/v1/users', [
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code' => 1001,
                        'description' => 'Input validation failed.',
                        "messages" => array(                                              
                            array("message" => "The username field is required."),                        
                            array("message" => "The email field is required."),
                            array("message" => "The first name field is required."),
                            array("message" => "The last name field is required."),
                            array("message" => "The password field is required."),                            
                        )                        
                    )                 
             ]);
    }

    /**
     * Test Validate Min Character.
     * username: min 3, password: min 6
     * @return void
     */
    public function testValidateMin()
    {

        $this->post('/v1/users', [
                'username' => 'ab',
                'first_name' => 'Ronan',
                'last_name'  => 'Tuan',
                'email'      => 'anh.tuan3@mulodo.com',
                'password'   => '12345',
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code' => 1001,
                        'description' => 'Input validation failed.',
                        "messages" => array(                                              
                            array("message" => "The username must be at least 3 characters."),                        
                            array("message" => "The password must be at least 6 characters."),
                        )                        
                    )                 
             ]);
    }    

    /**
     * Test Validate Max Character.
     * username,first_name,last_name,email: max 50, password: min 6
     * @return void
     */
    public function testValidateMax()
    {

        $this->post('/v1/users', [
                'username' => 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                'first_name' => 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                'last_name'  => 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                'email'      => 'abaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@mulodo.com',
                'password'   => '123456',
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code' => 1001,
                        'description' => 'Input validation failed.',
                        "messages" => array(                                              
                            array("message" => "The first name may not be greater than 50 characters."),                        
                            array("message" => "The last name may not be greater than 50 characters."),
                            array("message" => "The username may not be greater than 50 characters."),
                            array("message" => "The email may not be greater than 50 characters."),
                            array("message" => "The email must be a valid email address.")
                        )                        
                    )                 
             ]);
    }    

    /**
     * Test Validate Max Character.
     * username,first_name,last_name,email: max 50, password: min 6
     * @return void
     */
    public function testValidateEmail()
    {

        $this->post('/v1/users', [
                'username' => 'abcdef',
                'first_name' => 'Ronan',
                'last_name'  => 'Tuan',
                'email'      => 'anh.tuan3.ds.sd.sd.sd.sd.@mulodo.com',
                'password'   => '123456',
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code' => 1001,
                        'description' => 'Input validation failed.',
                        "messages" => array(                                              
                            array("message" => "The email must be a valid email address.")
                        )                        
                    )                 
             ]);
    }    


    /**
     * Test Validate Unique.
     * Unique fields: username,email
     * @return void
     */
    public function testValidateUnique()
    {

        $this->post('/v1/users', [
                'username' => 'anh.tuan',
                'first_name' => 'Ronan',
                'last_name'  => 'Tuan',
                'email'      => 'anh.tuan@mulodo.com',
                'password'   => '123456',
            ])
             ->seeJson([
                 'data' => null,
                 'meta' => array(
                        'code' => 1001,
                        'description' => 'Input validation failed.',
                        "messages" => array(                                              
                            array("message" => "The email has already been taken."),
                            array("message" => "The username has already been taken.")
                        )                        
                    )                 
             ]);
    }    

    /**
     * Test success create user.
     * @return void
     */
    public function testSuccess()
    {

        $this->post('/v1/users', [
                'username' => 'anh.tuan2',
                'first_name' => 'Ronan',
                'last_name'  => 'Tuan',
                'email'      => 'anh.tuan2@mulodo.com',
                'password'   => '123456',
            ])
             ->seeJson([                 
                 'meta' => array(
                        'code' => 200,
                        'message' => 'Account created success!'                        
                    )                 
             ])
             ->seeInDatabase('users', 
                [
                    'username' => 'anh.tuan2',
                    'email' => 'anh.tuan2@mulodo.com',
                    'first_name' => 'Ronan',
                    'last_name' => 'Tuan',                    
                ]
            );
    }    


}
