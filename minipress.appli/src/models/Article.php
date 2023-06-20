<?php

namespace minipress\app\models;

use Illuminate\Database\Eloquent\Model;

class Article extends Model
{
    protected $table = 'ARTICLE';
    protected $primaryKey = 'id';
    public $timestamps = false;

    public function categorie()
    {
        return $this->belongsTo(Categorie::class, 'categ_id');
    }

    public function author()
    {
        return $this->belongsTo(Utilisateur::class, 'author_id');
    }
}
