<?php

namespace minipress\appli\services;
use minipress\app\models\Utilisateur;

class AuthorService
{
    public function isAdmin($id) : bool
    {
        $user = Utilisateur::find($id);
        if ($user->user_status == '3') {
            return true;
        } else {
            return false;
        }
    }
}