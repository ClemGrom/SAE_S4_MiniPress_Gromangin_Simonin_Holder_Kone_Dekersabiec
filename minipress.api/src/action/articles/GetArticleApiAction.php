<?php

namespace minipress\api\action\articles;

use minipress\api\services\ArticleServices;
use Psr\Http\Message\ResponseInterface;

class GetArticleApiAction
{
    public function __invoke(ResponseInterface $rs, array $args): ResponseInterface
    {
        $as = new ArticleServices();
        $a = $as->getArticleID($args['id']);

        $article = [
            'id' => $a['id'],
            'titre' => $a['titre'],
            'resume' => $a['resume'],
            'contenu' => $a['contenu'],
            'date' => $a['date_crea'],
            'categorie' => $a['categ_id'],
            'auteur' => $a['author_id']

        ];

        $rs->getBody()->write(json_encode($article));
        return $rs
            ->withHeader('Access-Control-Allow-Origin', '*')
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(200);
    }
}
