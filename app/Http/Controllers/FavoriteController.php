<?php
namespace App\Http\Controllers;

use App\Models\Favorite;
use App\Models\Content;
use Illuminate\Http\Request;

class FavoriteController extends Controller
{
    protected $notificationController;

    public function __construct(NotificationController $notificationController)
    {
        $this->notificationController = $notificationController;
    }

    public function index()
    {
        $favorites = auth()->user()->favorites()->with('content')->get();

        return response()->json([
            'success' => true,
            'favorites' => $favorites
        ]);
    }

    public function add($id)
    {
        $content = Content::findOrFail($id);

        // Check if it's already favorited
        $exists = auth()->user()->favorites()->where('content_id', $id)->exists();
        if ($exists) {
            return response()->json([
                'success' => false,
                'message' => 'This property is already in your favorites'
            ], 409);
        }

        // Create a new favorite
        Favorite::create([
            'user_id' => auth()->user()->id,
            'content_id' => $content->id
        ]);

        // Send notification for adding to favorites
        $this->notificationController->sendFavoriteNotification($content, 'added');

        return response()->json([
            'success' => true,
            'message' => 'Property added to favorites'
        ]);
    }

    public function remove($id)
    {
        $content = Content::findOrFail($id);

        // Remove the favorite if it exists
        $favorite = auth()->user()->favorites()->where('content_id', $id)->first();
        if (!$favorite) {
            return response()->json([
                'success' => false,
                'message' => 'This property is not in your favorites'
            ], 404);
        }

        $favorite->delete();

        // Send notification for removing from favorites
        $this->notificationController->sendFavoriteNotification($content, 'removed');

        return response()->json([
            'success' => true,
            'message' => 'Property removed from favorites'
        ]);
    }
}
