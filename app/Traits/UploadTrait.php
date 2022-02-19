<?php

namespace App\Traits;

use Illuminate\Http\Request;

trait UploadTrait
{
    private function imageUpload(Request $request,  $imageRequestParam, $folder, $imageColumn = null)
    {
        $images = $request->file($imageRequestParam);

        if (is_array($images)) {

            $uploadedImages = [];
            foreach ($images as $image) {
                if (!is_null($imageColumn)) {

                    $uploadedImages[] =  [$imageColumn => $image->store($folder, 'public')];
                } else {
                    $uploadedImages[] = $image->store($folder, 'public');
                }
            }
        } else {
            if (!is_null($imageColumn)) {

                $uploadedImages =  [$imageColumn => $images->store($folder, 'public')];
            } else {
                $uploadedImages =  $images->store($folder, 'public');
            }
        }
        return $uploadedImages;
    }
}
