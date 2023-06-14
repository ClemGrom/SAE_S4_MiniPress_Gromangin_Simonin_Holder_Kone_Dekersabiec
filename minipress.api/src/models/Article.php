<?php

namespace minipress\api\models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Article extends Model
{
    protected $table = 'article';
    protected $primaryKey = 'id';
    public $timestamps = false;
    public $incrementing = true;
    public $keyType = 'string';
    public $fillable = ['id', 'titre', 'resume', 'contenu', 'date_crea', 'created_at', 'updated_at'];


    public function categories(): BelongsTo
    {
        return $this->belongsTo(Categorie::class, 'cat_id');
    }

}