<?php

namespace minipress\app\actions;

use minipress\app\services\ArticleService;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Slim\Views\Twig;
use Twig\Error\Error;

class PostArticleCreateAction extends Action
{
    public function __invoke(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
    {
        if (isset($request->getParsedBody()['titre']) && isset($request->getParsedBody()['resume'])) {

            $titre = $request->getParsedBody()['titre'];
            $resume = $request->getParsedBody()['resume'];

            $as = new ArticleService();
            $a = $as->createArticle($request->getParsedBody());
            $as->addImage($a->id, $request->getParsedBody()['image']);


            return Twig::fromRequest($request)->render($response, 'ArticleCreated.twig',
                ['titre' => $titre, 'resume' => $resume]);
        }
        throw new Error("paramètres incomplets ou invalides");
    }
}