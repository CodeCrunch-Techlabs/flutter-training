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
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets'),
      ),
      body: Center(
        child: IgnorePointer(
          child: IconButton(
            icon: Icon(Icons.delete,
            size: 50,
            color: Colors.red,),
            onPressed: (){
              print("pressed");
            },
          ),
          ignoring: false,
        ),
      ),
    );
  }
}

