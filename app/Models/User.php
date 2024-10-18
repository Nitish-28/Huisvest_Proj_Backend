<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable
{
    use HasFactory, Notifiable, HasApiTokens, HasRoles;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'profile_picture'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    public function sentNotifications()
    {
        return $this->hasMany(Notifications::class, 'sender_id');
    }

    public function receivedNotifications()
    {
        return $this->hasMany(Notifications::class, 'receiver_id');
    }

    public function contents()
    {
        return $this->hasMany(Content::class);
    }

    // Biddings sent by the user
    public function sentBids()
    {
        return $this->hasMany(Bidding::class, 'sender_id');
    }

    // Biddings received by the user
    public function receivedBids()
    {
        return $this->hasMany(Bidding::class, 'receiver_id');
    }

    public function favorites()
{
    return $this->belongsToMany(Content::class, 'favorites', 'user_id', 'content_id');
}
}
