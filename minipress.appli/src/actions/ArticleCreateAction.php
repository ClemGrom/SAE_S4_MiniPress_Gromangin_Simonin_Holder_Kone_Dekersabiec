<?php

namespace minipress\app\actions;

use minipress\app\services\CategorieService;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Slim\Views\Twig;

class ArticleCreateAction extends Action
{
    public function __invoke(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
    {
        $cs = new CategorieService();
        $c = $cs->getCategories();

        return Twig::fromRequest($request)->render($response, 'ArticleCreateForm.twig', ['categories' => $c]);
    }
}