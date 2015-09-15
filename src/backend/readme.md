# [Skill me up] Mini Blog API - Tuan Nguyen

Mini Blog is small app written by Laravel 5.1. It's very simple app with 3 modules: users, posts, comments.

## Installation

1.Please install Laravel/Homestead before download this app.

2.Please create virtual host name api.app and edit hometead config file homestead.yaml:

    sites:
    - map: api.app
    to: /home/vagrant/Code/miniblog/src/backend/laravel/public

3.Create db : blog with below information:

    DB   : blog
    User : homestead
    Pass : secret

4.Run cmd migrate to create and insert databse:

    $ php artisan migrate
    $ php artisan db:seed

## Usage

1. User Module:

1.1 Create User:

    Method: POST
    Link  : http://api.app/api/users
    Params:
      + username: anh.tuan
      + password: 123456
      + first_name: Tuan
      + last_name: Nguyen
      + email: anh.tuan@mulodo.com
1.2 Login User:

    Method: PUT
    Link: http://api.app/api/users/login
    Params:
      + username: anh.tuan
      + password: 123456

1.3 Logout User:

    Method: PUT
    Link: http://api.app/api/users/logout
    Params: 
      token: Gb1AKNWBgkxLeiedPK4ktYKP9aQW8xi6iHJjmEsihNxjRBVpZ06P9N2eMGcn
      
1.4 Get User Info:
Get self user info :

    Method: GET
    Link: http://api.app/api/users/self/?token=AO9k97YN58rGHmmTprClNKfXlpUCaGTO7pixyeSOfn40OXPqpc95mdQCszDy

Get other user info:

    Method: GET
    Link: http://api.app/api/users/{id}/?token=AO9k97YN58rGHmmTprClNKfXlpUCaGTO7pixyeSOfn40OXPqpc95mdQCszDy

1.5 Update User Info:

    Method: PUT
    Link: http://api.app/api/users/{$id}
    Params:
      + username: anh.tuan2
      + password: 123456
      + first_name: Tung
      + last_name: Lam
      + email: anh.tuan2@mulodo.com
      
1.6 Change password:

    Method: PUT
    Link : http://api.app/api/users/password
    Params:
      + token: xxxxxx
      + old_password: 123456
      + new_password: 123456789

1.7 Search user by name:

    Method: GET
    Link: http://api.app/api/users?name=abc

2. Post Module:

2.1 Create Post:

    Method: POST
    Link: http://api.app/api/posts
    Params: 
      + token: xxxxx
      + title: 'Test post',
      + content: 'This is post content',
      + status: 1,
      + image
    
2.2 Active/Deactive Post:

    Method: PUT
    Link active post: http://api.app/api/posts/{id}/active
    Link deative post: http://api.app/api/posts/{id}/deactive
    Params:
      + token: xxxx

2.3 Edit post:

    Method: PUT
    Link: http://api.app/api/posts/{id}
    Params:
      + token: xxxx
      + title: 'Test post',
      + content: 'Edit post content',
      + status: 1
      
2.4 Delete post:

    Method: DELETE
    Link: http://api.app/api/posts/{id}
    Params:
      + token: xxxxxx
      
2.5 Get all post:

    Method: GET
    Link: http://api.app/api/posts
    
2.6 Get all posts for user:

    Method: GET
    Link: http://api.app/api/users/{id}/posts
    

## Contributing

## History

Version 1.10
