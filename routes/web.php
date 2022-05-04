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

Route::get('/', [\App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('/product/{slug}', [\App\Http\Controllers\HomeController::class, 'single'])->name('product.single');
Route::get('/category/{slug}', [\App\Http\Controllers\CategoryController::class, 'index'])->name('category.single');
Route::get('/store/{slug}', [\App\Http\Controllers\StoreController::class, 'index'])->name('store.single');


Route::prefix('cart')->name('cart.')->group(function () {
    Route::get('/', [\App\Http\Controllers\CartController::class, 'index'])->name('index');
    Route::post('/add', [\App\Http\Controllers\CartController::class, 'add'])->name('add');
    Route::get('/remove/{slug}', [\App\Http\Controllers\CartController::class, 'remove'])->name('remove');
    Route::get('/cancel', [\App\Http\Controllers\CartController::class, 'cancel'])->name('cancel');
});

Route::prefix('checkout')->name('checkout.')->group(function () {
    //
    Route::get('/', [\App\Http\Controllers\CheckoutController::class, 'index'])->name('index');
    Route::post('/process', [\App\Http\Controllers\CheckoutController::class, 'process'])->name('process');
    Route::get('/thanks', [\App\Http\Controllers\CheckoutController::class, 'thanks'])->name('thanks');
});
// Route::get('/', function () {
//     return view('welcome');
// })->name('home');

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth'])->name('dashboard');



Route::middleware(['auth','access.control.store.admin'])->group(function () {
    Route::get('my-orders', [\App\Http\Controllers\UserOrderController::class, 'index'])->name('user.orders');

    Route::prefix('admin')->name('admin.')->group(function () {
        Route::get('notifications', [\App\Http\Controllers\Admin\NotificationController::class, 'notifications'])->name('notifications.index');
        Route::get('notifications/read-all', [\App\Http\Controllers\Admin\NotificationController::class, 'readAll'])->name('notifications.readAll');
        Route::get('notifications/read/{notification}', [\App\Http\Controllers\Admin\NotificationController::class, 'read'])->name('notifications.read');
        Route::resource('stores', \App\Http\Controllers\Admin\StoreController::class); //->middleware('user.has.store')->only(['create', 'store']); //->middleware(['auth']);
        Route::resource('products', \App\Http\Controllers\Admin\ProductController::class);
        Route::resource('categories', \App\Http\Controllers\Admin\CategoryController::class);

        Route::post('photos/remove', [App\Http\Controllers\Admin\ProductPhotoController::class, 'removePhoto'])->name('photo.remove');
        Route::get('/orders/my', [App\Http\Controllers\Admin\OrderController::class, 'index'])->name('orders.my');
    });
});

Route::get('notifications', function(){
$user = App\Models\User::find(1);

$user->notify(new App\Notifications\StoreReceiveNewOrder());

// $notification = $user->notifications->first();
// $notification->markAsRead();
// return $user->unreadNotifications->count();
$storesIds = [3,27,40];

$stores = \App\Models\Store::whereIn('id', $storesIds)->get();

// return $stores->each(function($store){
//     return $store->user;
// });

// return $stores->map(function($store){
//     return get_class($store->user);
// });

return $stores->map(function($store){
    return $store->user;
})->each->notify(new \App\Notifications\StoreReceiveNewOrder());
//return $user->unreadNotifications;
});

require __DIR__ . '/auth.php';
