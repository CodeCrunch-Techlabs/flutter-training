import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 
 

void main() => runApp(MyApp());

class MyApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sementic',
        theme: ThemeData( 
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
              "Flutter Sementics",
              style: new TextStyle(
                  color: Colors.white, 
                  letterSpacing: 1.0),
            ),
            backgroundColor: new Color(0xFF2979FF),
            centerTitle: true),
        body:SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Semantics(
                  child: Image.network(
                      'https://dummyimage.com/600x400/000/fff'),
                label: 'sementics image',
                readOnly: true,
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}
 