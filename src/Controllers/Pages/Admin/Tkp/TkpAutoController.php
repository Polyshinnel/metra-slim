<?php


namespace App\Controllers\Pages\Admin\Tkp;


use App\Models\TkpAuto;

class TkpAutoController
{
    public static function getAllTkpAuto() {
        return TkpAuto::all()->toArray();
    }
}