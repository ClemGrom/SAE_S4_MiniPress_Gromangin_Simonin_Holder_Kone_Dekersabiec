<?php

namespace minpress\appli\action;

use minipress\appli\services\AuthorServices;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

class ConnectAction {
    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        return Twig::fromRequest($rq)->render($rs, 'Auth.twig');
    }
}