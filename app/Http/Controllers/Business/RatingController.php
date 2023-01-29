<?php

namespace App\Http\Controllers\Business;

use App\Helpers\standardCorp;
use App\Http\Controllers\Controller;
use App\Models\Business\Ratings;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RatingController extends Controller
{
    public function register(RatingRule $request){
        if(isset($request->id)){
            $rating = Ratings::find($request->id);
            $response = 'update';
        }else{
            $rating = new Ratings;
            $response = 'create';
        }

        $rating->rating_business = $request->business;
        $rating->rating_user = Auth::user()->user_id;
        $rating->rating = $request->rating;
        $rating->rating_review = $request->review;

        if($rating->save()){
            return standardCorp::json('Rating '.$response.' success', 200, $rating);
        }else{
            return standardCorp::json('Rating failed to '.$response, 400, $rating);
        }
    }
}
