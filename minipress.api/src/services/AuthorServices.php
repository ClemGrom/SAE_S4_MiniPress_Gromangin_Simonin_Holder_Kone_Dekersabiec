<?php

namespace minipress\api\services;

use minipress\api\models\Author;

class AuthorServices
{
    public function getAuthorID($id)
    {
        return Author::find($id);
    }
}