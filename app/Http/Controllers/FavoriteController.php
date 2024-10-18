<?php
namespace App\Http\Controllers;

use App\Models\Favorite;
use App\Models\Content;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class FavoriteController extends Controller
{
    protected $notificationController;

    public function __construct(NotificationController $notificationController)
    {
        $this->notificationController = $notificationController;
    }

    public function save($id)
    {
        $user = Auth::user();
        $user->favorites()->attach($id);
        return response()->json(['message' => 'House saved successfully'], 200);
    }
    
    public function unsave($id)
    {
        $user = Auth::user();
        $user->favorites()->detach($id);
        return response()->json(['message' => 'House unsaved successfully'], 200);
    }
    
    public function getSavedHouses()
    {
        $user = Auth::user();
        $houses = $user->favorites()->get();
        return response()->json($houses);
    }

}
