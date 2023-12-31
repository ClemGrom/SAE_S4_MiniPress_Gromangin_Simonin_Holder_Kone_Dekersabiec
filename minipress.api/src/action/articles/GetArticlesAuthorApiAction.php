<?php

namespace minipress\api\action\articles;

use minipress\api\services\AuthorServices;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

/*
 * Classe GetArticlesAuthorApiAction
 * Affiche les informations de tous les articles d'un auteur
 */

class GetArticlesAuthorApiAction
{
    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {

        $as = new AuthorServices();
        $a = $as->getAuthorID($args['id']);
        $articles = $a->articles()->get();

        $author_api = [
            'auteur' => [],
            'articles' => []
        ];

        $author_api['auteur'][] = [
            'id' => $a['id'],
            'email' => $a['email'],
            'username' => $a['username'],
        ];

        foreach ($articles as $article) {
            $author_api['articles'][] = [
                'id' => $article['id'],
                'titre' => $article['titre'],
                'auteur' => $article['author_id'],
                'date' => $article['date_crea'],
                'href' => '/articles/' . $article['id']
            ];
        }


        $rs->getBody()->write(json_encode($author_api));
        return $rs
            ->withHeader('Access-Control-Allow-Origin', '*')
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(200);

    }
}