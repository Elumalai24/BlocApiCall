import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/product.dart';

class ApiService {
  Future<List<Product>> getProducts() async {
    const String url = "https://fakestoreapi.com/products";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      final List<Product> products =
          jsonData.map((e) => Product.fromJson(e)).toList();
      return products;
    } else {
      throw Exception("Failed to load products");
    }
  }
}
