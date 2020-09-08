import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shopapp/model/Product.dart';

class Products with ChangeNotifier {
  List<Product> items = [
    Product(
        id: 'p1',
        title: 'Red Shirt',
        description: 'A red shirt - it is pretty red!',
        price: 29.99,
        imageUrl:
            'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
        isFavorite: false),
    Product(
        id: 'p2',
        title: 'Trousers',
        description: 'A nice pair of trousers.',
        price: 59.99,
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
        isFavorite: false),
    Product(
        id: 'p3',
        title: 'Yellow Scarf',
        description: 'Warm and cozy - exactly what you need for the winter.',
        price: 19.99,
        imageUrl:
            'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
        isFavorite: false),
    Product(
        id: 'p4',
        title: 'A Pan',
        description: 'Prepare any meal you want.',
        price: 49.99,
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
        isFavorite: false),
  ];

//  var showFavoritesOnly = false;

  List<Product> get getItems {
//    if (showFavoritesOnly) {
//     return items.where((prodItem) => prodItem.isFavorite).toList();
//    }
    return [...items];
  }

  List<Product> get favoriteItems {
    return items.where((prodItem) => prodItem.isFavorite).toList();
  }

  getProductById(String id) {
    return items.firstWhere((prod) => prod.id == id);
  }

  Future<void> addProduct(Product product) {
    const url = 'https://shoppingapp-b6675.firebaseio.com/products.json';
    return http.post(url, body: json.encode({
      'title': product.title,
      'description': product.description,
      'imageUrl': product.imageUrl,
      'price': product.price,
      'isFavorite': product.isFavorite
    })).then((response) {
      final newProduct = Product(
          title: product.title, price: product.price, description: product.description, imageUrl: product.imageUrl, id: DateTime.now().toString()
      );
      items.add(newProduct);
      notifyListeners();
    }).catchError((error){
      throw error;
    });
  }

  void updateProduct(String id, Product newProduct){
   final prodIndex = items.indexWhere((prod) => prod.id == id);
    if(prodIndex >= 0){
      items[prodIndex] = newProduct;
      notifyListeners();
    }
    else {
      print('...');
    }

  }

  void deleteProduct(String id){
      items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }

//  void showFavorites() {
//    showFavoritesOnly = true;
//    notifyListeners();
//  }
//
//  void showAll() {
//    showFavoritesOnly = false;
//    notifyListeners();
//  }
}
