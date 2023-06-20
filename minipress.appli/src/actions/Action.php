<?php

namespace minipress\app\actions;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

abstract class Action
{

    public abstract function __invoke(Request $request, Response $response, $args):Response;
    
}