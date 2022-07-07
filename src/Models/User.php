<?php


namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    protected $fillable = [
        'name',
        'mail',
        'org_name',
        'org_addr',
        'phone',
        'pass',
        'status',
        'confirm_code',
        'status_mail'
    ];
}