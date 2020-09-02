import 'package:flutter/material.dart';
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

final product = Provider.of<Products>(context, listen: false).getProductById(productId); //listen: false means when evrytime products object is changed it will not load this evrytime.

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
