
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
        appBar: new AppBar(
            elevation: 0.0,
            title: new Text(
              "Flutter Experiments",
              style: new TextStyle(
                  color: Colors.white,
                  fontFamily: 'Nunito',
                  letterSpacing: 1.0),
            ),
            backgroundColor: new Color(0xFF2979FF),
            centerTitle: true),
        body: MyHome());
  }
}

//check this https://api.flutter.dev/flutter/widgets/AnimatedCrossFade-class.html.

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  bool _first = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: <Widget>[
            Container(
                child: AnimatedCrossFade(
                  duration: const Duration(seconds: 2),
                  firstChild: const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 100.0),
                  secondChild: const FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
                  crossFadeState: _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                )
            ),
            SizedBox(height: 40.0,),
            FlatButton(
              child: Text("Clik Me"),
              onPressed: (){
                setState(() {
                  _first = !_first;
                });
              },
            )
          ],
        )
    );
  }
}
