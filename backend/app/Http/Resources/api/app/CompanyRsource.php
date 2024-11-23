<?php

namespace App\Http\Resources\api\app;

use Carbon\Carbon;

use Illuminate\Http\Resources\Json\JsonResource;


class CompanyRsource extends JsonResource
{

    public function toArray($request)
    {

        return [
            "id" => $this->id,
            "name" => $this->name,
            "phone" => $this->phone,
            "email" => $this->email,
            "website" => $this->website,
            "logo" => asset('storage/' . $this->logo),
            "created_at" => substr($this->created_at,0,10),
        ];
    }
}







