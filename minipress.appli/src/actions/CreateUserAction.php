<?php

namespace minpress\appli\action;

use minipress\appli\services\AuthorServices;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Slim\Views\Twig;
use minipress\appli\services\AuthorService;

class CreateUserAction extends Action
{
    public function __invoke(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
    {
        $as = new AuthorService();
        $id = $_SESSION['id'];
        $a = $as->isAdmin($id);

        if (!$a) {
            throw new UnsufficientRightsException('Vous n\'avez pas les droits pour créer un utilisateur');
        } else {
            return Twig::fromRequest($request)->render($response, 'Connect.twig', [
                'author' => $as->getAuthorID($args['id'])
            ]);

        }

    }


}