import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CoinlistBodyPrice extends StatelessWidget {
  final String widget;
  final dynamic item;
  CoinlistBodyPrice(this.widget, this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            item.price > 99999
                ? NumberFormat.compactCurrency(
                    decimalDigits: 2,
                    symbol: '$widget',
                  ).format(item.price)
                : '$widget' + item.price.toStringAsFixed(2),
            style: TextStyle(
              fontSize: 12,
              color: Colors.blue,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Icon(
                FontAwesomeIcons.btc,
                color: Colors.grey[500],
                size: 12,
              ),
              Text(
                "${item.priceBtc.toStringAsFixed(8)}",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
