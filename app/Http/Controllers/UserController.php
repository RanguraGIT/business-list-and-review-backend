<?php

namespace App\Http\Controllers;

use App\Helpers\standardCorp;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function login(Request $request){
        $filter = filter_var($request->email, FILTER_VALIDATE_EMAIL) ? 'user_email' : 'user_username';
        if (Auth::attempt(array($filter => $request->email, 'password' => $request->password, 'user_status' => 1))){
            $user = Auth::user();
            $token = $user->createToken('access_token')->accessToken;

            return standardCorp::json(
                'Authenticate success.', 200, [
                    'user' => $user,
                    'token' => $token,
            ]);
        }else{
            return standardCorp::json('Unauthorized', 401);
        }
    }

    public function logout(Request $request) {
        $request->user()->token()->revoke();
        return standardCorp::json('Logout success.', 200);
    }

    public function register(UserRule $request){
        if(isset($request->id)){
            $user = User::find($request->id);
            $response = 'update';
        }else{
            $user = new User;
            $response = 'create';
        }

        $user->user_name = $request->name;
        $user->user_username = $request->username;
        $user->user_email = $request->email;
        $user->user_phone = $request->phone;
        $user->user_password = bcrypt($request->password);
        $user->user_country = $request->country;
        $user->user_state = $request->state;
        $user->user_city = $request->city;
        $user->user_address = $request->address;
        $user->user_zip = $request->zip;

        if($user->save()){
            return standardCorp::json('User '.$response.' success', 200, $user);
        }else{
            return standardCorp::json('User failed to '.$response, 400, $user);
        }
    }
}
