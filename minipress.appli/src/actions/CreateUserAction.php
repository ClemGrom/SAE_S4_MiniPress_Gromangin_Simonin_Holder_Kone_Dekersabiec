<?php

namespace minpress\appli\action;

use minipress\appli\services\AuthorServices;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Log\InvalidArgumentException;
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



    public function checkPasswordStrength(string $pass): bool {

        $digit = preg_match("#[\d]#", $pass); // au moins un digit
        $special = preg_match("#[\W]#", $pass); // au moins un car. spécial
        $lower = preg_match("#[a-z]#", $pass); // au moins une minuscule
        $upper = preg_match("#[A-Z]#", $pass); // au moins une majuscule
        if ( !$digit || !$special || !$lower || !$upper)return false;
        return true;

    }

    public function CreateUser(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
    {
        //recupere donnees post
        if (strlen($args['password']) < 10) {
            throw new InvalidArgumentException('Le mot de passe doit contenir au moins 10 caractères');
        }

        if (checkPasswordStrength($args['password']) == false) {
            throw new InvalidArgumentException('Le mot de passe doit contenir au moins une majuscule, une minuscule, un chiffre et un caractère spécial');
        }

    }

}