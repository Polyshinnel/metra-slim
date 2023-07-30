<?php


namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class TkpBundleProducts extends Model
{
    protected $table = 'tkp_bundle_products';
    protected $fillable = [
        'id',
        'tkp_id',
        'product_id'
    ];
    public $timestamps = false;
}