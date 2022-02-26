<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    //
    private $product;

    public function __construct(Product $product)
    {
        $this->product = $product;
    }

    public function index()
    {
        $products = $this->product->limit(6)->orderBy('id', 'DESC')->get();
        // $products = $this->product->limit(6)->orderBy('id', 'DESC')->paginate(6);
        //$categories = \App\Models\Category::all(['name', 'slug']);
        $stores = \App\Models\Store::limit(3)->get();
        return view('welcome', compact('products', 'stores'));
    }

    public function single($slug)
    {
        $product = $this->product->whereSlug($slug)->first();
        return view('single', compact('product'));
    }

    public function cartAdd()
    {
    }
}
