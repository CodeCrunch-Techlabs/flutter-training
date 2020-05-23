import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(  
      home:Scaffold(  
        appBar: AppBar(  
          title: Text( 
            "Ask Me Anything",
          ),
          backgroundColor: Colors.blue,
        ),
        body: Container( 
          color: Colors.blueGrey,
        ),
      ),
      
    );
  }
}