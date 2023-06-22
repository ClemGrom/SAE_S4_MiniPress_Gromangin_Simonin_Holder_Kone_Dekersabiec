<?php

namespace minipress\api\services;

use minipress\api\models\Image;

/*
 * Classe ImageServices
 */

class ImageServices
{

    /*
     * Function getImagesArticleId
     * @param $articleId
     * @return $images
     * Retourne les images d'un article en fonction de l'id de l'article
     */
    public function getImagesArticleId($articleId)
    {
        $images = Image::whereHas('articles', function ($query) use ($articleId) {
            $query->where('article_id', $articleId);
        })->get();
        return $images;
    }
}