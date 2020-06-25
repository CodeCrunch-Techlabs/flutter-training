import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ecommerceapp/Screens/Home.dart';
 


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.indigo[400],
        secondaryHeaderColor: Colors.orange[200],
        fontFamily: 'Montserrat',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false, //hide debug banner from screen
    );
  }
}


