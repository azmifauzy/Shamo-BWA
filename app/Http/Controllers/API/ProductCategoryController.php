<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\Controller;
use App\Helpers\ResponseFormatter;
use App\Models\ProductCategory;
use Illuminate\Http\Request;

class ProductCategoryController extends Controller
{
    
    public function all(Request $request)
    {
        $id = $request->input("id");
        $limit = $request->input("limit");
        $name = $request->input("name");
        $show_product = $request->input("show_product");

        if($id) {
            $category = ProductCategory::with('products')->find($id);
            
            if($category) {
                return ResponseFormatter::success($category, 'Data Kategori Ditemukan');
            } else {
                return ResponseFormatter::error(null, 'Data Kategori Tidak Ditemukan', 404);
            }
        }

        $category = ProductCategory::query();
        if($name) {
            $category->where('name', 'like', '%' . $name . '%');
        }
        if($show_product) {
            $category->with('products');
        }
        return ResponseFormatter::success($category->paginate($limit), 'Data Kategori Ditemukan');
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
    public function show(ProductCategory $productCategory)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(ProductCategory $productCategory)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, ProductCategory $productCategory)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ProductCategory $productCategory)
    {
        //
    }
}
