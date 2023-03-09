<?php


namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class Clients extends Model
{
    protected $table = 'clients';
    protected $fillable = [
        'id',
        'user_id',
        'contact_name',
        'contact_phone',
        'contact_mail',
        'inn',
        'org_name',
        'ord_addr'
    ];
    public $timestamps = false;
}