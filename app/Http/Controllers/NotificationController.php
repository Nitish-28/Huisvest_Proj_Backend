<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Notifications;

class NotificationController extends Controller
{
    public function sendNotification(Request $request)
    {
        $request->validate([
            'message' => 'required|max:255',
            'receiver_id' => 'required'
        ]);

        $notification = Notifications::create([
            'message' => $request->input('message'),
            'read' => false,
            'sender_id' => auth()->id(),
            'receiver_id' => $request->input('receiver_id'),
        ]);

        return response()->json(['message' => 'Notification sent successfully']);
    }

    public function markAsRead($notificationId)
    {
        $notification = Notifications::find($notificationId);
        
        if (!$notification) {
            return response()->json(['message' => 'Notification not found'], 404);
        }

        $notification->read = true;
        $notification->save();

        return response()->json(['message' => 'Notification marked as read']);
    }

    // Method to send favorite notifications
    public function sendFavoriteNotification($content, $action)
    {
        $message = $action === 'added'
            ? "You added {$content->address} to your favorites."
            : "You removed {$content->address} from your favorites.";

        Notifications::create([
            'message' => $message,
            'read' => false,
            'sender_id' => auth()->id(),
            'receiver_id' => auth()->id(), // Assuming the user receives their own notifications
        ]);
    }
    //method to show notificatons
    public function showNotifications()
    {
        $notifications = Notifications::where('receiver_id', auth()->id())->get();

        return response()->json($notifications);
    }
}
