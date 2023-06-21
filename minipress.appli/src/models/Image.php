<?php

namespace minipress\app\models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use minipress\api\models\Article;

class Image extends Model
{
    protected $table = 'image';
    protected $primaryKey = 'id';
    public $timestamps = false;
    public $incrementing = true;
    public $keyType = 'string';
    public $fillable = ['id', 'url'];

    public function articles(): BelongsToMany
    {
        return $this->belongsToMany(Article::class, 'image2article', 'image_id',
            'article_id');
    }

}