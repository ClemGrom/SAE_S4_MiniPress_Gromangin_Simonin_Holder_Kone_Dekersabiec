<?php

namespace minipress\api\models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Image extends Model
{
    protected $table = 'image';
    protected $primaryKey = 'id';
    public $timestamps = false;
    public $incrementing = true;
    public $keyType = 'string';
    public $fillable = ['id', 'article_id'];

    public function articles(): BelongsToMany
    {
        return $this->belongsToMany(Article::class, 'image2article', 'image_id',
            'article_id');
    }

}