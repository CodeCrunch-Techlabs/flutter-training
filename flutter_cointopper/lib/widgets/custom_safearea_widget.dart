import 'package:flutter/material.dart';

class CustomSafeAreaWidget extends StatelessWidget {
  final Widget child;
  final Color color1;
  final Color color2;
  CustomSafeAreaWidget({
    Key key,
    @required this.child,
    this.color1,
    this.color2,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color1,
            color2,
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: child,
      ),
    );
  }
}