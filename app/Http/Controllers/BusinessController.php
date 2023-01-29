<?php

namespace App\Http\Controllers;

use App\Helpers\standardCorp;
use App\Models\Businesses;
use Carbon\Carbon;
use Illuminate\Http\Request;

class BusinessController extends Controller
{
    public function register(BusinessRule $request){
        if(isset($request->id)){
            $business = Businesses::find($request->id);
            $response = 'update';
        }else{
            $business = new Businesses;
            $response = 'create';
        }

        $business->business_name = $request->name;
        $business->business_type = $request->type;
        $business->business_category = $request->category;
        $business->business_email = $request->email;
        $business->business_phone = $request->phone;
        $business->business_website = $request->website;
        $business->business_price = $request->price;
        $business->business_opening = str_replace(':', '', $request->opening);
        $business->business_closing = str_replace(':', '', $request->closing);
        $business->business_country = $request->country;
        $business->business_state = $request->state;
        $business->business_city = $request->city;
        $business->business_address = $request->address;
        $business->business_zip = $request->zip;
        $business->business_latitute = $request->latitute;
        $business->business_longitude = $request->longitude;

        if($business->save()){
            return standardCorp::json('Business '.$response.' success', 200, $business);
        }else{
            return standardCorp::json('Business failed to '.$response, 400, $business);
        }
    }

    public function business($id){
        $business = Businesses::where('business_id', $id)->select('*');
        $business->rating();
        $business->time();
        $business->with(['linkRating']);
        $business = $business->first();

        if($business){
            return standardCorp::json('Business found', 200, $business);
        }else{
            return standardCorp::json('Business not found', 404, $business);
        }
    }

    public function delete(Request $request){
        $business = Businesses::find($request->id);
        $business->business_status = 0;
        if($business->save()){
            return standardCorp::json('Business deleted', 200, $business);
        }else{
            return standardCorp::json('Business failed to delete', 400, $business);
        }
    }
}
