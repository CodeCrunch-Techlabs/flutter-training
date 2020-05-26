
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
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          child: Align(
            alignment: Alignment.topLeft,
            widthFactor: 0.75,
            heightFactor: 0.75,
            child: Image.network('https://www.woolha.com/media/2019/08/flutter-cliprect.jpg'),
          ),
        ),
      ),
    );
  }
}
