<?php


namespace App\Controllers\Pages\Admin\Tkp;


use App\Models\TkpAuto;
use App\Models\TkpAutoProducts;

class TkpAutoController
{
    public static function getAllTkpAuto() {
        return TkpAuto::all()->toArray();
    }

    public static function getTkpId($id) {
        $tkpInfo = TkpAuto::where('id', $id)->get()->toArray();
        $tkpProducts = TkpAutoProducts::where('tkp_id', $id)->get()->toArray();
        return [
            'info' => $tkpInfo[0],
            'products' => $tkpProducts
        ];
    }
}