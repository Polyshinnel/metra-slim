<?php


namespace App\Controllers;


use App\Controllers\telegram\TelegramService;
use App\Models\AdminList;
use App\Models\User;
use App\Utils\CommonHelper;
use App\Utils\MailSender;

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
            $userInfo = $user[0]['id'];
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
        $userName = $data['userName'];
        $userMail = $data['userMail'];
        $userOrg = $data['orgName'];
        $orgAddress = $data['orgAddress'];
        $userPhone = $data['userPhone'];
        $userPass = $data['userPass'];
        $country = $data['country'];
        $flag = 0;

        $checkUserDataPhoneArr = User::where('phone',$userPhone)->get()->toArray();
        $checkUserDataMailArr = User::where('mail',$userMail)->get()->toArray();

        $response = '';

        $userNameArr = explode(' ',$userName);
        if(count($userNameArr) < 2){
            $response = 'Требуется ввести имя и фамилию!';
            $flag++;
        }

        $userMailArr = explode('@',$userMail);
        if(count($userMailArr) < 2)
        {
            $response = 'Введите корретную почту!';
            $flag++;
        }

        if((mb_strlen($userOrg) < 4))
        {
            $response = 'Введите полное название организации!';
            $flag++;
        }

        $userPhone = CommonHelper::normalizePhone($userPhone);
        if(mb_strlen($userPhone) < 12)
        {
            $response = 'Введите мобильный телефон, или проверьте корректность ввода цифр!';
            $flag++;
        }

        if(mb_strlen($orgAddress) < 5)
        {
            $response = 'Введите корретный адрес вашей организации!';
            $flag++;
        }

        if(mb_strlen($userPass) < 5)
        {
            $response = 'Пароль должен быть не менее 5 символов!';
            $flag++;
        }

        if(!empty($checkUserDataMailArr))
        {
            $response = 'Пользователь с такой почтой уже существует!';
            $flag++;
        }

        if(!empty($checkUserDataPhoneArr))
        {
            $response = 'Пользователь с таким телефоном уже существует!';
            $flag++;
        }

        if($flag == 0)
        {
            $confirmCode = CommonHelper::getRandomCode(4);
            $createArr = [
                'name' => $userName,
                'mail' => $userMail,
                'org_name' => $userOrg,
                'org_addr' => $orgAddress,
                'phone' => $userPhone,
                'pass' => md5($userPass),
                'status' => 0,
                'confirm_code' => $confirmCode,
                'status_mail' => 0,
                'admin_status' => 0,
                'country' => $country
            ];
            User::create($createArr);
            $response = 'Register Success!';

            $mail = [
                'subject' => 'Код подтверждения регистрации',
                'text' => '<h2>Поздравляем с регистрацией в личном кабинете</h2><p>Ваш код подтверждения</p><h4>'.$confirmCode.'</h4>'
            ];

            $mailer = new MailSender($userMail,$mail);
            $mailer->sendMail();
        }

        $json = [
            'status' => $response,
            'mail' => $userMail
        ];

        return json_encode($json,JSON_UNESCAPED_UNICODE);
    }

    public static function restoreMail($data)
    {
        $mailAddr = $data['mail'];
        $userInfo = User::where('mail',$mailAddr)->get()->toArray();
        if(!empty($userInfo))
        {
            $token = CommonHelper::generateToken();
            User::where('mail',$mailAddr)->update(['restore_token' => $token]);
            $subject = 'Восстановление пароля';
            $url = siteUrl.'restorePass'.'?token='.$token;
            $text = '<h2>Запущен процесс восстановления пароля</h2><p>Для сброса пароля перейдите по ссылке:</p><p><a href="'.$url.'">'.$url.'</a></p>';
            $mail = [
                'subject' => $subject,
                'text' => $text
            ];
            $mailSender = new MailSender($mailAddr,$mail);
            $mailSender->sendMail();
            $json = [
                'response' => 'mail send',
                'token' => $token
            ];
        }
        else
        {
            $json = [
                'response' => 'Нет зарегестрированных пользователей с такой почтой'
            ];
        }

        return json_encode($json, JSON_UNESCAPED_UNICODE);
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

            $userInfo['admin_status'] = $adminStatus;

            $userData['redirect'] = 'none';

            if($userInfo['status'] != 1){
                $userData['redirect'] = '/awaitPage';
            }

            if($userInfo['status_mail'] != 1){
                $userData['redirect'] = '/confirm?mail='.$userInfo['mail'];
            }


            return $userData;
        }
        else
        {
            return false;
        }
    }

    public static function checkConfirm($mail,$code)
    {

        $queryArr = [
            'mail' => $mail,
            'confirm_code' => $code
        ];

        $userInfo = User::where($queryArr)->get()->toArray();
        if(!empty($userInfo))
        {
            User::where('mail',$mail)->update(['status_mail' => '1']);

            $telegramService = new TelegramService(tokenTelegram);

            $text = "Зарегистрирован новый пользователь\r\n"."<b>Имя пользователя: </b>".$userInfo[0]['name']."\r\n<b>Почта: </b>".$userInfo[0]['mail']."\r\n<b>Телефон: </b>".$userInfo[0]['phone']."\r\n<b>Организация: </b>".$userInfo[0]['org_name']."\r\n<b>Страна: </b>".$userInfo[0]['country'];

            $callbackData = 'authUser='.$userInfo[0]['id'];

            $keyboard = [
                'inline_keyboard' => [
                    //Первый ряд кнопок
                    [
                        [
                            'text' => 'Авторизовать ✅',
                            'callback_data' => $callbackData
                        ],
                    ]

                ]
            ];


            $adminArr = AdminList::all()->toArray();
            foreach ($adminArr as $adminItem)
            {
                $telegramService->sendInteractionMessage($keyboard,$adminItem['chat_id'],$text);
            }
            return 'Регистрация успешно завершена!';
        }
        else
        {
            return 'Не верный код!';
        }
    }

    public static function getDataFromToken($data)
    {
        $token = $data['token'];
        $userInfo = User::where('restore_token',$token)->get()->toArray();

        if(!empty($userInfo))
        {
            return $userInfo[0];
        }
        else
        {
            return false;
        }
    }

    public static function restorePass($data)
    {
        $token = $data['token'];
        $pass = $data['pass'];
        $pass = md5($pass);

        $userInfo = User::where('restore_token',$token)->get()->toArray();
        if(!empty($userInfo))
        {
            User::where('restore_token',$token)->update(['pass' => $pass]);
            return 'change success';
        }
        else
        {
            return 'Пользователя с данным токеном не существует';
        }
    }
}