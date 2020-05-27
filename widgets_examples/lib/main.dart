import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;


void main() => runApp(MyApp());

class MyApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BackDrop filter',
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
            title: new Text( "Backdrop Filter",
              style: new TextStyle(
                  color: Colors.white, 
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
class LayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.network('https://dummyimage.com/600x400/000/fff'),
        Center(
          child: ClipRect(  
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(
                sigmaX: 3.0,
                sigmaY: 3.0,
              ),
              child: Container(
                alignment: Alignment.center,
                width: 200.0,
                height: 200.0,
                child: Text('Jaydip Patel',style: TextStyle(color: Colors.white),),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
