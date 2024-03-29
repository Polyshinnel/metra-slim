<?php


namespace App\Controllers\Pages\Admin;


use App\Controllers\telegram\TelegramService;
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

        $textMessage = "<b>".$data['title']."</b>\r\n".strip_tags($data['html']);

        $telegram = new TelegramService(tokenTelegram);
        $telegram->sendMessage('-1001939190548', $textMessage);
        $telegram->sendImg('-1001939190548', $data['thumb']);
    }

    public static function getNewsItem($id) {
        $newsData = News::where('id', $id)->first()->toArray();
        $dateArr = explode('-',$newsData['date_create']);
        $date = $dateArr[2].'.'.$dateArr[1].'.'.$dateArr[0];
        return [
            'title' => $newsData['title'],
            'html' => htmlspecialchars_decode($newsData['html']),
            'thumb' => $newsData['thumb'],
            'date_create' => $date
        ];
    }
}