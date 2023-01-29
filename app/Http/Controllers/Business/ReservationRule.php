<?php

namespace App\Http\Controllers\Business;

use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;

class ReservationRule extends FormRequest
{
    public function rules(){
        return [
            'business' => 'required|integer|exists:businesses,business_id',
            'date' => 'required|date',
            'time' => 'required|date_format:H:i',
            'person' => 'required|integer|min:1|max:11',
            'message' => 'nullable|string',
        ];
    }

    public function failedValidation(Validator $validator){
        throw new HttpResponseException(response()->json([
            'success'   => false,
            'message'   => 'Validation errors',
            'raw'      => $validator->errors()
        ]));
    }
}
