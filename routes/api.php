<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\TestController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// test functie ga naar http://127.0.0.1:8000/api/test
Route::get('/test', [TestController::class, "index"])->name('user.index');

// authentication shit
Route::post('/auth/login', [AuthController::class, 'login'])->name('user.login');
Route::post('/auth/register', [AuthController::class, 'register'])->name('user.register');

Route::middleware('auth:sanctum')->group(function () {

    Route::get('/auth/user', [AuthController::class, 'getUser'])->name('user.getUser');
    Route::put('/auth/user/{id}', [AuthController::class, 'update'])->name('user.update');
    Route::delete('/auth/delete', [AuthController::class, 'delete'])->name('user.delete');
    
});
