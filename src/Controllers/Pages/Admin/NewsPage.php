<?php


namespace App\Controllers\Pages\Admin;


use App\Models\News;

class NewsPage
{
    public static function getListNews() {
        return News::all()->toArray();
    }

    public static function createNews($data) {
        $date = $data['date_create'];
        $dateArr = explode('.',$date);
        $date = $dateArr[2].'-'.$dateArr[1].'-'.$dateArr[0];
        $createArr = [
            'title' => $data['title'],
            'html' => htmlspecialchars($data['html']),
            'thumb' => $data['thumb'],
            'date_create' => $date
        ];
        News::create($createArr);
    }
}