import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Container(
    color: Colors.white,
    child: Column(
      children: <Widget>[
        Icon(Icons.person),
        Text('User'),
        Icon(Icons.person),
      ],
    ),
  )));
}
