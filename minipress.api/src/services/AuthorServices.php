<?php

namespace minipress\api\services;

use minipress\api\models\Author;

class AuthorServices
{
    public function getAuthorID($id)
    {
        return Author::find($id);
    }

    public function isAdmin($id)
    {
        $a = Author::find($id);
        if ($a['user_status'] == '3') {
            return true;
        } else {
            return false;
        }
    }
}