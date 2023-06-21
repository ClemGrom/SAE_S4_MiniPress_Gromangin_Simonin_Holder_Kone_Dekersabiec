<?php

namespace minipress\app\models;

use Illuminate\Database\Eloquent\Model;

class utilisateur extends Model
{
    protected $table = 'UTILISATEUR';
    protected $primaryKey = 'id';
    public $timestamps = false;
}