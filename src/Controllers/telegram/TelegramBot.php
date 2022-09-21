<?php


namespace App\Controllers\telegram;


class TelegramBot
{
    public function testBot($data)
    {
        $data = json_decode($data, true);
        file_put_contents(__DIR__ . '/message.txt', print_r($data, true));
    }
}