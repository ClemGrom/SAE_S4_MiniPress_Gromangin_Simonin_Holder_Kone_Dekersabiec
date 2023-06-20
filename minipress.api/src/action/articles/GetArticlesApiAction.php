<?php

namespace minipress\api\action\articles;

use minipress\api\services\ArticleServices;
use Psr\Http\Message\ResponseInterface;

class GetArticlesApiAction
{
    public function __invoke(ResponseInterface $rs, array $args): ResponseInterface
    {

        $as = new ArticleServices();
        $articles = $as->getArticles($_GET['sort'] ?? null);

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
        return $rs
            ->withHeader('Access-Control-Allow-Origin', '*')
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(200);
    }
}
