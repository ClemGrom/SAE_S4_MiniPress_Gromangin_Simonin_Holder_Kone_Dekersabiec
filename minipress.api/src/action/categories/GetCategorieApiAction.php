<?php

namespace minipress\api\action\categories;

use minipress\api\services\CategorieServices;
use Psr\Http\Message\ResponseInterface;

class GetCategorieApiAction
{
    public function __invoke(ResponseInterface $rs, array $args): ResponseInterface
    {
        $cs = new CategorieServices();
        $c = $cs->getCategorieID($args['id']);

        $categories_api['categories'][] = [
            'id' => $c['id'],
            'titre' => $c['titre'],
            'description' => $c['description'],
        ];

        $rs->getBody()->write(json_encode($categories_api));
        return $rs
            ->withHeader('Access-Control-Allow-Origin', '*')
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(200);

    }
}
