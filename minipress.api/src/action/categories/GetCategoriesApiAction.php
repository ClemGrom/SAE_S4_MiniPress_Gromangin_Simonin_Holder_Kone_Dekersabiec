<?php

namespace minipress\api\action\categories;

use minipress\api\services\CategorieServices;
use Psr\Http\Message\ResponseInterface;

class GetCategoriesApiAction
{
    public function __invoke(ResponseInterface $rs, array $args): ResponseInterface
    {

        $cs = new CategorieServices();
        $categories = $cs->getCategories();

        $categories_api = [
            'categories' => [],
        ];
        foreach ($categories as $categorie) {
            $categories_api['categories'][] = [
                'id' => $categorie['id'],
                'titre' => $categorie['titre'],
                'description' => $categorie['description'],
            ];
        }

        $rs->getBody()->write(json_encode($categories_api));
        return $rs
            ->withHeader('Access-Control-Allow-Origin', '*')
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(200);
    }
}
