import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopapp/Provider/Order_Provider.dart' show Orders;
import 'package:shopapp/Widget/Order_Item.dart';
import 'package:shopapp/Widget/App_Drawer.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {

    final ordersData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      body: ListView.builder(itemCount: ordersData.orders.length ,itemBuilder: (ctx, index) => OrderItem(ordersData.orders[index])),
      drawer: AppDrawer(),
    );
  }
}
