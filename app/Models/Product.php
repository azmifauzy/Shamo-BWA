<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $guard = ["id"];

    public function product_galleries()
    {
        return $this->hasMany(ProductGallery::class);
    }

    public function category()
    {
        return $this->belongsTo(ProductCategory::class);
    }
}
