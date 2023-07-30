<?php


namespace App\Controllers\Pages\Admin\Tkp;


use App\Models\TkpPlatform;
use App\Models\TkpPlatformProducts;

class TkpPlatformController
{
    public static function getAllTkpPlatform() {
        return TkpPlatform::all()->toArray();
    }

    public static function getTkpId($id) {
        $tkpInfo = TkpPlatform::where('id', $id)->get()->toArray();
        $tkpProducts = TkpPlatformProducts::where('tkp_id', $id)->get()->toArray();
        return [
            'info' => $tkpInfo[0],
            'products' => $tkpProducts
        ];
    }
}