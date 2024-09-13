<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\TestController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ContentController;

// test functie ga naar http://127.0.0.1:8000/api/test
Route::get('/test', [TestController::class, "index"])->name('user.index');

// authentication shit
Route::post('/auth/login', [AuthController::class, 'login'])->name('user.login');


Route::middleware('auth:sanctum')->group(function () {
    // CRUD routes for content (house or apartment)
    Route::get('/content', [ContentController::class, 'index'])->name('content.index'); // List all contents
    Route::post('/content', [ContentController::class, 'store'])->name('content.store'); // Create new content
    Route::get('/content/{id}', [ContentController::class, 'show'])->name('content.show'); // Show specific content
    Route::put('/content/{id}', [ContentController::class, 'update'])->name('content.update'); // Update content
    Route::delete('/content/{id}', [ContentController::class, 'destroy'])->name('content.destroy'); // Delete content
});
