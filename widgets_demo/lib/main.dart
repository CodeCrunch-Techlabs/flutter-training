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
        body: LayoutPage()
        );
  }
}

//check this https://www.youtube.com/watch?v=9z_YNlRlWfA&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=24.

class LayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.network('https://assets.awwwards.com/awards/images/2019/05/illustration-web-design-thumb.jpg'),
        Center(
          child: ClipRect(  // <-- clips to the 200x200 [Container] below
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(
                sigmaX: 3.0,
                sigmaY: 3.0,
              ),
              child: Container(
                alignment: Alignment.center,
                width: 200.0,
                height: 200.0,
                child: Text('Hello World'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

