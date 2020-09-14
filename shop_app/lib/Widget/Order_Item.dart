import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

import 'package:shopapp/Provider/Order_Provider.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var expanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: expanded ?  min(widget.order.products.length * 20.0 + 210, 300) : 97,
      child: Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('\$${widget.order.amount}'),
              subtitle: Text(
                  DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime)),
              trailing: IconButton(
                icon: Icon(expanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    print(widget.order.toString());
                    expanded = !expanded;
                  });
                },
              ),
            ),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.all(10),
                  height: expanded ?  min(widget.order.products.length * 20.0 + 110, 300) : 0,
                  child: ListView(
                    children: widget.order.products.map((prod) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(prod.title ,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        Text('${prod.quantity}x \$${prod.price}',style: TextStyle(fontSize: 18, color: Colors.grey),)
                      ],
                    )).toList(),
                  ))
          ],
        ),
      ),
    );
  }
}
