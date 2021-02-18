import 'package:flutter/material.dart';


class CoindetailsTextwidget extends StatelessWidget {
  const CoindetailsTextwidget({
    Key key,
    @required this.data,
    @required this.fontSize,
    @required this.color,
  }) : super(key: key);

  final String data;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
          fontSize: fontSize, color: color, fontWeight: FontWeight.bold),
    );
  }
}
