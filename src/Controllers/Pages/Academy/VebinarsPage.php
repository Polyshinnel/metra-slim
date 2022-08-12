<?php


namespace App\Controllers\Pages\Academy;
use App\Models\Vebinars;
use Illuminate\Database\Capsule\Manager as Capsule;

class VebinarsPage
{
    public static function getVebinars($paramQuant)
    {
        $vebinars = [];

        if($paramQuant == 'last')
        {
            $vebinars = Capsule::table('vebinars')->orderBy('id','DESC')->skip(0)->take(4)->get()->toArray();
        }

        if($paramQuant == 'all')
        {
            $vebinars = Vebinars::all()->toArray();
        }

        return $vebinars;
    }

    public static function getVebinarById($id)
    {
        return Vebinars::where('id',$id)->first()->toArray();
    }

}