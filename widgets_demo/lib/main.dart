

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



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
          body: MyHome(),
        ));
  }
}

//check this https://www.youtube.com/watch?v=dUhmWAz4C7Y&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=70.

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {



  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Container(
         child: ListWheelScrollView(
            children: <Widget>[
              Container(
                color: Colors.blue[100],
              ),
              Container(
                color: Colors.blue[200],
              ),
              Container(
                color: Colors.blue[300],
              ),
              Container(
                color: Colors.blue[400],
              ),
              Container(
                color: Colors.blue[500],
              ),
              Container(
                color: Colors.blue[600],
              )
            ],
           itemExtent: 40,
         ),
      ),
    );
  }
}
