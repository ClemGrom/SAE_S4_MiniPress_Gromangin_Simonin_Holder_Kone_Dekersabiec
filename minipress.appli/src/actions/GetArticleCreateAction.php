<?php

namespace minipress\app\actions;

use minipress\app\services\CategorieService;
use minipress\app\services\ImageService;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Slim\Views\Twig;

class GetArticleCreateAction extends Action
{
    public function __invoke(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
    {
        $cs = new CategorieService();
        $c = $cs->getCategories();

        $is = new ImageService();
        $images = $is->getImages();

        return Twig::fromRequest($request)->render($response, 'ArticleCreateForm.twig', ['categories' => $c,
            'images' => $images]);
    }
}