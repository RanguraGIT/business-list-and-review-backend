<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table = 'users';
    protected $primaryKey = 'user_id';

    protected $fillable = [
        'user_id',
        'user_name',
        'user_username',
        'user_email',
        'user_phone',
        'user_password',
        'user_country',
        'user_state',
        'user_city',
        'user_address',
        'user_zip',
        'created_at',
        'updated_at',
    ];

    protected $hidden = [
        'user_password',
    ];

    public function getAuthPassword(){
        return $this->user_password;
    }

    public function linkRating(){
        return $this->hasMany(Ratings::class, 'rating_user', 'user_id');
    }

    public function linkReservation(){
        return $this->hasMany(Reservations::class, 'reservation_user', 'user_id');
    }
}
