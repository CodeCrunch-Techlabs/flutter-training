import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopapp/Screens/splash_screen.dart';
import 'package:shopapp/Screens/Product_Overview_Screen.dart';
import 'package:shopapp/Screens/Product_Details.dart';
import 'package:shopapp/Provider/Product_Provider.dart';
import 'package:shopapp/Provider/Cart_Provider.dart';
import 'package:shopapp/Screens/Cart_Screen.dart';
import 'package:shopapp/Provider/Order_Provider.dart';
import 'package:shopapp/Screens/Orders_Screen.dart';
import 'package:shopapp/Screens/User_Product_Screen.dart';
import 'package:shopapp/Screens/Edit_Product_Screen.dart';
import 'package:shopapp/Screens/auth_screen.dart';
import 'package:shopapp/Provider/Auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth() ,
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          update: (ctx, auth, previoudProducts) => Products(auth.gettoken, auth.userId ,previoudProducts == null ? [] : previoudProducts.getItems),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          update: (ctx, auth, previousOrders) => Orders(auth.gettoken, auth.userId, previousOrders == null ? [] : previousOrders.getOrders),
        )
      ],
      child:Consumer<Auth>(builder: (ctx, auth, _) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: auth.isAuth ? ProductOverviewScreen() : FutureBuilder(future: auth.tryAutoLogin(), builder: (ctx, authResultSnapshot)  => authResultSnapshot.connectionState == ConnectionState.waiting ? SplashScreen()  :  AuthScreen(),) ,
        routes: {
          ProductDetails.routeName: (ctx) => ProductDetails(),
          CartScreen.routeName : (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
        },
      ),)
    );
  }
}


