<?php

namespace minipress\app\actions;

use minipress\appli\services\AuthorService;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Log\InvalidArgumentException;
use Slim\Views\Twig;

class ConnectUserAction extends Action
{
    public function __invoke(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
    {
        $as = new AuthorService();
        return Twig::fromRequest($request)->render($response, 'Auth.twig');
    }

    public function checkUsernameDB(string $username): bool {

        $user = Utilisateur::where('username', $username)->first();
        if ($user) {
            return true;
        } else {
            return false;
        }
    }

    public function checkPasswordValid(string $pass, string $username) :bool
    {
        $user = Utilisateur::where('username', $username)->first();
        if ($pass == $user->passwd_hash) {
            return true;
        } else {
            return false;
        }
    }

    public function ConnectUser( $args ) :Utilisateur
    {
        $connect = new AuthorService();
        $id = $connect->getAuthorID($args['id']);
        $_SESSION['id'] = $id;

        $user = Utilisateur::where('id', $id)->first();
        if ($user->user_status == 1) {
            $user->user_status = 3;
        } else {
            $user->user_status = 4;
        }

        return $user;
    }

}

if ($_POST["REQUEST_METHOD"] == "POST" && isset($_POST['Connect']))
{
    $_POST['username'] = filter_var($_POST['username'], FILTER_SANITIZE_STRING);
    $args['username'] = $_POST['username'];
    $_POST['password'] = filter_var($_POST['password'], FILTER_SANITIZE_STRING);
    $args['password'] = password_hash($_POST['password'], PASSWORD_DEFAULT, $options=[]);

    if (checkUsernameDB($args['username'])) {
        if (checkPasswordValid($args['password'], $args['username'])) {
            $user = ConnectUser($args);
        } else {
            throw new InvalidArgumentException('Mot de passe invalide');
        }
    } else {
        throw new InvalidArgumentException('Nom d\'utilisateur invalide');
    }

    $user->save();
}