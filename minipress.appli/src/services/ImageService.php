<?php

namespace minipress\app\services;

use minipress\app\models\Image;

class ImageService
{
    public function getImages()
    {
        $images = Image::all();
        return $images->toArray();
    }

    public function getImageByID(string $id)
    {
        return Image::findOrFail($id);
    }
}
