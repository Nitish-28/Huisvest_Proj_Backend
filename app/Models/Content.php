<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Content extends Model
{
    use HasFactory;
    protected $fillable = [
        'type',
        'availability',
        'address',
        'city',
        'state',
        'zip',
        'price',
        'description',
        'm2',
        'bedrooms',
        'bathrooms',
        'image',
        'user_id',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function favorites()
{
    return $this->belongsToMany(User::class, 'favorites', 'content_id', 'user_id');
}

    
}
