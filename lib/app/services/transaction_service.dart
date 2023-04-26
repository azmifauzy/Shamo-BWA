import 'dart:convert';

import 'package:shamo_app/app/models/cart_model.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  String baseUrl = 'http://192.168.0.4:8000/api'; // laravel serve

  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    var url = Uri.parse("$baseUrl/checkout");
    var headers = {'Content-Type': 'application/json', 'Authorization': token};
    var body = jsonEncode({
      "address": "Marsemoon",
      "items": carts
          .map((cart) => {'id': cart.product!.id, 'quantity': cart.quantity})
          .toList(),
      "status": "PENDING",
      "total_price": totalPrice,
      "shipping_price": 0,
    });

    var response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Failed to Checkout");
    }
  }
}
