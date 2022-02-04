<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/model', function () {
    // $products = \App\Models\Product::all();

    // return $products;

    // $user = \App\Models\User::find(10);
    // $store = $user->store()->create([
    //     'name' => 'Loja Teste',
    //     'description' => 'loja Teste de produtos de informatica',
    //     'phone' => '77-7777-7777',
    //     'mobile_phone' => '77-77777-7777',
    //     'slug' => 'loja-teste'
    // ]);



    // $store = \App\Models\Store::find(41);

    // return $store->products()->create([
    //     'name' => 'Notebook Dell',
    //     'description' => 'CORE i5 12GB RAM',
    //     'body' => 'whatever...',
    //     'price' => 7000,
    //     'slug' => 'notebook-dell',
    // ]);

    // $categories = [];

    // $category = \App\Models\Category::create([
    //     'name' => 'Computadores',
    //     'description' => null,
    //     'slug' => 'computadores',

    // ]);

    // array_push($categories, $category);

    // $category = \App\Models\Category::create([
    //     'name' => 'Games',
    //     'description' => null,
    //     'slug' => 'games',

    // ]);
    // array_push($categories, $category);


    // $category = \App\Models\Category::create([
    //     'name' => 'Notebooks',
    //     'description' => null,
    //     'slug' => 'notebooks',

    // ]);
    // array_push($categories, $category);

    $product = \App\Models\Product::find(41);

    $product->categories()->attach([3]);
    $product->categories()->detach([3]);
    // $product->categories()->sync([3]);
    return $product->categories;
});
