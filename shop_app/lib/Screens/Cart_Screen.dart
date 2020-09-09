import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:shopapp/Provider/Cart_Provider.dart';
import 'package:shopapp/Widget/Cart_Item.dart';
import 'package:shopapp/Provider/Order_Provider.dart';


class CartScreen extends StatefulWidget {
  static const routeName = '/cart';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(14),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      "\$${cart.totalAmount.toStringAsFixed(2)}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    child: Text('ORDER NOW'),
                    onPressed: cart.totalAmount <= 0  || isLoading ? null : () async {
                      setState(() {
                        isLoading = true;
                      });
                     await Provider.of<Orders>(context, listen: false).addItem( cart.getitems.values.toList(), cart.totalAmount);
                     setState(() {
                       isLoading = false;
                     });
                      cart.clear();
                    },
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, i) => CartItems(
                  cart.getitems.values.toList()[i].id,
                  cart.getitems.keys.toList()[i],
                  cart.getitems.values.toList()[i].price,
                  cart.getitems.values.toList()[i].quantity,
                  cart.getitems.values.toList()[i].title),
              itemCount: cart.getitems.length,
            ),
          )
        ],
      ),
    );
  }
}
