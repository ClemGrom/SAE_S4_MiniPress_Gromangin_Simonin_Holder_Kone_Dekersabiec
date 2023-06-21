<?php

namespace minipress\appli\actions;

use minipress\app\actions\Action;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface;
use Slim\Views\Twig;

class ArticleCreateAction extends Action
{
    public function __invoke(ServerRequestInterface $request, Response $response, array $args): Response
    {
        return Twig::fromRequest($request)->render($response, 'ArticleCreateForm.twig');
    }
}