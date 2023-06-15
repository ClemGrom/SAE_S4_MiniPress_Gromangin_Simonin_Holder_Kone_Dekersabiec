<?php

namespace minipress\api\action;

use minipress\api\services\AuthorServices;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

class GetArticlesAuthorApiAction
{
    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $as = new AuthorServices();
        $a = $as->getAuthorID($args['id']);
        $articles = $a->articles()->get();

        $articles_api = [];
        foreach ($articles as $article) {
            $articles_api[] = [
                'id' => $article['id'],
                'titre' => $article['titre'],
                'auteur' => $article['author_id'],
                'date' => $article['date'],
                'href' => '/articles/' . $article['id']
            ];
        }

        $author_api = [
            'id' => $a['id'],
            'email' => $a['email'],
            'username' => $a['username'],
            'articles' => $articles_api
        ];

        $rs->getBody()->write(json_encode($author_api));
        return $rs->withHeader('Content-Type', 'application/json')->withStatus(200);

    }
}
