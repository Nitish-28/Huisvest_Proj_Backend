<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Content;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    function list() {
        // list all open apartements or houses that's connected to authenticated user
        $user = Auth::user();
        $content = Content::where('user_id', $user->id)
                    ->where('availability', 'available')
                    ->get();
        if(!$content){return response()->json('No content found');};
        return response()->json($content);
    }
}
