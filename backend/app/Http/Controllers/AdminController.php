<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function adminRegister(Request $request)
    {
        $name = $request->name;
        $email = $request->email;
        $password = $request->password;
        $user_type = $request->user_type;


        // Check if user already exist
        if (User::where('email', '=', $email)->exists()) {
            return response()->json(['status' => 'error', 'message' => 'User already exists with this email']);
        }

        // Create new user
        try {
            $user = new User();
            $user->name = $request->name;
            $user->email = $request->email;
            $user->password = app('hash')->make($request->password);
            $user->user_type = $request->user_type;

            if ($user->save()) {
                return $this->adminLogin($request); //get the access token after registration
            }
        } catch (\Exception $e) {
            return response()->json(['status' => 'error', 'message' => $e->getMessage()]);
        }
    }


    public function adminLogin(Request $request)
    {
        $email = $request->email;
        $password = $request->password;
        $user_type= $request->user_type;

        $credentials = request(['email', 'password','user_type']);

        //Generate a token for the user if the credentials are valid 
        // if not valid, return error
        if (!$token = auth()->attempt($credentials)) {
            return response()->json(['error' => 'Email/Password Incorrect'], 401);
        }

        return $this->respondWithToken($token);
        
    }

    public function user(){
        return auth()->user();
    }


    /**
     * Get the token array structure.
     *
     * @param string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 60,
            'user' => auth()->user()
        ]);
    }
}