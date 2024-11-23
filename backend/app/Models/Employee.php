<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'email',
        'phone',
        'profile',
        'companies_id'
    ];
    function company(){
        return $this->belongsTo(Company::class,'companies_id','id');
    }
}
