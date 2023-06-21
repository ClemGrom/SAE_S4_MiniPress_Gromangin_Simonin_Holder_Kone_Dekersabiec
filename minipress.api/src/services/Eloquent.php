<?php

namespace minipress\api\services;

use Illuminate\Database\Capsule\Manager as DB;

class Eloquent
{

    public static function init($filename): void
    {

        $db = new DB();
        $db->addConnection(parse_ini_file($filename));
        $db->setAsGlobal();
        $db->bootEloquent();

    }

}