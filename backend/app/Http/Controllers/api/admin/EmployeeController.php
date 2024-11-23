<?php

namespace App\Http\Controllers\api\admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\admin\StoreEmployeeRequest;
use App\Http\Requests\admin\UpdateEmployeeRequest;
use App\Http\Resources\api\app\EmployeeResource;
use App\Models\Employee;
use App\Traits\api\ApiResponser;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;


class EmployeeController extends Controller
{
    use ApiResponser;
    public function index()
    {
        $companys = Employee::with('company')->orderByDesc("id")->get();
        $res = EmployeeResource::collection($companys);
        return $this->successResponse('Employees', $res, 200);
    }

    public function show($id,Request $request)
    {
        $company = Employee::with('company')->where("id",$id)->first();
        $res = new EmployeeResource($company);
        return $this->successResponse('Employees', $res, 200);
    }

    public function store(StoreEmployeeRequest $request)
    {
        if($request->user()->role != 'admin'){
            return $this->errorResponse("admin only",401) ;
        }
        if ($request->hasFile('profile') && $request->file('profile')->isValid()) {
            $logoFile = $request->file('profile');
            $logoFileName = uniqid('profile_', true) . '.' . $logoFile->getClientOriginalExtension();
            $logoPath = $logoFile->storeAs('profile', $logoFileName, 'public');
        } else {
            $logoPath = null;
        }
        $input = $request->only("name", "phone", "email","companies_id");
        $input['profile'] = $logoPath;
        $company = Employee::create($input);
        $res = new EmployeeResource($company);
        return $this->successResponse('Employee', $res, 200);
    }

    public function update(UpdateEmployeeRequest $request, $id)
    {
        if($request->user()->role != 'admin'){
            return $this->errorResponse("admin only",401) ;
        }
        $company = Employee::findOrFail($id);
        if ($request->hasFile('profile') && $request->file('profile')->isValid()) {
            if ($company->logo) {
                Storage::disk('public')->delete($company->logo);
            }
            $logoFile = $request->file('profile');
            $logoFileName = uniqid('profile_', true) . '.' . $logoFile->getClientOriginalExtension();
            $logoPath = $logoFile->storeAs('profile', $logoFileName, 'public');
        } else {
            $logoPath = $company->profile;
        }

        $input = $request->only("name", "phone", "email", "companies_id");
        $input['profile'] = $logoPath;
        $company->update($input);
        $res = new EmployeeResource($company);
        return $this->successResponse('Employee updated successfully', $res, 200);
    }

    public function destroy($id,Request $request)
    {
        if($request->user()->role != 'admin'){
            return $this->errorResponse("admin only",401) ;
        }
        Employee::destroy($id);
        return $this->successResponse('deleted', [], 200);
    }
}


