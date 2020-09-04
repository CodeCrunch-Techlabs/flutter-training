import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:shopapp/Provider/Product_Provider.dart';

class ProductDetails extends StatelessWidget {
//  final String title;
//
//  ProductDetails(this.title);

  static const routeName = '/product−details';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;

    final product = Provider.of<Products>(context, listen: false).getProductById(
        productId); //listen: false means when evrytime products object is changed it will not load this evrytime.

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '\$${product.price}',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
                padding: EdgeInsets.all(4),
                child: Text(
              product.description,
              textAlign: TextAlign.center,
            ))
          ],
        ),
      ),
    );
  }
}
