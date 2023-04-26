<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\Controller;
use App\Helpers\ResponseFormatter;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{

    public function all(Request $request)
    {
        $id = $request->input("id");
        $limit = $request->input("limit");
        $name = $request->input("name");
        $description = $request->input("description");
        $tags = $request->input("tags");
        $categories = $request->input("categories");

        $price_from = $request->input("price_from");
        $price_to = $request->input("price_to");

        if($id) {
            $product = Product::with('category', 'product_galleries')->find($id);
            
            if($product) {
                return ResponseFormatter::success($product, 'Data Produk Ditemukan');
            } else {
                return ResponseFormatter::error(null, 'Data Produk Tidak Ditemukan', 404);
            }
        }

        $product = Product::with('category', 'product_galleries');
        if($name) {
            $product->where('name', 'like', '%' . $name . '%');
        }
        if($description) {
            $product->where('description', 'like', '%' . $description . '%');
        }
        if($tags) {
            $product->where('tags', 'like', '%' . $tags . '%');
        }
        if($price_from) {
            $product->where('price', '>=', $price_from);
        }
        if($price_to) {
            $product->where('price', '<=', $price_to);
        }
        if($categories) {
            $product->where('categories', $categories);
        }
        return ResponseFormatter::success($product->paginate($limit), 'Data Produk Ditemukan');
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Product $product)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Product $product)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Product $product)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Product $product)
    {
        //
    }
}
