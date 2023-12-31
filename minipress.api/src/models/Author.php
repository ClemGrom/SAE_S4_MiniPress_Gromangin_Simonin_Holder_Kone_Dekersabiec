<?php

namespace minipress\api\models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

/*
 * Classe Author
 */

class Author extends Model
{
    protected $table = 'utilisateur';
    protected $primaryKey = 'id';
    public $timestamps = false;
    public $keyType = 'string';
    public $fillable = ['id', 'username', 'email', 'passwd_hash', 'activation_token', 'activation_expires',
        'renew_token', 'renew_expires', 'user_status'];

    /*
     * Relations
     */

    // Relation avec la table Article
    public function articles(): HasMany
    {
        return $this->HasMany(Article::class, 'author_id');
    }


}