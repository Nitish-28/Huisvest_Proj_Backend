<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Notifications;

class NotificationController extends Controller
{
    public function sendNotification(Request $request)
    {
        $notification = Notifications::create([
            'message' => 'New bidder has arrived!',
            'read' => false,
            'sender_id' => auth()->id(),    // current authenticated user
            'receiver_id' => $request->input('receiver_id'), // user receiving the notification
        ]);

        return response()->json(['message' => 'Notification sent successfully']);
    }
    public function markAsRead($notificationId)
    {
        $notification = Notifications::find($notificationId);
        $notification->read = true;
        $notification->save();

        return response()->json(['message' => 'Notification marked as read']);
    }
}
