<?php


namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = 'products';

    public $timestamps = false;

    protected $fillable = [
        'name',
        'category_id',
        'sku',
        'description',
        'img',
        'price',
        'quantity'
    ];
}