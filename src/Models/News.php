<?php


namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class News extends Model
{
    protected $table = 'news';
    protected $fillable = [
        'id',
        'title',
        'html',
        'thumb',
        'date_create'
    ];
    public $timestamps = false;
}