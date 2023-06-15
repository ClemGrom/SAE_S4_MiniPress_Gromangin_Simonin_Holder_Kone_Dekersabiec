<?php

namespace minipress\api\conf;

use Slim\Factory\AppFactory;

$app = AppFactory::create();
$app->addRoutingMiddleware();
$app->setBasePath("/api");
$app->addErrorMiddleware(true, false, false);

define("minipress\api\conf\basePath", $app->getBasePath());

return $app;