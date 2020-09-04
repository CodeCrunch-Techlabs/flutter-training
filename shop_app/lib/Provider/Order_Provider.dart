import 'package:flutter/material.dart';

import 'package:shopapp/Provider/Cart_Provider.dart';

class OrderItem{
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime
});
}

class Orders with ChangeNotifier{

  List<OrderItem> orders = [];

  List<OrderItem> get getOrders{
     return [...orders];
  }

  void addItem(List<CartItem> cartProducts, double total){
    orders.insert(0, OrderItem(id: DateTime.now().toString(), amount: total, products: cartProducts, dateTime: DateTime.now())); //Took insert with 0 index because when we add the last item in add cart it will show at the first position ( Recently added items..)
    notifyListeners();
  }


}