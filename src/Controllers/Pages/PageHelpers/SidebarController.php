<?php


namespace App\Controllers\Pages\PageHelpers;


use App\Models\SidebarUser;

class SidebarController
{
    public static function getSidebar()
    {
        return SidebarUser::all()->toArray();
    }
}