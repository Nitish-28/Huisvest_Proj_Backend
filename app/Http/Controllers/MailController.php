<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Models\EmailVerification; 
use Exception;
use App\Models\User;

class MailController extends Controller
{
    public function send(Request $request)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'user_email' => 'required'
        ]);

        $userId = $request->input('user_id');
        $recipientEmail = $request->input('user_email');

        $verificationCode = random_int(1000, 9999);

        try {
            Mail::raw('Your verification code is: ' . $verificationCode, function ($message) use ($recipientEmail) {
                $message->to($recipientEmail)
                        ->subject('Huisvest verification code');
            });

            // Save to the database
            EmailVerification::create([
                'email' => $recipientEmail,
                'user_id' => $userId,
                'verification_code' => $verificationCode,
            ]);

            return response()->json(['message' => 'Email sent successfully']);
        } catch (Exception $e) {
            return response()->json(['message' => 'Failed to send email', 'error' => $e->getMessage()], 500);
        }
    }

    public function verify(Request $request) {
        // Validate the incoming request
        $request->validate([
            'verification_code' => 'required',
            'email' => 'required|email'
        ]);
    
    
        // Retrieve the email verification record for the authenticated user
        $emailVerification = EmailVerification::where('email', $request->input('email'))
            ->where('email', $request->input('email')) // Assuming you want to check against the user's email
            ->latest() // Get the latest verification record
            ->first();
    
        // Check if the email verification record exists and the verification code matches
        if ($emailVerification && $emailVerification->verification_code == $request->input('verification_code')) {
            $emailVerification->delete();
            $user = User::where('email', $request->input('email'))->first();
        if ($user) {
            $user->email_verified_at = now()->addHours(2);
            $user->save();
        }
            return response()->json(['message' => 'Verification successful'], 200);
        }
    
        return response()->json(['message' => 'Invalid verification code'], 401);
    }
}
