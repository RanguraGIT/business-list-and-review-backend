<?php

namespace App\Helpers;

class standardCorp {
    public static function json($message, $code, $result = []){
    	$response = [];
        $response['success'] = !empty($code) && $code >= 200 && $code <= 299 ? true : false;
        $response['message'] = !empty($message) ? $message : [null];
        $response['raw'] = !empty($result) ? $result : [null];

        return response()->json($response, $code);
    }
}
