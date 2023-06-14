<?php

namespace minipress\app\services;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use miniPress\app\models\Article;
use miniPress\app\models\Categorie;

class ArticleService
{
    public static function createArticle(array $data) : Article
    {
        $article = new Article();
        $article->titre = $data['titre'];
        $article->resume = $data['resume'];
        $article->contenu = $data['contenu'];
        $article->date =  date('Y-m-d H:i:s');   
        $article->save();
        return $article;
    }
}