<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Notifications;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Facades\JWTAuth;
class AuthController extends Controller
{
    public function getUserProfile()
    {
        $user = auth()->user();
        
        if (file_exists(asset($user->profile_picture))) {
            $user->profile_picture_url = asset($user->profile_picture);
        } else {
            $user->profile_picture_url = asset('storage/profile_pictures/default-avatar.png');
        }
        return response()->json($user);
    }
    public function uploadProfilePicture(Request $request)
    {
        $request->validate([
            'profile_picture' => 'required|image|mimes:jpg,jpeg,png',
        ]);
        $user = auth()->user();

        if ($user->profile_picture) {
            $oldImagePath = public_path($user->profile_picture);
            if (file_exists($oldImagePath)) {
                unlink($oldImagePath);
            }
        }
        $imageName = time() . '.' . $request->profile_picture->extension();

        // Store file in 'public/profile_pictures'
        $request->profile_picture->storeAs('public/profile_pictures', $imageName);

        // Optionally save image path in user profile
        $user->profile_picture = 'storage/profile_pictures/' . $imageName;
        $user->save();

        return response()->json(['message' => 'Profile picture uploaded successfully', 'path' => $user->profile_picture]);
    }
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if (Auth::attempt($request->only('email', 'password'))) {
            $user = Auth::user();

            // Delete token + create a new one
            $user->tokens()->delete();
            $token = $user->createToken('Access Token')->plainTextToken;

            return response()->json([
                'success' => true,
                'token' => $token,
                'user' => [
                    'id' => $user->id,
                    'email' => $user->email,
                    'role' => $user->getRoleNames()->first(), // Getting the first role
                ]
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

        return response()->json(data: [
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
        // Check if user is authenticated with current token
        if (Auth::check()) {
            return response()->json([
                'success' => true,
                'message' => 'Token is valid',
                'user' => Auth::user(),
                'isSeller' => Auth::user()->hasRole('verhuurder'),
            ]);
        }

        return response()->json([
            'success' => false,
            'message' => 'Token is invalid or expired'
        ], 401);
    }
    public function update(Request $request)
    {
        $request->validate([
            'name' => 'sometimes|required|max:255',
            'email' => 'sometimes|required|email|max:255',
            'password' => 'sometimes|required|max:255',
            'image' => 'sometimes|image|mimes:jpeg,png,jpg,gif|max:2048', // Example validation for image
        ]);

        $user = Auth::user();

        if ($request->has('name')) {
            $user->name = $request->name;
        }

        if ($request->has('email')) {
            $user->email = $request->email;
        }

        if ($request->has('password')) {
            $user->password = Hash::make($request->password);
        }

        if ($request->hasFile('image')) {
        }

        $user->save();

        return response()->json(['success' => true, 'user' => $user]);
    }
    public function getUserData(Request $request)
    {
        $user = $request->user();
        return response()->json(['success' => true, 'user' => $user]);
    }

    public function updateProfile(Request $request)
    {
        $request->validate([
            'name' => 'sometimes|required|max:255',
            'email' => 'sometimes|required|email|max:255',
            'password' => 'sometimes|required|max:255',
            'profile_picture' => 'sometimes|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        $user = Auth::user();

        if (!$user->hasRole('verhuurder')) {
            $user->assignRole('verhuurder');
        }

        if ($request->has('name')) {
            $user->name = $request->name;
        }

        if ($request->has('email')) {
            $user->email = $request->email;
        }

        if ($request->has('password')) {
            $user->password = Hash::make($request->password);
        }

        if ($request->hasFile('profile_picture')) {
            if ($user->profile_picture) {
                $oldImagePath = public_path($user->profile_picture);
                if (file_exists($oldImagePath)) {
                    unlink($oldImagePath);
                }
            }
            $imageName = time() . '.' . $request->profile_picture->extension();
            $request->profile_picture->storeAs('public/profile_pictures', $imageName);
            $user->profile_picture = 'storage/profile_pictures/' . $imageName;
        }

        $user->save();

        return response()->json(['success' => true, 'user' => $user]);
    }
}
