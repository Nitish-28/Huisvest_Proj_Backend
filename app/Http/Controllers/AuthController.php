<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class AuthController extends Controller
{
    PUBLIC FUNCTION login(Request $request) {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $data = $request->only('email', 'password');

        if(Auth::attempt($data)) {
            $user = Auth::user();

            if ($user->tokens()->count() > 0) {
                $user->tokens()->delete();
                $token = $user->createToken('Access Token')->plainTextToken;
            } else {
                $token = $user->createToken('Access Token')->plainTextToken;
            }

            return response()->json([
                'success' => true,
                'token' => $token,
                'user' => $user,
            ]);
        }

        return response()->json([
            'success' => false,
            'message' => 'Unauthorized: Wrong login information',
            401
        ]);
        
    }
}
