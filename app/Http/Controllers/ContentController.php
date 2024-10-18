<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Content;
use Illuminate\Support\Facades\Auth; // <-- Import Auth facade

class ContentController extends Controller
{
    public function store(Request $request)
    {
        // Validate incoming request
        $validated = $request->validate([
            'type' => 'required|string',
            'availability' => 'required|boolean',
            'address' => 'required|string',
            'city' => 'required|string',
            'state' => 'required|string',
            'zip' => 'required|string',
            'price' => 'required|numeric',
            'description' => 'nullable|string',
            'm2' => 'required|numeric',
            'bedrooms' => 'required|integer',
            'bathrooms' => 'required|integer',
            'image' => 'required|string',
        ]);

        // Get the authenticated user
        $user = Auth::user();

        // Ensure user is authenticated
        if (!$user) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        // Create the content with the logged-in user's ID
        $content = Content::create([
            'type' => $validated['type'],
            'availability' => $validated['availability'],
            'address' => $validated['address'],
            'city' => $validated['city'],
            'state' => $validated['state'],
            'zip' => $validated['zip'],
            'price' => $validated['price'],
            'description' => $validated['description'],
            'm2' => $validated['m2'],
            'bedrooms' => $validated['bedrooms'],
            'bathrooms' => $validated['bathrooms'],
            'image' => $validated['image'],
            'user_id' => $user->id, // <-- Automatically assign user_id
        ]);

        return response()->json([
            'message' => 'Content created successfully',
            'content' => $content
        ], 201);
    }
}
