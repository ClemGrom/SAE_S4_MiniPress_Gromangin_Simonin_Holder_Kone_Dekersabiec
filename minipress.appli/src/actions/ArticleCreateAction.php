<?php

namespace minipress\app\actions;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface;
use minipress\app\models\Article;
use minipress\app\models\Categorie;
use Slim\Views\Twig;

class ArticleCreateAction extends Action
{
    public function __invoke(ServerRequestInterface $request, Response $response, $args):Response
    {
        return Twig::fromRequest($request)->render($response, 'ArticleCreateForm.twig');
    }
}