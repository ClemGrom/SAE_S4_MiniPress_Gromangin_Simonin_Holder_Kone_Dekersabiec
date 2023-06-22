<?php

namespace minipress\app\actions;

use minipress\app\services\CategorieService;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Slim\Views\Twig;


class GetAllCategoriesAction extends Action
{
    public function __invoke(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
    {
        $articleService = new CategorieService();
        $categories = $articleService->getCategories();

        return Twig::fromRequest($request)->render($response, 'AllCategories.twig', ['categories' => $categories]);
    }
}