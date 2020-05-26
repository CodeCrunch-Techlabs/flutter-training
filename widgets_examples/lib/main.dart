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
    return Scaffold();
}
}