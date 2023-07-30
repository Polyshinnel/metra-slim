<?php


namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class TkpVagonProducts extends Model
{
    protected $table = 'tkp_vagon_products';
    protected $fillable = [
        'id',
        'tkp_id',
        'product_id'
    ];
    public $timestamps = false;
}