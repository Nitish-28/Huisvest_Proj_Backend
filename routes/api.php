<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\TestController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// test functie ga naar http://127.0.0.1:8000/api/test
Route::get('/test', [TestController::class, "index"])->name('user.index');

// authentication shit
Route::post('/auth/login', [AuthController::class, 'login'])->name('user.login');