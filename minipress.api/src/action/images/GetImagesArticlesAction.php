<?php

namespace minipress\api\action\images;

use minipress\api\services\ImageServices;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

/*
 * Classe GetImagesArticlesAction
 * Affiche les informations de l'image d'un article
 */

class GetImagesArticlesAction
{
    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $is = new ImageServices();
        $images = $is->getImagesArticleId($args['id']);

        $images_api['images'] = [];

        foreach ($images as $image) {
            $images_api['images'][] = [
                'id' => $image['id'],
                'url' => $image['url'],
            ];
        }

        $rs->getBody()->write(json_encode($images_api));
        return $rs
            ->withHeader('Access-Control-Allow-Origin', '*')
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(200);

    }
}