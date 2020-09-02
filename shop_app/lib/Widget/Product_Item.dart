import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopapp/Screens/Product_Details.dart';
import 'package:shopapp/model/Product.dart';

class ProductItem extends StatelessWidget {
//  final String id;
//  final String title;
//  final String imageUrl;
//
//  ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {

final product  = Provider.of<Product>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: (){
                Navigator.of(context).pushNamed(ProductDetails.routeName, arguments: product.id);
          },
          child: Image.network( 
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: IconButton(icon: Icon(Icons.favorite,color: Theme.of(context).accentColor,), onPressed: (){}),
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(icon: Icon(Icons.shopping_cart,color: Theme.of(context).accentColor), onPressed: (){}),
        ),
      ),
    );
  }
}
