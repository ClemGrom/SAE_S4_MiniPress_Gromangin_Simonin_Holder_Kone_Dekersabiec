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

    public function checkUsernameDB(string $username): bool {

        $user = Utilisateur::where('username', $username)->first();
        if ($user) {
            return false;
        } else {
            return true;
        }
    }

    public function checkEmailDB(string $email): bool {

        $user = Utilisateur::where('email', $email)->first();
        if ($user) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * @throws \Exception
     */
    public function CreateUser(ServerRequestInterface $request, ResponseInterface $response, array &$args): ResponseInterface
    {

        if (strlen($args['password']) < 10) {
            throw new InvalidArgumentException('Le mot de passe doit contenir au moins 10 caractères');
        }

        if (!$this->checkPasswordStrength($args['password'])) {
            throw new InvalidArgumentException('Le mot de passe doit contenir au moins une majuscule, une minuscule, un chiffre et un caractère spécial');
        }

        if (strlen($args['username']) < 3) {
            throw new InvalidArgumentException("L'username doit contenir au moins 3 caractères.");
        }

        if (!$this->checkUsernameDB($args['username'])) {
            throw new InvalidArgumentException("L'username est déjà utilisé.");
        }
        if (!$this->checkEmailDB($args['email'])) {
            throw new InvalidArgumentException("L'email est déjà utilisé.");
        }

        $args['activation_token'] = bin2hex(random_bytes(64));

        $hash=password_hash($args['password'], PASSWORD_DEFAULT, $options=[]);

        $user = new Utilisateur();
        $user->username = $args['username'];
        $user->email = $args['email'];
        $user->password = $hash;
        $user->activation_token = $args['activation_token'];


        return $user;
    }


}

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $args['username'] = $_POST["Cusername"];
        if ($_POST["Cpassword"] == $_POST["CCpassword"]) {
            $args['password'] = $_POST["Cpassword"];
        } else {
            throw new InvalidArgumentException('Les mots de passe ne correspondent pas');
        }
        $args['email'] = $_POST["Cemail"];

        try {
            $result = CreateUser($args);
        } catch (InvalidArgumentException $e) {
            $error = $e->getMessage();
        } catch (Exception $e) {
            $error = "Une erreur est survenue";
        }

        $user = CreateUser($args);
        AuthorService::saveUser($user);
    }