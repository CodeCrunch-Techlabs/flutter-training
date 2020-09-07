import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopapp/Provider/Product_Provider.dart';
import 'package:shopapp/Screens/Edit_Product_Screen.dart';
import 'package:shopapp/Widget/User_Product_Item.dart';
import 'package:shopapp/Widget/App_Drawer.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user−products';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: productData.getItems.length,
            itemBuilder: (ctx, index) => productData.getItems == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      UserProductItem(
                          productData.getItems[index].id,
                          productData.getItems[index].title,
                          productData.getItems[index].imageUrl),
                      Divider()
                    ],
                  )),
      ),
      drawer: AppDrawer(),
    );
  }
}
