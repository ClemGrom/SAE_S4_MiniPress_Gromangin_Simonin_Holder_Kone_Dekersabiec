<?php

namespace minipress\api\services;

use minipress\api\models\Article;

class ArticleServices
{
    public function getArticles()
    {
        $articles = Article::all();
        return $articles->toArray();
    }

    public function getArticleID($id)
    {
        $article = Article::find($id);
        return $article->toArray();
    }

}
