 import 'package:flutter/material.dart';
  
  void main() => runApp(SliderExample());
  
  class SliderExample extends StatefulWidget {
    @override
    _SliderExampleState createState() {
      return _SliderExampleState();
    }
  }
  
  class _SliderExampleState extends State {
    int _value = 6;
  
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Slider Tutorial',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Slider Tutorial'),
          ),
          body: Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.ac_unit,
                    size: 30,
                  ),
                  new Expanded(
                    child: Slider(
                        value: _value.toDouble(),
                        min: 1.0,
                        max: 10.0,
                        divisions: 10,
                        activeColor: Colors.red,
                        inactiveColor: Colors.black,
                        label: 'Set a value',
                        onChanged: (double newValue) {
                          setState(() {
                            _value = newValue.round();
                          });
                        },
                        semanticFormatterCallback: (double newValue) {
                          return '${newValue.round()} dollars';
                        }
                    )
                  ),
                ]
              )
            ),
          )
        ),
      );
    }
  }