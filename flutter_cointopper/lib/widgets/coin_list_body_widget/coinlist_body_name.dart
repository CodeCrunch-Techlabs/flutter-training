import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CoinlistBodyName extends StatelessWidget {
  final dynamic item;
  final String widget;
  CoinlistBodyName(this.item,this.widget); 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            width: 30,
            height: 30,
            image: NetworkImage("${item.logo}"),
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item.name,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                item.symbol +
                    " / " +
                    NumberFormat.compactCurrency(
                      decimalDigits: 2,
                      symbol: '$widget',
                    ).format(item.marketCapUsd),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

