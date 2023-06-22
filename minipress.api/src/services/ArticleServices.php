<?php

namespace minipress\api\services;

use minipress\api\models\Article;

/*
 * Class ArticleServices
 */

class ArticleServices
{

    /*
     * Function getArticles
     * @param $sort
     * @return array
     * Retourne tous les articles sous forme de tableau qui peut être trié par date ou par auteur
     */
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
                return $a['author_id'] <=> $b['author_id'];
            });
        }
        return $a;
    }

    /*
     * Function getArticleID
     * @param $id
     * @return array
     * Retourne un article en fonction de son id sous forme de tableau
     */
    public function getArticleID($id)
    {
        return Article::find($id)->toArray();
    }
}
