<?php


namespace App\Controllers\Pages\Admin;


use App\Models\Banners;

class BannerPage
{
    public static function getBanners() {
        return Banners::all()->toArray();
    }

    public static function getBanner($id) {
        return Banners::where('id', $id)->first()->toArray();
    }

    public static function createBanner($params) {
        $createArr = [
            'title' => $params['title'],
            'description' => $params['description'],
            'href' => $params['href'],
            'banner' => $params['banner']
        ];

        Banners::create($createArr);
    }
}