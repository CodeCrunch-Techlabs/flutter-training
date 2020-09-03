import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:shopapp/Widget/Product_Item.dart';
import 'package:shopapp/Provider/Product_Provider.dart';

class ProductOverviewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

   final productsData = Provider.of<Products>(context);

   final products  = productsData.items;

    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: products.length,
        itemBuilder: (ctx, index){
          return ChangeNotifierProvider.value(
            value: products[index] ,
              child : ProductItem(
//                  products[index].id,
//                  products[index].title,
//                  products[index].imageUrl);
          )
          );
        },
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 10,
            maxCrossAxisExtent:300
        ),
      ),
    );
  }
}
