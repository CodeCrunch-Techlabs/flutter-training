import 'package:flutter/material.dart'; 

class CoinlistHeaderName extends StatelessWidget {
  const CoinlistHeaderName({
    Key key,
    @required this.isSort,
  }) : super(key: key);

  final bool isSort;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      child: Row(
        children: [
          Text(
            'NAME/  M.CAP',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.03,
              fontWeight: FontWeight.w600,
              color: Color(0xFF005580),
            ),
          ),
          Icon(
            isSort ? Icons.arrow_downward : Icons.arrow_upward,
            size: MediaQuery.of(context).size.width * 0.03,
            color: Color(0xFF005580),
          ),
        ],
      ),
    );
  }
}
