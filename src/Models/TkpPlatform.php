<?php


namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class TkpPlatform extends Model
{
    protected $table = 'tkp_platform';
    protected $fillable = [
        'id',
        'name',
        'model',
        'quant_sensor',
        'width',
        'weight',
        'path'
    ];
    public $timestamps = false;
}