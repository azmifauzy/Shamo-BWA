import 'dart:convert';

import 'package:shamo_app/app/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  String baseUrl = 'http://192.168.0.4:8000/api'; // laravel serve

  Future<List<ProductModel>?> getProducts() async {
    var url = Uri.parse("$baseUrl/products");
    var headers = {
      'Content-Type': 'application/json',
      "Connection": "Keep-Alive"
    };

    var response = await http.get(url, headers: headers);
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];
      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }
      return products;
    } else {
      throw Exception('Failed to Get Products.');
    }
  }
}
