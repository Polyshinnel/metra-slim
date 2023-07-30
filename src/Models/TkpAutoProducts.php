<?php


namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class TkpAutoProducts extends Model
{
    protected $table = 'tkp_auto_products';
    protected $fillable = [
        'id',
        'tkp_id',
        'product_id'
    ];
    public $timestamps = false;
}