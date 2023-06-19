<?php

namespace minpress\api\action;

use minipress\api\services\AuthorServices;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

class CreateUserAction {
    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $as = new AuthorServices();
        $a = $as->isAdmin($args['id']);

        if ($a == false) {
            throw new UnsufficientRightsException('Vous n\'avez pas les droits pour créer un utilisateur');
        } else {
            $rs->getBody()->write(json_encode($as->getAuthorID($args['id'])));
            return $rs
                ->withHeader('Access-Control-Allow-Origin', '*')
                ->withHeader('Content-Type', 'application/json')
                ->withStatus(200);
        }

    }


}