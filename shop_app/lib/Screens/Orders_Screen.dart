import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopapp/Provider/Order_Provider.dart' show Orders;
import 'package:shopapp/Widget/Order_Item.dart';
import 'package:shopapp/Widget/App_Drawer.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapshot.error != null) {
              return Center(
                child: Text("An error occured!!"),
              );
            } else {
              return Consumer<Orders>(builder:  (ctx, orderData, child) => ListView.builder(
                  itemCount: orderData.getOrders.length,
                  itemBuilder: (ctx, index) {
               return OrderItem(orderData.getOrders[index]);}),);
            }
          }
        },
      ),
      drawer: AppDrawer(),
    );
  }
}
