<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductPhoto extends Model
{
    use HasFactory;

    protected $table = 'products_photos';
    protected $fillable = [

        'image',
        'featured',
    ];


    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
