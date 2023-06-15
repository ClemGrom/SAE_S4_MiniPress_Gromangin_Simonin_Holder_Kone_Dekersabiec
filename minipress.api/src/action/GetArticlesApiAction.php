<?php

namespace minipress\api\action;

use minipress\api\services\ArticleServices;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

class GetArticlesApiAction
{
    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {

        $as = new ArticleServices();
        $articles = $as->getArticles();

        $article_api = [
            'articles' => [],
        ];

        foreach ($articles as $article) {
            $article_api['articles'][] = [
                'id' => $article['id'],
                'titre' => $article['titre'],
                'auteur' => $article['author_id'],
                'date' => $article['date_crea'],
                'href' => '/articles/' . $article['id']
            ];
        }

        $rs->getBody()->write(json_encode($article_api));
        return $rs->withHeader('Content-Type', 'application/json')->withStatus(200);
    }
}
