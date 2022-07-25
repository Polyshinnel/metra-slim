<?php


namespace App\Utils;


class CommonHelper
{
    public static function getRandomCode($range)
    {
        $str = '';
        for($i=0;$i<$range;$i++){
            $str .= rand(0,9);
        }
        return $str;
    }

    public static function generateToken()
    {
        if (function_exists('com_create_guid') === true) {
            return trim(com_create_guid(), '{}');
        }

        return sprintf(
            '%04X%04X-%04X-%04X-%04X-%04X%04X%04X',
            mt_rand(0, 65535),
            mt_rand(0, 65535),
            mt_rand(0, 65535),
            mt_rand(16384, 20479),
            mt_rand(32768, 49151),
            mt_rand(0, 65535),
            mt_rand(0, 65535),
            mt_rand(0, 65535)
        );
    }

    public static function normalizePhone($phone)
    {
        $phone = preg_replace('/[^0-9]/', '', $phone);
        $phone = mb_substr($phone,1);
        $phone = '+7'.$phone;
        return $phone;
    }

    public static function normalizePrice($price)
    {
        if($price>=1000 && $price<1000000){
            $hundreeds =  $price%1000;
            $thousands = ($price - $hundreeds)/1000;
            if($hundreeds < 100){
                $hundreeds = '0'.$hundreeds;
            }
            if($hundreeds < 10){
                $hundreeds = '00'.$hundreeds;
            }
            $price = $thousands.' '.$hundreeds;
        }elseif($price>=1000000){
            $millMod = $price%1000000;
            $hundreeds =  $millMod%1000;
            $thousands = ($millMod - $hundreeds)/1000;
            $millions = ($price-$millMod)/1000000;
            if($hundreeds < 100){
                $hundreeds = '0'.$hundreeds;
            }
            if($hundreeds < 10){
                $hundreeds = '00'.$hundreeds;
            }
            if($thousands < 100){
                $thousands = '0'.$thousands;
            }
            if($thousands < 10){
                $thousands = '00'.$thousands;
            }
            $price = $millions.' '.$thousands.' '.$hundreeds;
        }else{
            return $price;
        }
        return $price;
    }
}