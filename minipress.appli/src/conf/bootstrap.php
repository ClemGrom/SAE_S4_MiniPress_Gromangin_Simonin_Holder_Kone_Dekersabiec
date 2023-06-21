<?php

use minipress\app\services\utils\Eloquent;
use Slim\Views\Twig;
use Slim\Views\TwigMiddleware;

require_once __DIR__ . '/../vendor/autoload.php';

$app = \Slim\Factory\AppFactory::create();

$app->addErrorMiddleware(true, false, false);

Eloquent::init(__DIR__ . '/conf.ini');

$twig = Twig::create(__DIR__ . '/../templates/');
$app->add(TwigMiddleware::create($app, $twig));
$twig->getEnvironment()->addGlobal('basePath', $app->getBasePath());

return $app;
