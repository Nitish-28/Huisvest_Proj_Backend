<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Models\Bidding;

class BiddingController extends Controller
{
    public function placeBid(Request $request)
    {

        //validate request
        $data = $request->validate([
            'receiver_id' => 'required|exists:users,id',
            'bid' => 'required',
            
        ]);
        

        //create bid
        $bidding = Bidding::create([
            'sender_id' => Auth::id(),
            'receiver_id' => $data['receiver_id'],
            'bid' => $data['bid'],
        ]);

        //notify receiver
        $bidding->notifyReceiver();

        return response()->json(['message' => 'Bid placed and notification sent']);
    }
}
