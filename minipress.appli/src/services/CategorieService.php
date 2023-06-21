<?php

namespace minipress\app\services;

use minipress\app\models\Categorie;

class CategorieService
{
    public function getCategories(){
        return Categorie::all()->toArray();
    }
}