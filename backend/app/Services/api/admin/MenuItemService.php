<?php
namespace App\Services\api\admin;

use App\Repositories\MenuItemRepository;
use App\Repositories\StockRepository;
use App\Traits\FileUpload;

class MenuItemService
{
    use FileUpload;

    function store($request)
    {
        $input = $request->only("name", "product_category_id", "price", "discount_price", "description", "ingredients", "allergen_information");
        $input['item_code'] = $this->generateItemCode();
        if ($request->thumbnail) {
            $upload_path = $this->uploadFile($request->thumbnail, '/uploads/menuitem/', 'spideyshine');
            $input["thumbnail"] = $upload_path;
        }
        return MenuItemRepository::store($input);
    }
    function update($id, $request)
    {
        $input = $request->only("name", "product_category_id", "price", "discount_price", "description", "ingredients", "allergen_information");
        return MenuItemRepository::update($id,$input);
    }
    private function generateItemCode()
    {
        $item_code = MenuItemRepository::getLatestItemCode();
        $numericPart = intval($item_code);
        $nonNumericPart = ltrim($item_code, '0123456789');
        return ++$numericPart . $nonNumericPart;
    }
}




