<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Content;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ContentController extends Controller
{

    // guest functies voor homepage
    public function guest(Request $request)
    {
        $query = Content::query();


        // Apply filters if provided in the request
        if ($request->has('type') && $request->type !== 'All') {
            $query->where('type', $request->type);
        }
        if ($request->has('availability') && $request->availability !== "All") {
            $query->where('availability', $request->availability);
        }
        if ($request->has('city')) {
            $query->where('city', 'like', '%' . $request->city . '%');
        }
        if ($request->has('price_min')) {
            $query->where('price', '>=', $request->price_min);
        }
        if ($request->has('price_max')) {
            $query->where('price', '<=', $request->price_max);
        }
        if ($request->has('sort')) {
            if ($request->sort === 'up') {
                $query->orderBy('price', 'asc');
            } elseif ($request->sort === 'down') {
                $query->orderBy('price', 'desc');
            }
        }
        if ($request->has('search')) {
            $searchTerm = $request->search;
            $query->where(function ($q) use ($searchTerm) {
                $q->where('zip', 'like', '%' . $searchTerm . '%')
                    ->orWhere('city', 'like', '%' . $searchTerm . '%')
                    ->orWhere('address', 'like', '%' . $searchTerm . '%');
            });
        }

        $contents = $query->select('id', 'type', 'availability', 'address', 'city', 'zip', 'price', 'bedrooms', 'm2', 'bathrooms', 'created_at')->paginate(10);

        // Return JSON response
        return response()->json([
            'data' => $contents->items(),
            'total' => $contents->total(),
            'last_page' => $contents->lastPage(),
        ]);
    }

    // guest functie gestorteerd op laatst toegevoegd 
    public function guest_latest()
    {
        $contents = Content::select('id', 'type', 'availability', 'address', 'city', 'zip', 'price', 'created_at')->orderBy('created_at', 'desc')->paginate(10);
        //return json
        return response()->json($contents);
    }

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

    public function getTotalViewsForUser()
    {
        $user = Auth::user();
        $totalViews = Content::where('user_id', $user->id)->sum('views');

        return $totalViews;
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $content = Content::findOrFail($id);
        $content->increment('views');
        //return json
        return response()->json($content);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $content = Content::findOrFail($id);
        //return json
        return response()->json($content);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $content = Content::findOrFail($id);

        $request->validate([
            'type' => 'required|in:house,apartment',
            'address' => 'required|string|max:255',
            'city' => 'required|string|max:255',
            'state' => 'required|string|max:255',
            'zip' => 'required|string|max:10',
            'availability' => 'required|boolean',
            'price' => 'required|numeric',
            'm2' => 'required|integer',
            'bedrooms' => 'required|integer',
            'bathrooms' => 'required|integer',
            'image' => 'required|string',
        ]);

        //if state = 'urk' return error
        if ($request->city == 'Urk') {
            return response()->json([
                'success' => false,
                'message' => 'ga maar weg inteelt'
            ], 422);
        }

        $content->update($request->all());
        //return json
        return response()->json(['message' => 'Content updated successfully']);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function delete(string $id)
    {
        $content = Content::findOrFail($id);
        $content->delete();
        //return json
        return response()->json(['message' => 'Content deleted successfully']);
    }
}
