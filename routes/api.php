<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\TestController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// test functie ga naar http://127.0.0.1:8000/api/test
Route::get('/test', [TestController::class, "index"])->name('user.index');

// authentication shit
Route::post('/auth/login', [AuthController::class, 'login'])->name('user.login');


Route::middleware('auth:sanctum')->group(function () {
    // read function
    Route::get('/auth/user', [AuthController::class, 'getUser'])->name('user.getUser');
    
    // write function
    Route::post('/auth/user', [AuthController::class, 'storeUser'])->name('user');
    
    // update function
    Route::put('/auth/user/{id}', [AuthController::class, 'updateUser'])->name('user.update');
    
    // delete function
    Route::delete('/auth/user/{id}', [AuthController::class, 'deleteUser'])->name('user.delete');
    
});