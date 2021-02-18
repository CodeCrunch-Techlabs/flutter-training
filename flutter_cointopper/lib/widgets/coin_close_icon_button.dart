import 'package:flutter/material.dart';

class CloseButtonWidget extends StatelessWidget {
  final BuildContext context;
  CloseButtonWidget({Key key, this.context}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(56),
          color: Colors.white30,
        ),
        child: Icon(
          Icons.close,
          color: Colors.white60,
          size: 24.0,
        ),
      ),
    );
  }
}