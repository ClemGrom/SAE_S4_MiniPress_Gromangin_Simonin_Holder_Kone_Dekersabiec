<?php

namespace minipress\api\action;

use minipress\api\services\CategorieServices;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

class GetCategoriesApiAction
{
    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {

        $cs = new CategorieServices();
        $categories = $cs->getCategories();

        $categories_api = [];
        foreach ($categories as $categorie) {
            $categories_api[] = [
                'id' => $categorie['id'],
                'titre' => $categorie['titre'],
                'description' => $categorie['description'],
            ];
        }

        $rs->getBody()->write(json_encode($categories_api));
        return $rs
            ->withHeader('Access-Control-Allow-Origin', 'http://localhost:20004')
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(200);
    }
}
