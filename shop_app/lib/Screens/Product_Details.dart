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
//      appBar: AppBar(
//        title: Text(product.title),
//      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(title: Text(product.title),background: Hero(
              tag: productId,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 10,
              ),
              Text(
                '\$${product.price}',
                style: TextStyle(color: Colors.grey, fontSize: 20),
                textAlign: TextAlign.center,
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
                  )),
              SizedBox(height: 800,)
            ]),
          ),
        ],
      ),
    );
  }
}
