<?php

namespace minipress\app\services;

use minipress\app\models\Article;

class ArticleService
{

    public function getArticles(){
        return Article::all()->toArray();
    }

    public function getArticlesByCategory($categoryId)
    {
        if ($categoryId) {
            return Article::where('categ_id', $categoryId)->get()->toArray();
        } else {
            return Article::all()->toArray();
        }
    }
    
    public static function createArticle(array $data): void
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