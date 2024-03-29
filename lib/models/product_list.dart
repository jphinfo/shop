import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class ProductList with ChangeNotifier {
  final _baseUrl = 'https://shop-project-76d4c-default-rtdb.firebaseio.com';

  final List<Product> _items = dummyProducts;
  List<Product> get items => [..._items];
  List<Product> get favoriteItems =>
      _items.where((prod) => prod.isFavorite).toList();

  int get itemCount {
    return _items.length;
  }

  void saveProductFromData(Map<String, dynamic> data) {
    bool hasId = data['id'] != null;

    final newProduct = Product(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      name: data['name'] as String,
      description: data['description'] as String,
      price: data['price'] as double,
      imageUrl: data['imageUrl'] as String,
    );

    if (hasId) {
      updateProduct(newProduct);
    } else {
      addProduct(newProduct);
    }
  }

  void addProduct(Product product) {
    http.post(
      Uri.parse('$_baseUrl/products.json'),
      body: jsonEncode(
        {
          "name": product.name,
          "description": product.description,
          "price": product.price,
          "imageUrl": product.imageUrl,
          "isFavorite": product.isFavorite,
        },
      ),
    );

    _items.add(product);
    notifyListeners();
  }

  void updateProduct(Product product) {
    int index = _items.indexWhere((p) => p.id == product.id);

    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }
  }

  void deleteProduct(Product product) {
    _items.removeWhere((p) => p.id == product.id);
    notifyListeners();
  }

  //  void deleteProduct(Product product) {
  //   int index = _items.indexWhere((p) => p.id == product.id);

  //   if (index >= 0) {
  //     _items.removeWhere((p) => p.id == product.id);
  //     notifyListeners();
  //   }
  // }
}













  // bool _showFavoriteOnly = false;

  // List<Product> get items {
  //   if (_showFavoriteOnly) {
  //     return _items.where((prod) => prod.isFavorite).toList();
  //   }

  //   return [..._items];
  // }

  // void showFavoriteOnly() {
  //   _showFavoriteOnly = true;
  //   notifyListeners();
  // }

  // get isShowFavorite =>
  //     _showFavoriteOnly; // Marca favorite atravéz de um icone na action bar

  // void showAll() {
  //   _showFavoriteOnly = false;
  //   notifyListeners();
  // }