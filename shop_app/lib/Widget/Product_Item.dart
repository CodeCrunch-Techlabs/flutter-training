import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopapp/Screens/Product_Details.dart';
import 'package:shopapp/model/Product.dart';
import 'package:shopapp/Provider/Cart_Provider.dart';
import 'package:shopapp/Provider/Auth.dart';

class ProductItem extends StatelessWidget {
//  final String id;
//  final String title;
//  final String imageUrl;
//
//  ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context,
        listen:
            false); //When write listen false that's means that this will not rebuild whole widget when something chnage everytime.
    final cart = Provider.of<Cart>(context);
    final authData = Provider.of<Auth>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetails.routeName, arguments: product.id);
          },
          child: Hero(
            tag: product.id,
            child: FadeInImage(placeholder: AssetImage('assets/images/product-placeholder.png'), image: NetworkImage(product.imageUrl),
            fit: BoxFit.cover,),
          ),
        ),
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder: (ctx, product, child) => IconButton(
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () {
                  product.toggleFavoriteStatus(authData.gettoken, authData.getuserId);
                }),
          ),
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
              icon: Icon(Icons.shopping_cart,
                  color: Theme.of(context).accentColor),
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Added item to cart!', textAlign: TextAlign.center,),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(label: 'UNDO', onPressed: (){
                    print("ndn");
                    cart.removeSingleItem(product.id);
                  }),
                ));
              }),
        ),
      ),
    );
  }
}
