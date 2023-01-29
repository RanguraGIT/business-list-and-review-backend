<?php

namespace App\Http\Controllers\Business;

use App\Helpers\standardCorp;
use App\Http\Controllers\Controller;
use App\Models\Business\Reservations;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ReservationController extends Controller
{
    public function register(ReservationRule $request){
        if(isset($request->id)){
            $reservation = Reservations::find($request->id);
            $response = 'update';
        }else{
            $reservation = new Reservations;
            $response = 'create';
        }

        $reservation->reservation_business = $request->business;
        $reservation->reservation_user = Auth::user()->user_id;
        $reservation->reservation_date = date("Y/m/d", strtotime($request->date));
        $reservation->reservation_time = $request->time;
        $reservation->reservation_person = $request->person;
        $reservation->reservation_message = $request->message;

        if($reservation->save()){
            return standardCorp::json('Reservation '.$response.' success', 200, $reservation);
        }else{
            return standardCorp::json('Reservation failed to '.$response, 400, $reservation);
        }
    }
}
