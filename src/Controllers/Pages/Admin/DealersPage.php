<?php


namespace App\Controllers\Pages\Admin;


use App\Models\User;

class DealersPage
{
    public static function getAllUsers() {
        return User::all()->toArray();
    }
}