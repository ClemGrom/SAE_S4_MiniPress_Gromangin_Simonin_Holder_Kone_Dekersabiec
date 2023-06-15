<?php

namespace minipress\api\services;

use minipress\api\models\Categorie;

class CategorieServices
{
    public function getCategories()
    {
        return Categorie::all()->toArray();
    }

    public function getCategorieID($id)
    {
        return Categorie::find($id);
    }
}
