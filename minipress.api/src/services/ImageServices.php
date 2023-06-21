<?php

namespace minipress\api\services;

use minipress\api\models\Image;

class ImageServices
{
//récupère les images associées à un article en passant par la table pivot image2article
    public function getImagesArticleId($articleId)
    {
        $images = Image::whereHas('articles', function ($query) use ($articleId) {
            $query->where('article_id', $articleId);
        })->get();
        return $images;
    }
}