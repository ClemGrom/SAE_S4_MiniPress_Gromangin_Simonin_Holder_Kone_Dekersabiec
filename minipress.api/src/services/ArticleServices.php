<?php

namespace minipress\api\action;

use minipress\api\models\Article;

class GetCategoriesActionApi
{
    public function getArticles()
    {
        $articles = Article::all();
        return $articles->toArray();
    }

    public function getArticle($id)
    {
        $article = Article::find($id);
        return $article->toArray();
    }

}
