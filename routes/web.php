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
})->name('home');

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth'])->name('dashboard');



Route::middleware(['auth'])->group(function () {
    Route::prefix('admin')->name('admin.')->group(function () {

        Route::resource('stores', \App\Http\Controllers\Admin\StoreController::class); //->middleware('user.has.store')->only(['create', 'store']); //->middleware(['auth']);
        Route::resource('products', \App\Http\Controllers\Admin\ProductController::class);
    });
});

require __DIR__ . '/auth.php';
