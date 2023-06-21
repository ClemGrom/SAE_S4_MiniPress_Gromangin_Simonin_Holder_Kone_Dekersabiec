<?php

namespace minipress\api\action\images;

use minipress\api\services\ImageServices;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

class GetImagesArticlesAction
{
    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $is = new ImageServices();
        $images = $is->getImagesArticleId($args['id']);

        $images_api['images'] = [];

        foreach ($images as $image) {
            $images_api['images'][] = [
                'image_url' => $image['image_url'],
                'article_id' => $image['article_id'],
            ];
        }

        $rs->getBody()->write(json_encode($images_api));
        return $rs
            ->withHeader('Access-Control-Allow-Origin', '*')
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(200);

    }
}