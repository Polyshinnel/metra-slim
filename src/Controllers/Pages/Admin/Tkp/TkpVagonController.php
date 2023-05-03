<?php


namespace App\Controllers\Pages\Admin\Tkp;


use App\Models\TkpVagon;

class TkpVagonController
{
    public static function getAllTkpVagon() {
        return TkpVagon::all()->toArray();
    }
}