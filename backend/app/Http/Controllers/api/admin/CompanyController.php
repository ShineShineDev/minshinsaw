<?php

namespace App\Http\Controllers\api\admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\admin\CompanyRequest;
use App\Http\Resources\api\app\CompanyRsource;
use App\Http\Resources\api\app\EmployeeResource;
use App\Models\Company;
use App\Models\Employee;
use App\Models\User;
use App\Traits\api\ApiResponser;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use Carbon\Carbon;


class CompanyController extends Controller
{
    use ApiResponser;

    function dashboardData(Request $request){
        $statistics = [
            "companies_count" => Company::count(),
            'emp_count' => Employee::count(),
            'user_count' => User::count(),
        ];
        return $this->successResponse('Statistics', $statistics, 200);
    }

    function recent(Request $request){
        $today = Carbon::today();
        $companies = Company::whereDate('created_at', $today)->get();
        $emp = Employee::whereDate('created_at', $today)->get();
        $recent = [
            "companies" => CompanyRsource::collection($companies),
            'emp' => EmployeeResource::collection($emp)
        ];
        return $this->successResponse('Recent', $recent, 200);
    }
    
    public function index()
    {
        $companys = Company::orderByDesc("id")->get();
        $res = CompanyRsource::collection($companys);
        return $this->successResponse('Companies', $res, 200);
    }

    public function show($id, Request $request)
    {
        $company = Company::find($id);
        $res = new CompanyRsource($company);
        return $this->successResponse('Company', $res, 200);
    }

    public function store(CompanyRequest $request)
    {
        if($request->user()->role != 'admin'){
            return $this->errorResponse("admin only",401) ;
        }

        if ($request->hasFile('logo') && $request->file('logo')->isValid()) {
            $logoFile = $request->file('logo');
            $logoFileName = uniqid('logo_', true) . '.' . $logoFile->getClientOriginalExtension();
            $logoPath = $logoFile->storeAs('logos', $logoFileName, 'public');
        } else {
            $logoPath = null;
        }
        $input = $request->only("name", "phone", "email", "website");
        $input['logo'] = $logoPath;
        $company = Company::create($input);
        $res = new CompanyRsource($company);
        return $this->successResponse('Company', $res, 200);
    }

    public function update(CompanyRequest $request, $id)
    {
        if($request->user()->role != 'admin'){
            return $this->errorResponse("admin only",401) ;
        }
        $company = Company::findOrFail($id);
        if ($request->hasFile('logo') && $request->file('logo')->isValid()) {
            if ($company->logo) {
                Storage::disk('public')->delete($company->logo);
            }
            $logoFile = $request->file('logo');
            $logoFileName = uniqid('logo_', true) . '.' . $logoFile->getClientOriginalExtension();
            $logoPath = $logoFile->storeAs('logos', $logoFileName, 'public');
        } else {
            $logoPath = $company->logo;
        }

        $input = $request->only("name", "phone", "email", "website");
        $input['logo'] = $logoPath;
        $company->update($input);
        $res = new CompanyRsource($company);
        return $this->successResponse('Company updated successfully', $res, 200);
    }

    public function destroy($id,Request $request)
    {
        if($request->user()->role != 'admin'){
            return $this->errorResponse("admin only",401) ;
        }
        Company::destroy($id);
        return $this->successResponse('deleted', [], 200);
    }
}


