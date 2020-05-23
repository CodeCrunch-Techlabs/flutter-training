
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:fluttertoast/fluttertoast.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Home(),
        ));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MyHome());
  }
}

//check this https://flutter.dev/docs/catalog/samples/tabbed-app-bar.

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  double targetValue = 24.0;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
         appBar: AppBar(
           bottom: TabBar(
             tabs: <Widget>[
               Tab(text: 'Cat'),
               Tab(text: 'Dog'),
               Tab(text: 'Rabbit')
             ],
           ),
         ),
          body: TabBarView(
            children: <Widget>[
              Image.network('https://cdn.pixabay.com/photo/2014/11/30/14/11/kitty-551554__340.jpg'),
              Image.network('https://static.toiimg.com/thumb/msid-60132235,imgsize-169468,width-800,height-600,resizemode-75/60132235.jpg'),
              Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQrQ8-nDluM0TMzcbJUHfM-UPZSgNBAjnEJSdjnJj941uowl-2f&usqp=CAU')
            ],
          ),
       )
      )
    );
  }
}
