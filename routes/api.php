<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\ContentController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\TestController;
use App\Http\Controllers\BiddingController;
use App\Http\Controllers\FavoriteController;
use App\Http\Controllers\MailController;


// authentication 
Route::post('/auth/login', [AuthController::class, 'login'])->name('user.login');
Route::post('/auth/register', [AuthController::class, 'register'])->name('user.register');

Route::get('/mail/send', [MailController::class, 'send'])->name('mail.send');
Route::get('/mail/verify', [MailController::class, 'verify'])->name('mail.verify');


Route::middleware('auth:sanctum')->group(function () {
    Route::post('/pp/save', [AuthController::class, 'uploadProfilePicture']);
    Route::post('/pp/get', [AuthController::class, 'getUserProfile']);

    Route::post('/fav/save/{id}', [FavoriteController::class, 'save']);
    Route::post('/fav/remove/{id}', [FavoriteController::class, 'unsave']);
    Route::get('/fav/saves', [FavoriteController::class, 'getSavedHouses']);

    // user settings crud etc..
    Route::delete('/auth/delete', [AuthController::class, 'delete'])->name('user.delete');

    //notification routes
    Route::post('/notifications', [NotificationController::class, 'sendNotification']);
    Route::post('/notifications/{id}/read', [NotificationController::class, 'markAsRead']);
    Route::get('/notifications', [NotificationController::class, 'showNotifications']);

    route::post('/bids', [BiddingController::class, 'placeBid']);

    //logout function
    Route::post('/auth/logout', [AuthController::class, 'logout'])->name('user.logout');

    //content details

    Route::middleware('auth:sanctum')->get('/auth/validate-token', function (Request $request) {
        if (Auth::check()) {
            return response()->json([
                'success' => true,
                'message' => 'Token is valid',
                'user' => Auth::user(),
                'isSeller' => Auth::user()->hasRole('verhuurder'),
            ]);
        }

        return response()->json([
            'success' => false,
            'message' => 'Token is invalid or expired'
        ], 401);
    });

    Route::post('/user/totalviews', [ContentController::class, 'getTotalViewsForUser']);

    Route::get('/auth/user', [AuthController::class, 'getUserData']);
    Route::put('/auth/user', [AuthController::class, 'updateUserData']);
    Route::get('/saves', [ContentController::class, 'saves'])->name('saves.index');


    // VERHUURDER, dashboard control
    Route::middleware(['role:verhuurder'])->group(function () {

        // give back all houses and listings by logged in user
        Route::post('/d/list', [DashboardController::class, 'list']);

        // CRUD routes for content and listings by verhuurders
        Route::post('/d/create', [ContentController::class, 'store'])->name('content.store');
        Route::put('/d/{id}', [ContentController::class, 'update'])->name('content.update');
        Route::delete('/d/{id}', [ContentController::class, 'delete'])->name('content.destroy');
        Route::post('/auth/update', [AuthController::class, 'update'])->name('user.update');
    });
});
Route::middleware('auth:sanctum')->post('/auth/update-profile', [AuthController::class, 'updateProfile']);

// guest view
Route::get('/content', [ContentController::class, 'guest'])->name('content.index');
Route::get('/content-latest', [ContentController::class, 'guest_latest'])->name('content.latest');
Route::post('/content/{id}', [ContentController::class, 'show'])->name('content.show');
