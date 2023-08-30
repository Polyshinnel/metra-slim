<?php


namespace App\Controllers\telegram;


class TelegramService
{
    private $telegramApi;
    private $data;

    public function __construct($telegramApi,$data = NULL)
    {
        $this->telegramApi = $telegramApi;
        $this->data = $data;
    }

    public function getMessage()
    {
        $data = $this->data;
        $message = $data['message']['text'];
        $chatId = $data['message']['from']['id'];

        $json = [
            'chatId' => $chatId,
            'message' => $message
        ];

        //$json = json_encode($json, JSON_UNESCAPED_UNICODE);
        return $json;
    }

    public function sendMessage($chatId,$text)
    {
        $response = [
            'chat_id' => $chatId,
            'text' => $text,
            'parse_mode' => 'HTML'
        ];

        $telegramApi = $this->telegramApi;

        $url = "https://api.telegram.org/bot$telegramApi/sendMessage";

        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $response);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_exec($ch);
        curl_close($ch);
    }

    public function sendImg($chatId, $imgPath) {
        $response = array(
            'chat_id' => $chatId,
            'photo' => curl_file_create(__DIR__ . '/../../../public'.$imgPath)
        );


        $telegramApi = $this->telegramApi;

        $ch = curl_init('https://api.telegram.org/bot' . $telegramApi . '/sendPhoto');
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $response);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_exec($ch);
        curl_close($ch);
    }

    public function sendInteractionMessage($keyboard,$chatId,$text){

        $keyboard = json_encode($keyboard,JSON_UNESCAPED_UNICODE);

        $response = [
            'chat_id' => $chatId,
            'text' => $text,
            'parse_mode' => 'HTML',
            'reply_markup' => $keyboard
        ];

        $telegramApi = $this->telegramApi;

        $url = "https://api.telegram.org/bot$telegramApi/sendMessage";

        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $response);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_exec($ch);
        curl_close($ch);
    }
}