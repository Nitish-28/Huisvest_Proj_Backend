<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Notifications; // Import Notifications model
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        // Validate request information
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        // Attempt login via sanctum authentication
        if (Auth::attempt($request->only('email', 'password'))) {
            $user = Auth::user();

            // Delete existing tokens and create a new one
            $user->tokens()->delete();
            $token = $user->createToken('Access Token')->plainTextToken;

            return response()->json([
                'success' => true,
                'token' => $token,
                'user' => $user,
            ]);
        }

        return response()->json([
            'success' => false,
            'message' => 'Unauthorized: Wrong login information'
        ], 401);
    }

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|max:255',
            'email' => 'required|email:rfc,dns|max:255',
            'password' => 'required|max:255',
            'isSeller' => 'required|boolean'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->first()
            ], 422);
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'remember_token' => Str::random(10),
            'created_at' => now(),
        ]);

        if ($request->isSeller) {
            $user->assignRole('verhuurder');
        }

        return response()->json([
            'success' => true,
            'user' => $user,
        ]);
    }

    public function delete(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required|integer|exists:users,id',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->first()
            ], 422);
        }

        $user = User::find($request->id);

        if ($user) {
            $user->delete();
            return response()->json([
                'success' => true,
                'message' => 'User deleted successfully',
            ]);
        }

        return response()->json([
            'success' => false,
            'message' => 'User not found',
        ], 404);
    }

    public function logout(Request $request)
    {
        $user = Auth::user();
        $user->tokens()->where('id', $request->user()->currentAccessToken()->id)->delete();

        return response()->json(['message' => 'Logged out successfully']);
    }

    public function validateToken(Request $request)
{
    // Check if the user is authenticated via the current token
    if (Auth::check()) {
        return response()->json([
            'success' => true,
            'message' => 'Token is valid',
            'user' => Auth::user()
        ]);
    }

    return response()->json([
        'success' => false,
        'message' => 'Token is invalid or expired'
    ], 401);
}
}
