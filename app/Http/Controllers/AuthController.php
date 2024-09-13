<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class AuthController extends Controller
{
    // login function give email , password via POST req
    public function login(Request $request) {

        // validate request information
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        // grab data after validation
        $data = $request->only('email', 'password');

        // attempt login via sanctum authentication
        if(Auth::attempt($data)) {

            // if auth is successfull, grab user and save
            $user = Auth::user();

            if ($user->tokens()->count() > 0) 
            {
                $user->tokens()->delete();
                $token = $user->createToken('Access Token')->plainTextToken;
            } 
                // if user has no tokens, create new one
                else 
                {
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
