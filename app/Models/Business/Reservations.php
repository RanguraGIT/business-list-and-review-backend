<?php

namespace App\Models\Business;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reservations extends Model
{
    use HasFactory;

    protected $table = 'business_reservations';
    protected $primaryKey = 'reservation_id';

    protected $fillable = [
        'reservation_id',
        'reservation_business',
        'reservation_user',
        'reservation_person',
        'reservation_date',
        'reservation_time',
        'reservation_status',
        'created_at',
        'updated_at',
    ];

    public function linkBusiness(){
        return $this->belongsTo(Businesses::class, 'reservation_business', 'business_id');
    }

    public function linkUser(){
        return $this->belongsTo(User::class, 'reservation_user', 'user_id');
    }
}
