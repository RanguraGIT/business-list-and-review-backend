<?php

namespace App\Http\Controllers\Business;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Contracts\Validation\Validator;

class RatingRule extends FormRequest
{
    public function rules(){
        return [
            'business' => 'required|integer|exists:businesses,business_id',
            'rating' => 'required|integer|min:1|max:5',
            'review' => 'nullable|string',
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
