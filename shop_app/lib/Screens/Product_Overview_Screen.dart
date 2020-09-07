import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Provider/Cart_Provider.dart';

import 'package:shopapp/Widget/Product_Item.dart';
import 'package:shopapp/Provider/Product_Provider.dart';
import 'package:shopapp/Widget/badge.dart';
import 'package:shopapp/Screens/Cart_Screen.dart';
import 'package:shopapp/Widget/App_Drawer.dart';

enum FilterOptions { Favorites, All }

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);

    final products = showFavoritesOnly
        ? productsData.favoriteItems
        : productsData
            .getItems; //If showFavoritesOnly is true then it will call favoriteItems from provider file otherwise getItems.

    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  showFavoritesOnly = true;
                } else {
                  showFavoritesOnly = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              )
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, child) => Badge(
                child: IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  onPressed: (){
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                ),
                value: cart.itemCount.toString()),
          )
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: products.length,
        itemBuilder: (ctx, index) {
          return products == null? Center(child: CircularProgressIndicator(),) : ChangeNotifierProvider.value(
              value: products[index],
              child: ProductItem(
//                  products[index].id,
//                  products[index].title,
//                  products[index].imageUrl);
              ));
        },
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            crossAxisSpacing: 10,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 10,
            maxCrossAxisExtent: 300),
      ),
      drawer: AppDrawer(),
    );
  }
}
