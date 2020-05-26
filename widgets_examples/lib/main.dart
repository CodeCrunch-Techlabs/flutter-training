import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(DividerApp());

class DividerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Divider Widget',
      home: DividerWidget(),
    );
  }
}

class DividerWidget extends StatefulWidget {
  DividerWidget({Key key}) : super(key: key);

  @override
  _DividerWidgetState createState() => _DividerWidgetState();
}

class _DividerWidgetState extends State<DividerWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample Divider'),
        backgroundColor: Colors.black87,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Card(
            child: Container(
              height: 200,
              width: 900,
              child: Center(
                child: Text(
                  "Sample 1",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(color: Colors.red),
            ),
          ),
        ],
      )),
    );
  }
}
