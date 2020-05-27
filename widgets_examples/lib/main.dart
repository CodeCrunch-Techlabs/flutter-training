import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
 Widget build(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: Stack(
      children: <Widget>[
        Positioned(
          left: 0,
          width: 250,
          child: RaisedButton(
            color: Colors.red,
            onPressed: () => print("Button 1"),
            child: Text("Button 1"),
          ),
        ),
        Positioned(
          right: 0,
          width: 250,
          child: IgnorePointer( // replace this with AbsorbPointer and button 1 won't receive click
            child: RaisedButton(
              onPressed: () => print("Button 2"),
              child: Text("Button 2"),
            ),
          ),
        ),
      ],
    ),
  );
}
}
