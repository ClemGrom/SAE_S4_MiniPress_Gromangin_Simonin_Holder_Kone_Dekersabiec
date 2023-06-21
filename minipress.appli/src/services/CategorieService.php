<?php

namespace minipress\app\services;

use minipress\app\models\Categorie;

class CategorieService
{
    public function getCategories()
    {
        return Categorie::all()->toArray();
    }

    public function createCategorie(array $data): void
    {
        $categ = new Categorie();
        $categ->titre = $data['titre'];
        $categ->description = $data['desc'];
        $categ->save();
    }
}