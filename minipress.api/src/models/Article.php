<?php

namespace minipress\api\models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

/*
 * Classe Article
 */

class Article extends Model
{
    protected $table = 'article';
    protected $primaryKey = 'id';
    public $timestamps = false;
    public $incrementing = true;
    public $keyType = 'string';
    public $fillable = ['id', 'titre', 'resume', 'contenu', 'date_crea', 'categ_id', 'author_id'];


    /*
     * Relations
     */

    // Relation avec la table Categorie
    public function categories(): BelongsTo
    {
        return $this->belongsTo(Categorie::class, 'cat_id');
    }

    // Relation avec la table Author
    public function author(): BelongsTo
    {
        return $this->belongsTo(Author::class, 'author_id');
    }

    // Relation avec la table Image
    public function images(): BelongsToMany
    {
        return $this->belongsToMany(Image::class, 'image2article', 'article_id',
            'image_id');
    }

}