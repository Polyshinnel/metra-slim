<?php


namespace App\Controllers\Pages\PageHelpers;


use App\Models\SidebarAdmin;
use App\Models\SidebarUser;

class SidebarController
{
    public static function getSidebar()
    {
        return SidebarUser::all()->toArray();
    }

    public static function getAdminSidebar() {
        return SidebarAdmin::all()->toArray();
    }
}