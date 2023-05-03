<?php


namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class TkpVagon extends Model
{
    protected $table = 'tkp_vagon';
    protected $fillable = [
        'id',
        'name',
        'type_instalation',
        'type_measure',
        'weight',
        'path'
    ];
    public $timestamps = false;
}