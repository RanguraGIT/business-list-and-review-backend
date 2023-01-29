<?php

use App\Http\Controllers\Business\RatingController;
use App\Http\Controllers\Business\ReservationController;
use App\Http\Controllers\BusinessController;
use App\Http\Controllers\BusinessSearch;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('post/login', [UserController::class, 'login']);
Route::post('post/user', [UserController::class, 'register']);

Route::get('business/{id}', [BusinessController::class, 'business']);

Route::get('search/business', [BusinessSearch::class, 'search']);

Route::middleware('auth:api')->group(function () {
    Route::post('post/logout', [UserController::class, 'logout']);

    Route::post('post/business', [BusinessController::class, 'register']);
    Route::post('post/rating', [RatingController::class, 'register']);
    Route::post('post/reservation', [ReservationController::class, 'register']);

    Route::post('del/business', [BusinessController::class, 'delete']);
});
