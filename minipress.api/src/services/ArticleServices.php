<?php

namespace minipress\api\services;

use minipress\api\models\Article;

class ArticleServices
{
    public function getArticles($sort = null): array
    {
        $a = Article::all()->toArray();
        if ($sort == 'date-asc') {
            usort($a, function ($a, $b) {
                return $a['date_crea'] <=> $b['date_crea'];
            });
        } else if ($sort == 'date-desc') {
            usort($a, function ($a, $b) {
                return $a['date_crea'] <=> $b['date_crea'];
            });
            $a = array_reverse($a);
        } else if ($sort == 'auteur') {
            usort($a, function ($a, $b) {
                return $a['auteur'] <=> $b['auteur'];
            });
        }
        return $a;
    }

    public function getArticleID($id)
    {
        return Article::find($id)->toArray();
    }
}
