import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Widgets"),
        ),
        body: MyStatefulWidget(),
      ),
    );
  }
}



class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CheckboxListTile(
          title: const Text('Animate Slowly'),
          value: timeDilation != 1.0,
          onChanged: (bool value) {
            setState(() {
              timeDilation = value ? 10.0 : 1.0;
            });
          },
          secondary: const Icon(Icons.hourglass_empty),
        ),
        CheckboxListTile(
          title: const Text('Item 1'),
          value: _isSelected,
          onChanged: (bool newvalue) {
            setState(() {
              _isSelected = newvalue;
            });
          },
          secondary: const Icon(Icons.favorite),
          activeColor: Colors.green,
          checkColor: Colors.black,
        ),
      ],
    );
  }
}


