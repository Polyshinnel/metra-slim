<?php


namespace App\Controllers\Pages\Admin\Tkp;


use App\Models\TkpBundle;

class TkpUpdateController
{
    public static function getAllTkpUpdate() {
        return TkpBundle::all()->toArray();
    }
}