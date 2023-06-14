<?php

use minipress\api\action\GetArticlesApiAction;
use minipress\api\action\GetArticlesAuthorApiAction;
use minipress\api\action\GetArticlesCategoryApiAction;
use minipress\api\action\GetCategoriesApiAction;
use Slim\App;


return function (App $app): void {
    $app->get('/articles', GetArticlesApiAction::class);
    $app->get('/articles/{id}', GetArticlesApiAction::class);
    $app->get('/auteurs/{id}/articles', GetArticlesAuthorApiAction::class);
    $app->get('/categories', GetCategoriesApiAction::class);
    $app->get('/categories/{id}/articles', GetArticlesCategoryApiAction::class);
};