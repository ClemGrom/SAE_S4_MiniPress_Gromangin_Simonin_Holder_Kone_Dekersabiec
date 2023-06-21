<?php

namespace minipress\app\actions;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Views\Twig;


class HomeAction extends Action
{
    public function __invoke(Request $request, Response $response, $args): Response
    {
        return Twig::fromRequest($request)->render($response, 'Home.twig');
    }
}
