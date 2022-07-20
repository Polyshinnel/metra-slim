<?php


namespace App\Controllers;


use App\Models\User;

class UserController
{
    public static function authUser($data)
    {
        $userName = $data['username'];
        $userPass = md5($data['password']);

        $queryArr = [
            'mail' => $userName,
            'pass' => $userPass
        ];

        $user = User::where($queryArr)->get()->toArray();
        if(!empty($user))
        {
            $userInfo = $user[0];
            setcookie('user',$userInfo,time() + 3600*24,'/');
            return 'auth success';
        }
        else
        {
            return 'Не правильный логин или пароль';
        }
    }

    public static function registerUser($data)
    {

    }

    public static function restorePass($data)
    {

    }

    public static function checkUserAuth()
    {
        if(isset($_COOKIE['user']))
        {
            $id = $_COOKIE['user'];
            $userInfo = User::where('id',$id)->first()->toArray();
            $adminStatus = $userInfo['admin_status'];
            $name = $userInfo['name'];
            $userData = [
                'name' => $name,
            ];

            if($adminStatus)
            {
                $folder = 'user';
            }
            else
            {
                $folder = 'admin';
            }

            $userData['folder'] = $folder;

            return $userData;
        }
        else
        {
            return false;
        }
    }
}