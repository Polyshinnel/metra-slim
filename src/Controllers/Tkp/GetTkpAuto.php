<?php


namespace App\Controllers\Tkp;


use App\Models\BuildTasksAuto;
use App\Models\TkpAuto;

class GetTkpAuto
{
    public static function getTkpList($data)
    {
        $selectArr = [
            'type_sensor' => $data['typeSensor'],
            'type_instalation' => $data['typeInstalation'],
            'length' => $data['length'],
            'model' => $data['model'],
            'weight' => $data['weight']
        ];

        $tkpList = TkpAuto::where($selectArr)->get()->toArray();

        $customerName = $data['customerName'];
        $instalationPlace = $data['instalationPlace'];
        $expiredDate = $data['expiredDate'];

        if(!empty($tkpList))
        {
            $json['message'] = 'tkp not empty';
            $json['tkp'] = [];
            $buildTasks = BuildTasksAuto::all()->toArray();
            $buildTasksArr = [];

            foreach ($tkpList as $tkpUnit)
            {
                $tkpId = $tkpUnit['id'];

                foreach ($buildTasks as $buildTask)
                {
                    $buildTaskIdArr = explode(',',$buildTask['tkp_id']);
                    if(in_array($tkpId,$buildTaskIdArr)){
                        $buildTasksArr[] = $buildTask;
                    }
                }

                $httpArr = [
                    'id' => $tkpId,
                    'customerName' => $customerName,
                    'instalationPlace' => $instalationPlace,
                    'expiredDate' => $expiredDate
                ];

                $link = '/getTkp/auto?'.http_build_query($httpArr);
                $buildTaskFinal = [];

                if(!empty($buildTasksArr))
                {
                    foreach ($buildTasksArr as $buildTaskUnit)
                    {
                        $buildTaskFinal[] = [
                            'name' => $buildTaskUnit['name'],
                            'link' => '/assets/'.$buildTaskUnit['filepath']
                        ];
                    }
                }

                $json['tkp'][] = [
                    'name' => $tkpUnit['name'],
                    'link' => $link,
                    'customer' => $customerName,
                    'buildTasks' => $buildTaskFinal
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