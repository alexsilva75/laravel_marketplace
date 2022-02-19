<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CartController extends Controller
{
    //
    public function index()
    {
        //
        $cart = session()->has('cart') ? session()->get('cart') : [];
        return view('cart', compact('cart'));
    }

    public function add(Request $request)
    {
        $product = $request->get('product');

        if (session()->has('cart')) {
            $products = session()->get('cart');
            $productsSlugs = array_column($products, 'slug');

            if (in_array($product['slug'], $productsSlugs)) {
                $newProducts = $this->productIncrement($product['slug'], $product['amount'], $products);
                session()->put('cart', $newProducts);
            } else {
                session()->push('cart', $product);
            }
        } else {
            $products[] = $product;
            session()->put('cart', $products);
        }

        flash('Produto adicionado no carrinho!')->success();
        return redirect()->route('product.single', ['slug' => $product['slug']]);
    }

    public function remove($slug)
    {

        if (!session()->has('cart')) {
            return redirect()->route('cart.index');
        }

        $products = session()->get('cart');

        $products = array_filter($products, function ($p) use ($slug) {
            return $p['slug'] != $slug;
        });

        session()->put('cart', $products);
        return redirect()->route('cart.index');
    }


    public function cancel()
    {
        //
        session()->forget('cart');
        flash('Compra cancelada.')->success();
        return redirect()->route('cart.index');
    }


    private function productIncrement($slug, $amount, $receivedProducts)
    {
        $newProducts = array_map(function ($product) use ($slug, $amount) {
            if ($slug  == $product->slug) {
                $product['amount'] += $amount;
            }
            return $product;
        }, $receivedProducts);

        return $newProducts;
    }
}
