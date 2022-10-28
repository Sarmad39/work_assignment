import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  Future<void> fetchAndSetProducts() async {
    var url =
        Uri.parse('https://austinmealprep.com/wp-json/meal-prep/v1/products');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List<dynamic>;
      final List<Product> loadedProducts = [];
      for (var productData in extractedData) {
        loadedProducts.add(
          Product(
            id: productData['id'],
            title: productData['title'],
            date: productData['delivery_date'],
            price: productData['price'],
            imageUrl: productData['imageUrl'],
          ),
        );
      }
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
