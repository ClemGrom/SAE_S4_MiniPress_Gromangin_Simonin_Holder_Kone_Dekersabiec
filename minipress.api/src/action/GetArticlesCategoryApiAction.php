<?php

namespace minipress\api\action;

use minipress\api\services\CategorieServices;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

class GetArticlesCategoryApiAction
{
    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $cs = new CategorieServices();
        $c = $cs->getCategorieID($args['id']);
        $articles = $c->articles()->get();

        $articles_api = [
            'articles' => [],
            'categorie' => []
        ];

        foreach ($articles as $article) {
            $articles_api['articles'][] = [
                'id' => $article['id'],
                'titre' => $article['titre'],
                'auteur' => $article['author_id'],
                'date' => $article['date'],
                'href' => '/articles/' . $article['id']
            ];
        }

        $categorie_api['categorie'][] = [
            'id' => $c['id'],
            'titre' => $c['titre'],
            'description' => $c['description'],
            'articles' => $articles_api
        ];

        $rs->getBody()->write(json_encode($categorie_api));
        return $rs
            ->withHeader('Access-Control-Allow-Origin', 'http://localhost:20004')
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(200);

    }
}