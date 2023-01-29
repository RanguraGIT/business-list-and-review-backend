<?php

namespace App\Http\Controllers;

use App\Helpers\standardCorp;
use App\Models\Businesses;
use Carbon\Carbon;
use Illuminate\Http\Request;

class BusinessSearch extends Controller
{
    public function search(Request $request)
    {
        $search = $request->get('search');
        $businesses = Businesses::search($search)->select('*');

        if ($request->has('rating')){
            $businesses->rating();
        }

        if ($request->has('distance', 'latitute', 'longitude')){
            $businesses->distance($request->latitute, $request->longitude, $request->distance);
        }

        if ($request->has('open')){
            $businesses->time();
        }

        if ($request->has('sort')){
            if($request->has('distance', 'latitute', 'longitude') && $request->sort == 'distance'){
                $businesses->orderBy('business_distance', 'asc');
            }

            if($request->has('relevant')){
                $businesses->orderBy('business_name', 'asc');
            }
        }

        if ($request->rating != null && $request->rating != '' && $request->rating != 'null'){
            $businesses->having('business_rating', '>=', $request->rating);
        }

        if ($request->price != null && $request->price != '' && $request->price != 'null'){
            $businesses->where('business_price', '>=', $request->price);
        }

        if ($request->has('limit')){
            $businesses->limit($request->limit);
        }

        // return $request->option;
        return standardCorp::json('Data loaded', 200, $businesses->get());
    }
}
