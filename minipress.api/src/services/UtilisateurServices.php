<?php

namespace minipress\api\services;

use minipress\api\models\Utilisateur;

class UtilisateurServices
{
    public function getUsers()
    {
        $users = Utilisateur::all();
        return $users->toArray();
    }
}