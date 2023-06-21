<?php

namespace minpress\appli\action;

use minipress\app\actions\Action;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Slim\Views\Twig;

class ConnectAction extends Action
{
    public function __invoke(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
    {
        return Twig::fromRequest($request)->render($response, 'Auth.twig');
    }
}