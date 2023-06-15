<?php

namespace minipress\api\services;

use minipress\api\models\Author;

class AuthorServices
{
    public function getAuthorID($id)
    {
        $users = Author::find($id);
        return $users->toArray();
    }
}