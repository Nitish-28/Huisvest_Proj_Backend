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
        $notification->read = true;
        $notification->save();

        return response()->json(['message' => 'Notification marked as read']);
    }
}
