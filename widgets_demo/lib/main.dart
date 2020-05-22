import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;


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
        appBar: new AppBar(
            elevation: 0.0,
            title: new Text("Flutter Experiments",
              style: new TextStyle(
                  color: Colors.white,
                  fontFamily: 'Nunito',
                  letterSpacing: 1.0
              ),
            ),
            backgroundColor: new Color(0xFF2979FF),
            centerTitle: true
        ),
        body: MyHomePage()
        );
  }
}

//check this https://www.youtube.com/watch?v=7FJgd7QN1zI&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=36.

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    print(screenSize.width);
    //small = 360.0
    //large = 640.0
    return Container(
      child: screenSize.width == 360.0  ? SmallSize() : BigSize() ,
    );
  }
}

class SmallSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Container(
                color: Colors.blue,
              ),
            ),
          ),
          Spacer(flex: 3,),//To Add custom space
          Expanded(
            child: Container(
              color: Colors.yellow,
            ),
          ),
          Spacer(flex: 2,),
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}

class BigSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Container(
                color: Colors.blue,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.yellow,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.purpleAccent,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}


