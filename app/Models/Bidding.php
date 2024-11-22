<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Notifications;

class Bidding extends Model
{
    use HasFactory;

    protected $fillable = ['sender_id', 'receiver_id', 'house_id', 'bid'];

    public function content()
    {
        return $this->belongsTo(Content::class, 'house_id');
    }

    /**
     * The user who places the bid.
     */
    public function sender()
    {
        return $this->belongsTo(User::class, 'sender_id');
    }

    /**
     * The user who receives the bid.
     */
    public function receiver()
    {
        return $this->belongsTo(User::class, 'receiver_id');
    }

    /**
     * Notify the receiver when a bid is placed.
     */
    public function notifyReceiver()
    {
        Notifications::create([
            'message' => 'A new bid has been placed!',
            'read' => false,
            'sender_id' => $this->sender_id,    // sender is the one who placed the bid
            'receiver_id' => $this->receiver_id, // receiver is the one who gets the notification
        ]);
    }
}
