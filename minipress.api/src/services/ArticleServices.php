<?php

namespace minipress\api\services;

use minipress\api\models\Article;

class ArticleServices
{
    public function getArticles()
    {
        return Article::all()->toArray();
    }

    public function getArticleID($id)
    {
        return Article::find($id)->toArray();
    }
}
