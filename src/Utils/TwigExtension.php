<?php


namespace App\Utils;

use Twig\Extension\AbstractExtension;
use Twig\TwigFunction;

class TwigExtension extends AbstractExtension
{
    public function getFunctions()
    {
        new TwigFunction('asset_url',[$this, 'getAssetUrl']);
    }

    public function getAssetUrl($path)
    {
        return 'http://'.$_SERVER['HTTP_HOST'].'/'.$path;
    }
}