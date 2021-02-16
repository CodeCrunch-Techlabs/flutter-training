import 'package:flutter/material.dart';

class CoinlistHeaderChange extends StatelessWidget {
  const CoinlistHeaderChange({
    Key key,
    @required this.isSortChange,
  }) : super(key: key);

  final bool isSortChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.30,
      child: Row(
        children: [
          Text(
            'CHANGE',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.03,
              fontWeight: FontWeight.w600,
              color: Color(0xFF005580),
            ),
          ),
          Icon(
            isSortChange
                ? Icons.arrow_downward
                : Icons.arrow_upward,
            size: MediaQuery.of(context).size.width * 0.03,
            color: Color(0xFF005580),
          ),
        ],
      ),
    );
  }
}