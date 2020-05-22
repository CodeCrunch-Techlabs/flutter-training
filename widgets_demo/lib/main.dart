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

//check this https://stackoverflow.com/questions/58883067/flutter-custom-animated-icon.

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {


    return Container(
      child: SafeArea(
        child: Column(
         children: <Widget>[
           AspectRatio(
             aspectRatio: 3/2,
             child: Container(
               color: Colors.blueAccent,
             ),
           ),
           AspectRatio(
             aspectRatio: 2/1,
              child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRtY30QvsrmcLKkQw8nI7dJiCoGVWWUnwpaQtpP3ZkZRPos1kh3&usqp=CAU'),
           )
         ],
        ),
      )
    );
  }
}




