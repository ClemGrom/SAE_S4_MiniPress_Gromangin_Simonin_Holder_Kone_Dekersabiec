<?php

namespace minipress\api\models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Article extends Model
{
    protected $table = 'article';
    protected $primaryKey = 'id';
    public $timestamps = false;
    public $incrementing = true;
    public $keyType = 'string';
    public $fillable = ['id', 'titre', 'resume', 'contenu', 'date_crea', 'categ_id', 'author_id'];


    public function categories(): BelongsTo
    {
        return $this->belongsTo(Categorie::class, 'cat_id');
    }

    public function author(): BelongsTo
    {
        return $this->belongsTo(Author::class, 'author_id');
    }

    public function images(): BelongsToMany
    {
        return $this->belongsToMany(Image::class, 'image2article', 'article_id',
            'image_id');
    }

}