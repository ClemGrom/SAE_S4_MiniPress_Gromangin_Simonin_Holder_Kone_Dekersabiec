<?php

namespace minipress\api\action;

use minipress\api\services\AuthorServices;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

class GetAuthorApiAction
{
    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $as= new AuthorServices();
        $a = $as->getAuthorID($args['id']);

        $author_api = [
            'id'=>$a['id'],
            'auteur' => $a['username'],
            'email'=>$a['email']
        ];

        $rs->getBody()->write(json_encode($author_api));
        return $rs
            ->withHeader('Access-Control-Allow-Origin', 'http://localhost:20004')
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(200);

    }
}