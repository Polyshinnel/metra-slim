<?php


namespace App\Controllers\telegram;


use App\Models\AdminList;
use App\Models\User;

class TelegramBot
{
    private $telegramService;
    private $data;

    public function __construct(TelegramService $telegramService,array $data)
    {
        $this->telegramService = $telegramService;
        $this->data = $data;
    }

    public function startService()
    {
        $data = $this->data;

        $message = $this->telegramService->getMessage();
        $callbackResponse = $data['callback_query'];

        if(!empty($callbackResponse))
        {
            $chatId = $callbackResponse['from']['id'];
            $dataBtn = $callbackResponse['data'];

            $dataArr = explode('=',$dataBtn);
            $dataCommand = $dataArr[0];
            $dataParam = $dataArr[1];

            if($dataCommand == 'authUser'){
                $userId = $dataParam;

                $adminArr = AdminList::all()->toArray();

                $userData = User::where('id',$userId)->get()->toArray();
                $name = $userData[0]['name'];
                $phone = $userData[0]['phone'];

                $text = "Пользователь <i>".$name."</i> с телефоном: <i>".$phone."</i> авторизован!";

                $updateArr = [
                    'status' => 1
                ];

                User::where('id',$userId)->udpate($updateArr);

                foreach($adminArr as $adminUser){
                    $chatId = $adminUser['chat_id'];
                    $this->telegramService->sendMessage($chatId,$text);
                }

            }
        }
    }
}