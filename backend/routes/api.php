<?php


use App\Http\Controllers\api\admin\AuthController;

use App\Http\Controllers\api\admin\CompanyController;
use App\Http\Controllers\api\admin\EmployeeController;
use Illuminate\Support\Facades\Route;

Route::post('login', [AuthController::class, 'login']);

Route::middleware('auth:api')->group(function () {
    Route::apiResource('companies', CompanyController::class);
    Route::post('companies/{id}', [CompanyController::class,'update']);
    Route::apiResource('employees', EmployeeController::class);
    Route::post('employees/{id}', [EmployeeController::class,'update']);
    
    Route::get('users', [AuthController::class,'getUsers']);
    Route::post('register', [AuthController::class, 'register']);

    Route::get('statistics', [CompanyController::class, 'dashboardData']);
    Route::get('recent', [CompanyController::class, 'recent']);
    Route::post('update-role', [AuthController::class,'updateRole']);
});
