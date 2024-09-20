<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// controllers
use App\Http\Controllers\ContentController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\TestController;
use App\Http\Controllers\BiddingController;
use App\Http\Controllers\FavoriteController;

// authentication shit
Route::post('/auth/login', [AuthController::class, 'login'])->name('user.login');
Route::post('/auth/register', [AuthController::class, 'register'])->name('user.register');

Route::middleware('auth:sanctum')->group(function () {

    // user settings crud etc..
    Route::delete('/auth/delete', [AuthController::class, 'delete'])->name('user.delete');

    //notification routes
    Route::post('/notifications', [NotificationController::class, 'sendNotification']);
    Route::patch('/notifications/{id}/read', [NotificationController::class, 'markAsRead']);

    route::post('/bids', [BiddingController::class, 'placeBid']);

    Route::post('/content/{id}/favorite', [FavoriteController::class, 'add'])->name('content.favorite');
    Route::delete('/content/{id}/favorite', [FavoriteController::class, 'remove'])->name('content.unfavorite');
    Route::get('/favorites', [FavoriteController::class, 'index'])->name('content.favorites');

    //logout function
    Route::post('/auth/logout', [AuthController::class, 'logout'])->name('user.logout');

    // show details of content
    Route::get('/content/{id}', [ContentController::class, 'show'])->name('content.show');
});

// VERHUURDER, dashboard control
Route::middleware(['auth:sanctum', 'role:verhuurder|admin'])->group(function () {
    // test function for role checking (api/debug)
    Route::post('/debug', [TestController::class, 'index']);

    // give back all houses and listings by logged in user
    Route::post('/d/list', [DashboardController::class, 'list']);

    // CRUD routes for content and listings by verhuurders
    Route::post('/d/create', [ContentController::class, 'store'])->name('content.store');
    Route::put('/d/{id}', [ContentController::class, 'update'])->name('content.update');
    Route::delete('/d/{id}', [ContentController::class, 'delete'])->name('content.destroy');
});

// guest view
Route::get('/content', [ContentController::class, 'guest'])->name('content.index');

