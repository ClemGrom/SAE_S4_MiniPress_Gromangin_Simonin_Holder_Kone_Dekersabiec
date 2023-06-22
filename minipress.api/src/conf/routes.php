<?php

use minipress\api\action\articles\GetArticleApiAction;
use minipress\api\action\articles\GetArticlesApiAction;
use minipress\api\action\articles\GetArticlesAuthorApiAction;
use minipress\api\action\articles\GetArticlesCategoryApiAction;
use minipress\api\action\authors\GetAuthorApiAction;
use minipress\api\action\categories\GetCategorieApiAction;
use minipress\api\action\categories\GetCategoriesApiAction;
use minipress\api\action\images\GetImagesArticlesAction;
use Slim\App;


return function (App $app): void {

    //Liste des articles
    $app->get('/articles', GetArticlesApiAction::class);
    //Article complet
    $app->get('/articles/{id}', GetArticleApiAction::class);
    //Liste des images d'un article
    $app->get('/articles/{id}/images', GetImagesArticlesAction::class);

    //Informations d'un auteur
    $app->get('/auteurs/{id}', GetAuthorApiAction::class);
    //Liste des articles d'un auteur
    $app->get('/auteurs/{id}/articles', GetArticlesAuthorApiAction::class);

    //Liste des catégories
    $app->get('/categories', GetCategoriesApiAction::class);
    //Liste des articles d'une catégorie
    $app->get('/categories/{id}/articles', GetArticlesCategoryApiAction::class);
    //Catégorie complète
    $app->get('/categories/{id}', GetCategorieApiAction::class);
};