<?php

namespace minipress\app\models;

use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    protected $table = 'image';
    protected $primaryKey = 'id';
    public $timestamps = false;

}