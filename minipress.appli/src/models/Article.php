<?php

namespace minipress\app\models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Article extends Model
{
    protected $table = 'article';
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

    public function images(): BelongsToMany
    {
        return $this->belongsToMany(Image::class, 'image2article', 'article_id',
            'image_id');
    }
}
