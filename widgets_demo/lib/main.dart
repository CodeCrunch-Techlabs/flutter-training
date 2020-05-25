import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class MyClipper extends CustomClipper<Rect>{
  Rect getClip(Size size){
    return Rect.fromLTWH(100, 100, 100, 100);
  }

  bool shouldReclip(oldClipper){
    return false;
  }
}


class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
        child: Center(
          child: ClipOval(
            child: Image.network('https://static01.nyt.com/images/2019/11/05/science/28TB-SUNSET1/merlin_163473282_fe17fc6b-78b6-4cdd-b301-6f63e6ebdd7a-superJumbo.jpg',
            ),
            clipper: MyClipper(),
          )
        ),
    );
  }
}

