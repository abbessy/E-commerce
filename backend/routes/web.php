<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

    //admin register
    $router->post('/adminRegister', 'AdminController@adminRegister');

    //admin login
    $router->post('/adminLogin', 'AdminController@adminLogin');

    //user register
    $router->post('/register', 'UserController@register');

    //user login
    $router->post('/login', 'UserController@login');


//GROUPING when you are authenticated :
//--------
$router->group(["middleware"=>'auth'],function ($router){

    // Show ALL products
    $router->get('/products', 'ProductController@index');

    //show Each Product By ID
    $router->get('/products/{id}', 'ProductController@show');

    //Add a item to cart
    $router->post('/addtocart', 'ProductController@addToCart');

    //Get the number of items in cart per user
    $router->get('/itemCounter', 'ProductController@cartItemCounter');

    //Get the list of items in cart per user
    $router->get('/cartlist', 'ProductController@getCartLists');

    //Delete an item from cart
    $router->delete('/items/delete/{id}', 'ProductController@destroyItem');

    //items price 
    $router->get('/items/ordernowprice', 'ProductController@orderNowPrice');

    //order place 
    $router->post('/items/orderplace', 'ProductController@orderPlace');

    //get the list of orders 
    $router->get('/items/orders', 'ProductController@getOrders');

});
    
//GROUPING when auth as ADMIN:

$router->group(["middleware"=>['auth', 'admin']],function ($router){

    //create products
    $router->post('/products/create', 'ProductController@store');

    //update products
    $router->post('/products/update/{id}', 'ProductController@update');

    //Delete products
    $router->delete('/products/delete/{id}', 'ProductController@destroy');

    // Show ALL Users
    $router->get('/users', 'UserGesController@getAllUsers');

    //show Each User By ID
    $router->get('/users/{id}', 'UserGesController@showUser');

    //create users
    $router->post('/users/create', 'UserGesController@storeUser');

    //update users
    $router->post('/users/update/{id}', 'UserGesController@updateUser');

    //Delete users
    $router->delete('/users/delete/{id}', 'UserGesController@destroyUser');

});

    

//get user by access_token
$router->get('/user', 'UserController@user');

$router->get('/', function () use ($router) {
    return $router->app->version();
    
});