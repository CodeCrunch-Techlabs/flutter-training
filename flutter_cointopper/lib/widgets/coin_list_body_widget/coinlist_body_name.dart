import 'package:flutter/material.dart';
import 'package:flutter_cointopper/widgets/coin_details_widgets/coin_details_card_header_text.dart';
import 'package:intl/intl.dart';

class CoinlistBodyName extends StatelessWidget {
  final dynamic item;
  final String widget;
  CoinlistBodyName(this.item, this.widget);
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
              CoindetailsCardHeaderText(
                title: item.name,
                color: Colors.grey[800],
                fontSize:11,
              ), 
              SizedBox(
                height: 6,
              ),
              CoindetailsCardHeaderText(
                title: item.symbol +
                    " / " +
                    NumberFormat.compactCurrency(
                      decimalDigits: 2,
                      symbol: '$widget',
                    ).format(item.marketCapUsd),
                color: Colors.grey[500],fontSize: 12
              ), 
            ],
          )
        ],
      ),
    );
  }
}
