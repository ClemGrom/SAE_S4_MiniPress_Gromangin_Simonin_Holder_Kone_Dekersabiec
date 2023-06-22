<?php

namespace minipress\api\services;

use minipress\api\models\Author;

/*
 * Classe AuthorServices
 */

class AuthorServices
{

    /*
     * Function getAuthorID
     * @param $id
     * @return Author
     * Retourne un auteur en fonction de son id
     */
    public function getAuthorID($id)
    {
        return Author::find($id);
    }

}