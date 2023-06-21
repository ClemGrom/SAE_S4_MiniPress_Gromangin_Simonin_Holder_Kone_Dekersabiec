<?php

namespace minipress\app\conf;

use minipress\appli\actions\ArticleCreateAction;
use minipress\appli\actions\ArticleCreateHandler;

return function($app) {
    $app->get('/article/create', ArticleCreateAction::class)->setName('article_create');
    $app->post('/article/create', ArticleCreateHandler::class)->setName('article_create_handler');
};