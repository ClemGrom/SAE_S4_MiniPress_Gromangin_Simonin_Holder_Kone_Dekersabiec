<?php

namespace minipress\api\services;

use minipress\api\models\Categorie;

class CategorieServices
{
    public function getCategories()
    {
        $categories = Categorie::all();
        return $categories->toArray();
    }

    public function getCategorieID($id)
    {
        $categorie = Categorie::find($id);
        return $categorie->toArray();
    }
}
