<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Store;
use App\Http\Requests\StoreRequest;
use App\Traits\UploadTrait;
use Illuminate\Support\Facades\Storage;

class StoreController extends Controller
{
    //

    use UploadTrait;

    public function __construct()
    {
        $this->middleware('user.has.store')->only(['create', 'store']);
    }

    public function index()
    {
        $store = auth()->user()->store;

        return view('admin.stores.index', ['store' => $store]);
    }

    public function create()
    {

        $users = \App\Models\User::all(['id', 'name']);

        return view('admin.stores.create', compact('users'));
    }


    public function store(StoreRequest $request)
    {
        $data = $request->all();
        $user = auth()->user(); //\App\Models\User::find($data['user']);

        if ($request->hasFile('logo')) {
            $data['logo'] = $this->imageUpload($request, 'logo', 'stores');
        }

        $store = $user->store()->create($data);
        flash('Loja criada com sucesso!')->success();
        return redirect()->route('admin.stores.index');
    }

    public function edit($store)
    {
        $store = Store::find($store);

        return view('admin.stores.edit', compact('store'));
    }

    public function update(StoreRequest $request, $store)
    {

        $data = $request->all();
        $store = \App\Models\Store::find($store);



        if ($request->hasFile('logo')) {
            if (Storage::disk('public')->exists($store->logo)) {
                Storage::disk('public')->delete($store->logo);
            }
            $data['logo'] = $this->imageUpload($request, 'logo', 'stores');
        }

        $store->update($data);

        flash('Loja atualizada com sucesso!')->success();
        return redirect()->route('admin.stores.index');
    }

    public function destroy($store)
    {
        $store = \App\Models\Store::find($store);
        $store->delete();

        // return redirect('/admin/stores');
        flash('Loja removida com sucesso!')->success();
        return redirect()->route('admin.stores.index');
    }
}
