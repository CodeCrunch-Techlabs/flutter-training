import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

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

//check this https://www.youtube.com/watch?v=T4Uehk3_wlY&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=21.

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
        body: Column(
           children: <Widget>[
             Container(
               width: 400.0,
               height: 100.0,
               color: Colors.red,
               child: FittedBox(
                 fit: BoxFit.fitHeight,
                 child: Container(
                   width: 200.0,
                   height: 200.0,
                   color: Colors.blueAccent,
                 ),
               ),
             ),
             SizedBox(height: 20.0,),
             Container(
               width: 400.0,
               height: 100.0,
               color: Colors.red,
               child: FittedBox(
                 fit: BoxFit.fill,
                 child: Container(
                   width: 200.0,
                   height: 200.0,
                   color: Colors.blueAccent,
                 ),
               ),
             ),
             SizedBox(height: 20.0,),
             Container(
               width: 400.0,
               height: 100.0,
               color: Colors.red,
               child: FittedBox(
                 fit: BoxFit.cover,
                 child: Container(
                   width: 200.0,
                   height: 200.0,
                   color: Colors.blueAccent,
                 ),
               ),
             ),
           ],
        )
    );
  }
}


