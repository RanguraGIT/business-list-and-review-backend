<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class UserRule extends FormRequest
{
    public function rules(Request $request){
        $uniqueMile = Rule::unique('users', 'user_email');
        $uniqueUsername = Rule::unique('users', 'user_username');

        if ($request->id) {
            $uniqueMile->ignore($request->id, 'user_id');
            $uniqueUsername->ignore($request->id, 'user_id');
        }

        return [
            'name' => 'required|string|max:100',
            'username' => ['nullable', 'string', 'max:20', $uniqueUsername],
            'phone' => 'nullable|string|max:20',
            'email' => ['required', 'string', 'max:100', $uniqueMile],
            'password' => 'required|string|min:8|max:20|regex:/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$/',
            'country' => 'nullable|string|max:20',
            'state' => 'nullable|string|max:20',
            'city' => 'nullable|string|max:20',
            'address' => 'nullable|string',
            'zip' => 'nullable|string|max:10',
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
