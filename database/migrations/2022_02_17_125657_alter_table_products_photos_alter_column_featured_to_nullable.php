<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterTableProductsPhotosAlterColumnFeaturedToNullable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('products_photos', function (Blueprint $table) {
            //
            $table->boolean('featured')->nullable()->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('products_photos', function (Blueprint $table) {
            //
            $table->boolean('featured')->change();
        });
    }
}
