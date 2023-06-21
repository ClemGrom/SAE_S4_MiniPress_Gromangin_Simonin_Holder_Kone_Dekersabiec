<?php

namespace minipress\appli\actions;

use minipress\app\actions\Action;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Views\Twig;

class ArticleCreateHandler extends Action
{
    public function __invoke(Request $request, Response $response, array $args): Response
    {

        $titre = $request->getParsedBody()['titre'];
        $resume = $request->getParsedBody()['resume'];
        return Twig::fromRequest($request)->render($response, 'ArticleCreated.twig',
            ['titre' => $titre, 'resume' => $resume]);
    }
}