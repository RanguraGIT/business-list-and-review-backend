<?php

namespace App\Models;

use App\Models\Business\Ratings;
use App\Models\Business\Reservations;
use Carbon\Carbon;
use Nicolaslopezj\Searchable\SearchableTrait;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Businesses extends Model
{
    use HasFactory, SearchableTrait;

    protected $table = 'businesses';
    protected $primaryKey = 'business_id';

    protected $fillable = [
        'business_id',
        'business_name',
        'business_type',
        'business_category',
        'business_email',
        'business_phone',
        'business_website',
        'business_price',
        'business_opening',
        'business_closing',
        'business_country',
        'business_state',
        'business_city',
        'business_address',
        'business_zip',
        'business_latitute',
        'business_longitude',
        'business_status',
        'created_at',
        'updated_at',
    ];

    protected $searchable = [
        'columns' => [
            'businesses.business_name' => 100,
            'businesses.business_type' => 90,
            'businesses.business_category' => 90,
            'businesses.business_email' => 90,
            'businesses.business_phone' => 90,
            'businesses.business_website' => 90,
            'businesses.business_opening' => 90,
            'businesses.business_closing' => 90,
            'businesses.business_country' => 70,
            'businesses.business_state' => 70,
            'businesses.business_city' => 70,
            'businesses.business_address' => 100,
            'businesses.business_zip' => 50,
            'businesses.business_latitute' => 20,
            'businesses.business_longitude' => 20,
        ],
        'joins' => [
            'business_ratings' => ['businesses.business_id','business_ratings.rating_business'],
            'business_reservations' => ['businesses.business_id','business_reservations.reservation_business'],
        ],
        'groupBy' => [
            'businesses.business_id',
            'businesses.business_name',
            'businesses.business_type',
            'businesses.business_category',
            'businesses.business_email',
            'businesses.business_phone',
            'businesses.business_website',
            'businesses.business_price',
            'businesses.business_opening',
            'businesses.business_closing',
            'businesses.business_country',
            'businesses.business_state',
            'businesses.business_city',
            'businesses.business_address',
            'businesses.business_zip',
            'businesses.business_latitute',
            'businesses.business_longitude',
            'businesses.business_status',
            'businesses.created_at',
            'businesses.updated_at',
        ],
    ];

    public function scopeDistance($query, $lat, $lng, $distance = null){
        if($distance == '' || $distance == null){
            $distance = 0;
        }

        return $query->selectRaw(
            "(6371 *
                acos(
                    cos(radians($lat)) *
                    cos(radians(business_latitute)) *
                    cos(radians(business_longitude) - radians($lng)) +
                    sin(radians($lat)) *
                    sin(radians(business_latitute))
                )
            ) as business_distance"
        )->havingRaw("business_distance < $distance || $distance = 0");
    }

    public function scopeTime($query, $time = null){
        if($time == '' || $time == null){
            $time = Carbon::now()->setTimezone(new \DateTimeZone('Asia/Jakarta'))->format('H:i:s');
        }

        return $query->selectRaw('IF(business_opening <= "'.$time.'" AND business_closing >= "'.$time.'", 1, 0) as business_open');
    }

    public function scopeRating($query, $rating = null){
        if($rating == '' || $rating == null){
            $rating = 0;
        }

        $query->addSelect(DB::raw("(SELECT ROUND(AVG(rating) * 2, 0) / 2 FROM business_ratings WHERE business_ratings.rating_business = businesses.business_id) as business_rating"))->having("business_rating", ">=", $rating);
        return $query->addSelect(DB::raw("(SELECT COUNT(rating) FROM business_ratings WHERE business_ratings.rating_business = businesses.business_id) as business_review"));
    }

    public function linkRating(){
        return $this->hasMany(Ratings::class, 'rating_business', 'business_id');
    }

    public function linkReservation(){
        return $this->hasMany(Reservations::class, 'reservation_business', 'business_id');
    }
}
