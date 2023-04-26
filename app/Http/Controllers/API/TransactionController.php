<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\Transaction;
use App\Models\TransactionItem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TransactionController extends Controller
{
    public function all(Request $request)
    {
        $id = $request->input("id");
        $limit = $request->input("limit");
        $status = $request->input("status");

        if($id) {
            $transaction = Transaction::with('transaction_items.product')->find($id);
            
            if($transaction) {
                return ResponseFormatter::success($transaction, 'Data Transaksi Ditemukan');
            } else {
                return ResponseFormatter::error(null, 'Data Transaksi Tidak Ditemukan', 404);
            }
        }

        $transaction = Transaction::with('transaction_items.product')->where('user_id', Auth::user()->id);
        if($status) {
            $transaction->where('status', $status);
        }
        return ResponseFormatter::success($transaction->paginate($limit), 'Data Transaksi Ditemukan');
    }

    public function checkout(Request $request)
    {
        $validatedData = $request->validate([
            "address" => "required",
            "items" => "required|array",
            "items.*.id" => "exists:products,id",
            "total_price" => "required",
            "shipping_price" => "required",
            "status" => "required|in:PENDING,SUCCESS,CANCELLED,FAILED,SHIPPING,SHIPPED",
        ]);

        $transaction = Transaction::create([
            "user_id" => Auth::user()->id,
            "status" => $request->status,
            "total_price" => $request->total_price,
            "shipping_price" => $request->shipping_price,
            "address" => $request->address,
        ]);

        foreach ($request->items as $product) {
            TransactionItem::create([
                "user_id" => Auth::user()->id,
                "product_id" => $product["id"],
                "transaction_id" => $transaction->id,
                "quantity" => $product["quantity"]
            ]);
        }
        return ResponseFormatter::success($transaction->load('transaction_items.product'), 'Data Transaksi Ditambah');

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
    public function show(Transaction $transaction)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Transaction $transaction)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Transaction $transaction)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Transaction $transaction)
    {
        //
    }
}
