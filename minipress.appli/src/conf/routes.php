<?php

namespace minipress\app\conf;

use minipress\app\actions\HomeAction;
use minipress\app\actions\CreateUserAction;
use minipress\app\actions\ConnectUserAction;
use minipress\app\actions\GetAllArticlesAction;
use minipress\app\actions\GetArticleCreateAction;
use minipress\app\actions\GetCategorieCreateAction;
use minipress\app\actions\PostArticleCreateAction;
use minipress\app\actions\PostCategorieCreateAction;

return function ($app) {

    //utilisateurs
    $app->get('/inscription', CreateUserAction::class)->setName('inscription_users');
    $app->get('/connection', ConnectUserAction::class)->setName('connection_users');

    //page d'acceuil
    $app->get('[/]', HomeAction::class)->setName('home_page');

    //liste des articles
    $app->get('/articles', GetAllArticlesAction::class)->setName('list_articles');
    $app->get('/articles/{categorie}', GetAllArticlesAction::class)->setName('list_articles');

    //Création d'article
    $app->get('/article/create', GetArticleCreateAction::class)->setName('article_create');
    $app->post('/article/create', PostArticleCreateAction::class);

    //Création de catégorie
    $app->get('/categorie/create', GetCategorieCreateAction::class)->setName('categorie_create');
    $app->post('/categorie/create', PostCategorieCreateAction::class);
};