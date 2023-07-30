<?php


namespace App\Controllers\Pages\Admin\Tkp;


use App\Models\TkpVagon;
use App\Models\TkpVagonProducts;

class TkpVagonController
{
    public static function getAllTkpVagon() {
        return TkpVagon::all()->toArray();
    }

    public static function getTkpId($id) {
        $tkpInfo = TkpVagon::where('id', $id)->get()->toArray();
        $tkpProducts = TkpVagonProducts::where('tkp_id', $id)->get()->toArray();
        return [
            'info' => $tkpInfo[0],
            'products' => $tkpProducts
        ];
    }
}