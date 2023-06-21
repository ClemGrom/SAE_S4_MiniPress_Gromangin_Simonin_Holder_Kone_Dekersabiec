<?php

namespace minipress\app\services;

use minipress\app\models\Article;

class ArticleService
{
    public static function createArticle(array $data): Article
    {
        $article = new Article();
        $article->titre = $data['titre'];
        $article->resume = $data['resume'];
        $article->contenu = $data['contenu'];
        $article->date_crea = date('Y-m-d H:i:s');
        $article->categ_id = $data['categorie'];
        $article->save();
        return $article;
    }

    public static function addImage(string $id, string $image): void
    {
        if ($image != null) {
            $article = Article::findOrFail($id);
            $article->images()->attach($image);
        }
    }
}