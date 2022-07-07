<?php


namespace App\Controllers;


use App\Models\User;

class UserController
{
    public static function authUser($data)
    {

    }

    public static function registerUser($data)
    {

    }

    public static function checkUserAuth()
    {
        if(isset($_COOKIE['user']))
        {
            $id = $_COOKIE['user'];
            $userInfo = User::where('id',$id)->first()->toArray();
            $adminStatus = $userInfo['admin_status'];
            if($adminStatus)
            {
                $folder = 'user';
            }
            else
            {
                $folder = 'admin';
            }
            return $folder;
        }
        else
        {
            return false;
        }
    }
}