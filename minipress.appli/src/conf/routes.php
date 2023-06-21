<?php

namespace minipress\app\conf;

use minipress\app\actions\GetArticleCreateAction;
use minipress\app\actions\GetCategorieCreateAction;
use minipress\app\actions\PostArticleCreateAction;
use minipress\app\actions\PostCategorieCreateAction;

return function ($app) {

    //Création d'article
    $app->get('/article/create', GetArticleCreateAction::class)->setName('article_create');
    $app->post('/article/create', PostArticleCreateAction::class);

    //Création de catégorie
    $app->get('/categorie/create', GetCategorieCreateAction::class)->setName('categorie_create');
    $app->post('/categorie/create', PostCategorieCreateAction::class);
};