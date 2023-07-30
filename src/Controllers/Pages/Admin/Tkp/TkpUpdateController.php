<?php


namespace App\Controllers\Pages\Admin\Tkp;


use App\Models\TkpBundle;
use App\Models\TkpBundleProducts;

class TkpUpdateController
{
    public static function getAllTkpUpdate() {
        return TkpBundle::all()->toArray();
    }

    public static function getTkpId($id) {
        $tkpInfo = TkpBundle::where('id', $id)->get()->toArray();
        $tkpProducts = TkpBundleProducts::where('tkp_id', $id)->get()->toArray();
        return [
            'info' => $tkpInfo[0],
            'products' => $tkpProducts
        ];
    }
}