<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Contracts\Validation\Validator;

class BusinessRule extends FormRequest
{
    public function rules(){
        return [
            'name' => 'required|string|max:100',
            'type' => 'required|string|max:20',
            'category' => 'required|string',
            'email' => 'required|string|max:100',
            'phone' => 'required|string|max:20g',
            'website' => 'nullable|string|max:100',
            'opening' => 'nullable|string',
            'closing' => 'nullable|string',
            'country' => 'nullable|string|max:20',
            'state' => 'nullable|string|max:20',
            'city' => 'nullable|string|max:20',
            'address' => 'required|string',
            'zip' => 'nullable|string|max:10',
            'latitute' => 'nullable|string',
            'longitude' => 'nullable|string',
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
