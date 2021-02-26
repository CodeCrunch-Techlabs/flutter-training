import 'package:flutter/material.dart';

class CoindetailsCardHeaderText extends StatelessWidget {
  const CoindetailsCardHeaderText({
    Key key,
    @required this.title,
    @required this.color,
    @required this.fontSize
  }) : super(key: key);

  final String title;
  final Color color;
  final double fontSize; 
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow:TextOverflow.ellipsis ,
      softWrap: false,
      style: TextStyle(
        fontSize: fontSize,
        color: color,  
      ),
    );
  }
}
