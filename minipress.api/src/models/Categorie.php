<?php

namespace minipress\api\models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

/*
 * Classe Categorie
 */
class Categorie extends Model
{
    protected $table = 'categorie';
    protected $primaryKey = 'id';
    public $timestamps = false;
    public $keyType = 'string';
    public $fillable = ['id', 'titre', 'description'];

    /*
     * Relations
     */

    // Relation avec la table Article
    public function articles(): HasMany
    {
        return $this->hasMany(Article::class, 'categ_id');
    }
}
