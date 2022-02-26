<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
        \PagSeguro\Library::initialize();
        \PagSeguro\Library::cmsVersion()->setName("MarketplaceL8")->setRelease("1.0.0");
        \PagSeguro\Library::moduleVersion()->setName("MarketplaceL8")->setRelease("1.0.0");

        $categories = \App\Models\Category::all(['name', 'slug']);
        // view()->share('categories', $categories);
        // view()->composer(['welcome', 'single'], function ($view) use ($categories) {
        //     $view->with('categories', $categories);
        // });

        // view()->composer('*', function ($view) use ($categories) {
        //     $view->with('categories', $categories);
        // });

        //view()->composer('*', \App\Http\Views\CategoryViewComposer::class);
    }
}
