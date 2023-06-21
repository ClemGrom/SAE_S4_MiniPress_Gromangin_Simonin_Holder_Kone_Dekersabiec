<?php

namespace minpress\appli\action;

use minipress\app\actions\Action;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Slim\Views\Twig;

class CreateUserAction extends Action
{
    public function __invoke(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
    {
        $as = new AuthorServices();
        $a = $as->isAdmin($args['id']);

        if (!$a) {
            throw new UnsufficientRightsException('Vous n\'avez pas les droits pour créer un utilisateur');
        } else {
            return Twig::fromRequest($request)->render($response, 'Connect.twig', [
                'author' => $as->getAuthorID($args['id'])
            ]);

        }

    }


}