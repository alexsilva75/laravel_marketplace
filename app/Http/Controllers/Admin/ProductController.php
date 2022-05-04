<?php

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\ProductRequest;
use App\Models\Product;
use App\Traits\UploadTrait;

class ProductController extends Controller
{
    use UploadTrait;

    private $product;

    public function __construct(Product $product)
    {
        $this->product = $product;
    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $userStore = auth()->user()->store;
        if (!auth()->user()->store()->exists()) {
            flash('É preciso criar uma loja para cadastrar produtos.')->warning();
            return redirect()->route('admin.stores.index');
        } else {
            $products = $userStore->products()->paginate(10);
        }
        return view('admin.products.index', compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        $categories = \App\Models\Category::all(['id', 'name']);

        return view('admin.products.create', compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ProductRequest $request)
    {
        //



        $data = $request->all();

        $store = auth()->user()->store; //\App\Models\Store::find($data['store']);
        $product = $store->products()->create($data);


        $categories = $request->get('categories', null);

        $product->categories()->sync($categories); //->sync($data['categories']);

        if ($request->hasFile('photos')) {
            $images = $this->imageUpload($request, 'photos', 'products', 'image');

            $product->photos()->createMany($images);
        }

        flash('Produto cadastrado com sucesso!')->success();
        return redirect()->route('admin.products.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $product = $this->product->findOrFail($id);

        $categories = \App\Models\Category::all(['id', 'name']);

        return view('admin.products.edit', compact('categories', 'product'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(ProductRequest $request, $id)
    {
        //

        $data = $request->all();

        $product = $this->product->findOrFail($id);

        $product->update($data);

        $categories = $request->get('categories', null);

        if (!is_null($categories)) {
            $product->categories()->sync($categories);
        }
        //$product->categories()->sync($data['categories']);

        if ($request->hasFile('photos')) {
            $images = $this->imageUpload($request,  'photos', 'products', 'image');

            $product->photos()->createMany($images);
        }
        flash('Produto alterado com sucesso!')->success();
        return redirect()->route('admin.products.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $product = $this->product->findOrFail($id);
        $product->delete($id);
        flash('Produto removido com sucesso!')->success();
        return redirect()->route('admin.products.index');
    }
}
