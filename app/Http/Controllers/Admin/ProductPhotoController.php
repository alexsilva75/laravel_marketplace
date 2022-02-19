<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ProductPhoto;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProductPhotoController extends Controller
{
    //

    public function removePhoto(Request $request)
    {
        $photoName = $request->get('photoName');

        if (Storage::disk('public')->exists($photoName)) {
            Storage::disk('public')->delete($photoName);
        }

        $removedPhoto = ProductPhoto::where('image', $photoName);
        $productId = $removedPhoto->first()->product_id;
        $removedPhoto->delete();



        flash('Image removida com sucesso!')->success();



        return redirect()->route('admin.products.edit', ['product' => $productId]);
    }
}
