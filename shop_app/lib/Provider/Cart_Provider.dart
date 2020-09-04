import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price});
}

class Cart with ChangeNotifier {

  Map<String, CartItem> items = {};

  Map<String, CartItem> get getitems{
     return {...items};
  }

  int get itemCount{
    return  items.length;
  }

  double get totalAmount{
    var total = 0.0;
    items.forEach((key, cartItem) {
       total += cartItem.price * cartItem.quantity;
    });
    return total;
  }


  void addItem(String productId, double price, String title){
    if(items.containsKey(productId)){
      items.update(productId, (existingItem) => CartItem(id: existingItem.id, title: existingItem.title, quantity: existingItem.quantity + 1, price: existingItem.price));
    }
    else{
      items.putIfAbsent(productId, () => CartItem(id: DateTime.now().toString(), title: title, price: price, quantity: 1));
    }
    notifyListeners();
  }

  void removeItem(String productId){
     items.remove(productId);
     notifyListeners();
  }

  void clear(){
    items = {};
    notifyListeners();
  }

}
