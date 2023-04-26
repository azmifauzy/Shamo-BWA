<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Transaction extends Model
{
    use HasFactory,SoftDeletes;
    protected $guard = ["id"];
    protected $fillable = [
        'user_id',
        'status',
        'total_price',
        'shipping_price',
        'address',
        'payment',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function transaction_items()
    {
        return $this->hasMany(TransactionItem::class, 'transaction_id', 'id');
    }
}
