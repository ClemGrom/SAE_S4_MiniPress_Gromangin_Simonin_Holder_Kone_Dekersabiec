<?php

namespace minipress\api\action;

use minipress\api\services\ArticleServices;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

class GetArticleApiAction
{
    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $as = new ArticleServices();
        $a = $as->getArticle($args['id']);

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
        return $rs->withHeader('Content-Type', 'application/json')->withStatus(200);
    }

}
