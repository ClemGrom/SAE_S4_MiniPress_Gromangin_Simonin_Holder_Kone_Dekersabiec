<?php

namespace minipress\api\action\articles;

use minipress\api\services\CategorieServices;
use Psr\Http\Message\ResponseInterface;

class GetArticlesCategoryApiAction
{
    public function __invoke(ResponseInterface $rs, array $args): ResponseInterface
    {

        $cs = new CategorieServices();
        $c = $cs->getCategorieID($args['id']);
        $articles = $c->articles()->get();

        $categorie_api = [
            'categorie' => [],
            'articles' => []
        ];

        $categorie_api['categorie'][] = [
            'id' => $c['id'],
            'titre' => $c['titre'],
            'description' => $c['description'],
        ];

        foreach ($articles as $article) {
            $categorie_api['articles'][] = [
                'id' => $article['id'],
                'titre' => $article['titre'],
                'auteur' => $article['author_id'],
                'date' => $article['date_crea'],
                'href' => '/articles/' . $article['id']
            ];
        }


        $rs->getBody()->write(json_encode($categorie_api));
        return $rs
            ->withHeader('Access-Control-Allow-Origin', '*')
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(200);

    }
}