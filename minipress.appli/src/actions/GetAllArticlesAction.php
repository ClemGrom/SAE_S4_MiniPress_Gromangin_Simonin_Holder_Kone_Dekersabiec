<?php

namespace minipress\app\actions;

use minipress\app\services\ArticleService;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Slim\Views\Twig;


class GetAllArticlesAction extends Action
{
    public function __invoke(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
    {
        $queryParams = $request->getQueryParams();
        $categoryId = isset($queryParams['categorie']) ? $queryParams['categorie'] : null;

        $articleService = new ArticleService();
        $articles = $articleService->getArticlesByCategory($categoryId);

        return Twig::fromRequest($request)->render($response, 'AllArticles.twig', ['articles' => $articles]);
    }
}
