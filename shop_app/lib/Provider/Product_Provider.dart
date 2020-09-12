import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shopapp/model/Product.dart';
import 'package:shopapp/model/Http_exception.dart';

class Products with ChangeNotifier {
  List<Product> items = [
//    Product(
//        id: 'p1',
//        title: 'Red Shirt',
//        description: 'A red shirt - it is pretty red!',
//        price: 29.99,
//        imageUrl:
//            'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//        isFavorite: false),
//    Product(
//        id: 'p2',
//        title: 'Trousers',
//        description: 'A nice pair of trousers.',
//        price: 59.99,
//        imageUrl:
//            'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
//        isFavorite: false),
//    Product(
//        id: 'p3',
//        title: 'Yellow Scarf',
//        description: 'Warm and cozy - exactly what you need for the winter.',
//        price: 19.99,
//        imageUrl:
//            'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
//        isFavorite: false),
//    Product(
//        id: 'p4',
//        title: 'A Pan',
//        description: 'Prepare any meal you want.',
//        price: 49.99,
//        imageUrl:
//            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
//        isFavorite: false),
  ];

//  var showFavoritesOnly = false;

  final String authToken;
  final String userId;

  Products(this.authToken, this.userId, this.items);

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

  Future<void> fetchAndSetProducts([bool filterByUser = false]) async {
    final filterString = filterByUser ? 'orderBy="creatorId"&equalTo="$userId"': '';

    var url = 'https://shoppingapp-b6675.firebaseio.com/products.json?auth=$authToken&$filterString';
    try {
      final response = await http.get(url);
      print(json.decode(response.body));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if(extractedData == null){
        return ;
      }
       url = 'https://shoppingapp-b6675.firebaseio.com/userFavorites/$userId.json?auth=$authToken';
      final isFavoriteResponse = await http.get(url);
      final favoriteData = json.decode(isFavoriteResponse.body);
      final List<Product> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(Product(
            id: prodId,
            title: prodData['title'],
            isFavorite: favoriteData == null ? false : favoriteData[prodId] ?? false,
            description: prodData['description'],
            price: prodData['price'],
            imageUrl: prodData['imageUrl']),
        );

      });
      items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> addProduct(Product product)  {
    final url = 'https://shoppingapp-b6675.firebaseio.com/products.json?auth=$authToken';
     return http
        .post(url,
            body: json.encode({
              'title': product.title,
              'description': product.description,
              'imageUrl': product.imageUrl,
              'price': product.price,
              'creatorId': userId,
            }))
        .then((response) {
      final newProduct = Product(
          title: product.title,
          price: product.price,
          description: product.description,
          imageUrl: product.imageUrl,
          id: json.decode(response.body)['name']);
      items.add(newProduct);
      notifyListeners();
    }).catchError((error) {
      throw error;
    });
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final prodIndex = items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      final url = 'https://shoppingapp-b6675.firebaseio.com/products/$id.json?auth=$authToken';
    await  http.patch(url, body: json.encode({
        'title': newProduct.title,
        'description': newProduct.description,
        'imageUrl': newProduct.imageUrl,
        'price': newProduct.price
      }));
      items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  Future<void> deleteProduct(String id) async  {
    final url = 'https://shoppingapp-b6675.firebaseio.com/products/$id.json?auth=$authToken';
    final existingProductIndex = items.indexWhere((prod) => prod.id == id);
    var existingProduct = items[existingProductIndex];
   final response = await http.delete(url);
      if(response.statusCode >= 400 ){
        items.insert(existingProductIndex, existingProduct);
        notifyListeners();
        throw HttpException('Could not delete product.');
      }
      existingProduct = null;
    items.removeAt(existingProductIndex);
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
