<?php


namespace App\Controllers\Pages\Admin\Tkp;


use App\Models\TkpPlatform;

class TkpPlatformController
{
    public static function getAllTkpPlatform() {
        return TkpPlatform::all()->toArray();
    }
}