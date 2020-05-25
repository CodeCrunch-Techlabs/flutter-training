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


class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.red,
              height: 100,
              width: 100,
            ),
            Divider(
              color: Colors.black,
              indent: 100,
              endIndent: 100,
              thickness: 10,
              height: 50,
            ),
            Container(
              color: Colors.green,
              height: 100,
              width: 100,
            ),
             Divider(
               color: Colors.black,
               indent: 100,
               endIndent: 100,
               thickness: 10,
               height: 50,
             ),
            Container(
              color: Colors.pink,
              height: 100,
              width: 100,
            )
          ],
        )
      )
    );
  }
}

