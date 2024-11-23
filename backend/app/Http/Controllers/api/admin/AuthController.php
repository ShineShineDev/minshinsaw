<?php

namespace App\Http\Controllers\api\admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Traits\api\ApiResponser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    use ApiResponser;
    public function login(Request $request)
    {
        $validator = $this->isIncludeFields($request, "email,password");
        if ($validator->fails())
            return $this->respondValidationErrors("Validation Error", $validator->errors(), 400);

        $info = $this->check($request);
        return $info ? $this->successResponse("Admin Login Success", $info, 200) :
            $this->errorResponse('Credentials Not Found', 403);
    }
    function register(Request $request)
    {
        if ($request->user()->role != 'admin') {
            return $this->errorResponse("admin only", 401);
        }
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6',
            'role' => 'required|string|in:admin,manager,user',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors()
            ], 422);
        }
        $user = User::create([
            'name' => $request->input('name'),
            'email' => $request->input('email'),
            'password' => Hash::make($request->input('password')),
            'role' => $request->input('role'),
        ]);
        return [
            'user' => [
                "id" => $user->id,
                "name" => $user->name,
                "email" => $user->email,
                "role" => $user->role
            ],
        ];
    }
    private function check($request)
    {
        $user = User::query()->whereEmail($request->email)->first();
        if (empty($user) || !Hash::check($request->password, $user->password))
            return false;

        $token = $user->createToken('admin_api')->accessToken;
        return [
            'user' => [
                "id" => $user->id,
                "name" => $user->name,
                "email" => $user->email,
                "role" => $user->role
            ],
            'token' => $token
        ];
    }

    public function getUsers(Request $request)
    {
        if ($request->user()->role != 'admin') {
            return $this->errorResponse("admin only", 401);
        }
        $users = User::all();
        return $this->successResponse("users list", $users, 200);
    }

    public function updateRole(Request $request)
    {
        if ($request->user()->role != 'admin') {
            return $this->errorResponse("admin only", 401);
        }
        $user = User::find($request->id);
        if ($request->role) {
            $user->role = $request->role;
            $user->save();
        }
        return $this->successResponse("updateRole", $user, 200);
    }
}
