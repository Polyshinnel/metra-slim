<?php


namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class TkpPlatformProducts extends Model
{
    protected $table = 'tkp_platform_products';
    protected $fillable = [
        'id',
        'tkp_id',
        'product_id'
    ];
    public $timestamps = false;
}