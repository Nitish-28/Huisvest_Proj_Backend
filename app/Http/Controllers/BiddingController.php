<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Models\Bidding;

class BiddingController extends Controller
{
    public function placeBid(Request $request)
    {
        // Validate request
        $data = $request->validate([
            'receiver_id' => 'required|exists:users,id',
            'house_id' => 'required|exists:contents,id',
            'bid' => 'required',
        ]);

        // Create bid
        $bidding = Bidding::create([
            'sender_id' => Auth::id(),
            'receiver_id' => $data['receiver_id'],
            'house_id' => $data['house_id'],
            'bid' => $data['bid'],
        ]);

        // Notify receiver
        $bidding->notifyReceiver();

        return response()->json(['message' => 'Bid placed and notification sent']);
    }

    public function removeBid(Request $request)
    {
        $data = $request->validate([
            'bid_id' => 'required|exists:biddings,id',
        ]);

        $bid = Bidding::find($data['bid_id']);

        if ($bid->sender_id !== Auth::id()) {
            return response()->json(['message' => 'Unauthorized to delete this bid'], 403);
        }

        $bid->delete();

        return response()->json(['message' => 'Bid removed successfully'], 200);
    }


    public function getBids(Request $request)
    {
        $userId = Auth::id();

        // Get all bids for the authenticated user
        $bids = Bidding::where('sender_id', $userId)
            ->orWhere('receiver_id', $userId)
            ->with('content') // Eager load the related content
            ->get();

        // Add the highest bid for each house
        $bids->each(function ($bid) {
            $highestBid = Bidding::where('house_id', $bid->house_id)
                ->max('bid'); // Get the highest bid for the same house
            $bid->highest_bid = $highestBid; // Add as a dynamic property
        });

        return response()->json($bids, 200);
    }
}
