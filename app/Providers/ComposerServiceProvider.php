<?php

namespace App\Providers;

use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class ComposerServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
        // view()->composer('*', \App\Http\Views\CategoryViewComposer::class);
        //view()->composer('layout.front', \App\Http\Views\CategoryViewComposer::class);

        View::composer('layouts.front', \App\Http\Views\CategoryViewComposer::class);
    }
}
