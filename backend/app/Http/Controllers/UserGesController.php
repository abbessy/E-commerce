<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class UserGesController extends Controller
{


    public function getAllUsers()
    {
        
        // get All Users From Database
        $users = User::all();
        return response()->json($users);

    }


    public function storeUser(Request $request)
    {
        //POST(request)
        // Store all information of Users to Database
        //in_array()

        $user = new User();


        // text data
        $user->name = $request->input('name');
        $user->email = $request->input('email');
        $user->password = app('hash')->make($request->password);
        $user->user_type = $request->input('user_type');

        $user->save();
        return response()->json($user);


    }


    public function showUser($id)
    {
        // GET(id)
        // show each product by its ID from database
        $user = User::find($id);
        return response()->json($user);
    }


    public function updateUser(Request $request, $id)
    {
        
        // Update Info by Id

        $this->validate($request, [
            'name' => 'required',
            'email' => 'required',
            'password' => 'required',
            'user_type' => 'required'
         ]);

        $user = User::find($id);

        // text Data
        $user->name = $request->input('name');
        $user->email = $request->input('email');
        $user->password = app('hash')->make($request->password);
        $user->user_type = $request->input('user_type');

        $user->save();

        return response()->json($user);

    }


    public function destroyUser($id)
    {
        // DELETE(id)
        // Delete by Id
        $user = User::find($id);
        $user->delete();
        return response()->json('User Deleted Successfully');

    }
}