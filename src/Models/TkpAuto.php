<?php


namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TkpAuto extends Model
{
    protected $table = 'tkp_auto';
    protected $fillable = [
        'id',
        'name',
        'type_sensor',
        'type_instalation',
        'length',
        'model',
        'weight',
        'path'
    ];
    public $timestamps = false;
}