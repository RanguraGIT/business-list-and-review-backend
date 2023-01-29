<?php

namespace App\Models\Business;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ratings extends Model
{
    use HasFactory;

    protected $table = 'business_ratings';
    protected $primaryKey = 'rating_id';

    protected $fillable = [
        'rating_id',
        'rating_business',
        'rating_user',
        'rating',
        'rating_review',
        'created_at',
        'updated_at',
    ];

    public function linkBusiness(){
        return $this->belongsTo(Businesses::class, 'rating_business', 'business_id');
    }

    public function linkUser(){
        return $this->belongsTo(User::class, 'rating_user', 'user_id');
    }
}
