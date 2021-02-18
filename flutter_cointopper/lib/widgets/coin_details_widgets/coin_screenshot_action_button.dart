import 'package:flutter/material.dart';

class ScreenShotActionButton extends StatelessWidget {
  const ScreenShotActionButton({
    Key key,
    @required this.icon,
    @required this.onPress,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white30,
          ),
          child: Icon(
            icon,
            color: Colors.white,
          )),
      onPressed: onPress,
    );
  }
}
