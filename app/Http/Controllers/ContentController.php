<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Content;
use Illuminate\Support\Facades\Validator;

class ContentController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $contents = Content::all();
        //return json
        return response()->json($contents);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //return json
        return response()->json(['message' => 'Create form']);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // Validate the request data
        $validator = Validator::make($request->all(), [
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
                'message' => 'Oeps! Urk is niet toegestaan' ], 422);
        }

        // If validation fails, return error message
        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->first()
            ], 422);
        }

        // Merge the authenticated user's ID into the request data
        $data = $request->all();
        $data['user_id'] = auth()->user()->id; // Add the user ID

        // Create the content with the merged data
        Content::create($data);

        // Return success response
        return response()->json(['message' => 'Content created successfully']);
    }


    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $content = Content::findOrFail($id);
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
                'message' => 'ga maar weg inteelt' ], 422);
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
