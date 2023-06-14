<?php

namespace minipress\api\models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Categorie extends Model
{
    protected $table = 'categorie';
    protected $primaryKey = 'id';
    public $timestamps = false;
    public $keyType = 'string';
    public $fillable = ['id', 'titre', 'description'];

    public function articles(): HasMany
    {
        return $this->hasMany(Article::class, 'cat_id');
    }
}
