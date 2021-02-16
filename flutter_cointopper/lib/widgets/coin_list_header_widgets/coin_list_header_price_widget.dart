import 'package:flutter/material.dart';

class CoinlistHeaderPrice extends StatelessWidget {
  const CoinlistHeaderPrice({
    Key key,
    @required this.isSortPrice,
  }) : super(key: key);

  final bool isSortPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.15,
      child: Row(
        children: [
          Text(
            'PRICE',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.03,
              fontWeight: FontWeight.w600,
              color: Color(0xFF005580),
            ),
          ),
          Icon(
            isSortPrice ? Icons.arrow_downward : Icons.arrow_upward,
            size: MediaQuery.of(context).size.width * 0.03,
            color: Color(0xFF005580),
          ),
        ],
      ),
    );
  }
}

