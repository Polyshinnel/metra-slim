<?php


namespace App\Controllers\Tkp;


use App\Models\TkpVagon;

class GetTkpVagon
{
    public static function getTkpList($data)
    {
        $selectArr = [
            'type_instalation' => $data['type_instalation'],
            'type_measure' => $data['type_measure'],
            'weight' => $data['weight'],
        ];

        $tkpList = TkpVagon::where($selectArr)->get()->toArray();

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

                $link = '/getTkp/vagon?'.http_build_query($httpArr);

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