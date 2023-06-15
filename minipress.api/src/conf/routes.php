<?php

use minipress\api\action\GetArticleApiAction;
use minipress\api\action\GetArticlesApiAction;
use minipress\api\action\GetArticlesAuthorApiAction;
use minipress\api\action\GetArticlesCategoryApiAction;
use minipress\api\action\GetCategoriesApiAction;
use Slim\App;


return function (App $app): void {
    //Article complet
    $app->get('/articles/{id}', GetArticleApiAction::class);
    //Liste des articles
    $app->get('/articles', GetArticlesApiAction::class);
    //Liste des articles d'un auteur
    $app->get('/auteurs/{id}/articles', GetArticlesAuthorApiAction::class);
    //Liste des articles d'une catégorie
    $app->get('/categories/{id}/articles', GetArticlesCategoryApiAction::class);
    //Liste des catégories
    $app->get('/categories', GetCategoriesApiAction::class);
};