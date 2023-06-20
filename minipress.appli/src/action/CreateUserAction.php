<?php

namespace minpress\appli\action;

use minipress\appli\services\AuthorServices;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

class CreateUserAction {
    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $as = new AuthorServices();
        $a = $as->isAdmin($args['id']);

        if (!$a) {
            throw new UnsufficientRightsException('Vous n\'avez pas les droits pour créer un utilisateur');
        } else {
            return Twig::fromRequest($rq)->render($rs, 'Connect.twig', [
                'author' => $as->getAuthorID($args['id'])
            ]);

        }

    }


}