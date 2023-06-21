<?php

namespace minipress\app\actions;

use minipress\app\services\CategorieService;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Slim\Views\Twig;
use Twig\Error\Error;


class PostCategorieCreateAction
{
    public function __invoke(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
    {
        if (isset($request->getParsedBody()['titre']) && isset($request->getParsedBody()['desc'])) {
            $cs = new CategorieService();
            $cs->createCategorie($request->getParsedBody());

            return Twig::fromRequest($request)->render($response, 'CategorieCreated.twig',
                ['titre' => $request->getParsedBody()['titre'], 'description' => $request->getParsedBody()['desc']]);
        }
        throw new Error("paramètres incomplets ou invalides");
    }
}
