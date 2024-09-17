<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\TestController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ContentController;
use App\Http\Controllers\NotificationController;

// authentication shit
Route::post('/auth/login', [AuthController::class, 'login'])->name('user.login');
Route::post('/auth/register', [AuthController::class, 'register'])->name('user.register');

Route::middleware('auth:sanctum')->group(function () {
    // CRUD routes for content (house or apartment)
    Route::post('/content/create', [ContentController::class, 'store'])->name('content.store'); 
    Route::put('/content/{id}', [ContentController::class, 'update'])->name('content.update'); 
    Route::delete('/content/{id}', [ContentController::class, 'delete'])->name('content.destroy');

    Route::delete('/auth/delete', [AuthController::class, 'delete'])->name('user.delete');

    //notification routes
    Route::post('/notifications', [NotificationController::class, 'sendNotification']);
    Route::patch('/notifications/{id}/read', [NotificationController::class, 'markAsRead']);
});

// dashboard route
Route::middleware(['auth:sanctum', 'role:admin|verhuurder'])->group(function () {
    Route::post('/debug', [TestController::class, 'index']);
});

// guest view
Route::get('/content', [ContentController::class, 'index'])->name('content.index');
Route::get('/content/{id}', [ContentController::class, 'show'])->name('content.show'); 
