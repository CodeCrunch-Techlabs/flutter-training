import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopapp/Provider/Product_Provider.dart';
import 'package:shopapp/Screens/Edit_Product_Screen.dart';
import 'package:shopapp/Widget/User_Product_Item.dart';
import 'package:shopapp/Widget/App_Drawer.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user−products';

  Future<void> refreshProducts(BuildContext context) async{
   await Provider.of<Products>(context, listen: false).fetchAndSetProducts(true);
  }

  @override
  Widget build(BuildContext context) {

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
      body: FutureBuilder(
       future: refreshProducts(context),
        builder: (ctx, snapShot) =>  snapShot.connectionState == ConnectionState.waiting ? Center(child: CircularProgressIndicator(),) : RefreshIndicator(
          onRefresh: () => refreshProducts(context),
          child:Consumer<Products>(
            builder: (ctx, productData, child) => Padding(
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
          ),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
