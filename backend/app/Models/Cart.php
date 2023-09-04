<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    public $table = "cart";

    protected $fillable = [
        'product_id','user_id',
    ];
}
