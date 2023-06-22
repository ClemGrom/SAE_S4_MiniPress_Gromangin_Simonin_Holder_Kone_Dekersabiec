<?php

namespace minipress\api\services;

use minipress\api\models\Categorie;

/*
 * Class CategorieServices
 */

class CategorieServices
{
    /*
     * Function getCategories
     * @return array
     * Retourne toutes les catégories sous forme de tableau
     */
    public function getCategories()
    {
        return Categorie::all()->toArray();
    }

    /*
     * Function getCategorieID
     * @param $id
     * @return
     * Retourne une catégorie en fonction de son id
     */
    public function getCategorieID($id)
    {
        return Categorie::find($id);
    }
}
