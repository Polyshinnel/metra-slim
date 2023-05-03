<?php


namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class TkpBundle extends Model
{
    protected $table = 'tkp_bundle';

    protected $fillable = [
        'id',
        'name',
        'count_sensor',
        'model',
        'path'
    ];

    public $timestamps = false;
}