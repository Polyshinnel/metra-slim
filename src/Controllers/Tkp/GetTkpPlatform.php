<?php


namespace App\Controllers\Tkp;


use App\Models\TkpPlatform;

class GetTkpPlatform
{
    public static function getTkpList($data)
    {
        $selectArr = [
            'model' => $data['model'],
            'quant_sensor' => $data['quant_sensor'],
            'width' => $data['width'],
            'weight' => $data['weight'],
        ];

        $tkpList = TkpPlatform::where($selectArr)->get()->toArray();

        $customerName = $data['customerName'];
        $instalationPlace = $data['instalationPlace'];
        $expiredDate = $data['expiredDate'];

        if(!empty($tkpList)) {
            $json['message'] = 'tkp not empty';
            $json['tkp'] = [];

            foreach ($tkpList as $tkpUnit)
            {
                $httpArr = [
                    'id' => $tkpUnit['id'],
                    'customerName' => $customerName,
                    'instalationPlace' => $instalationPlace,
                    'expiredDate' => $expiredDate
                ];

                $link = '/getTkp/platform?'.http_build_query($httpArr);

                $json['tkp'][] = [
                    'name' => $tkpUnit['name'],
                    'link' => $link,
                    'customer' => $customerName
                ];
            }
        }
        else
        {
            $json['message'] = 'К сожалению ничего не найдено';
        }

        return json_encode($json,JSON_UNESCAPED_UNICODE);
    }
}