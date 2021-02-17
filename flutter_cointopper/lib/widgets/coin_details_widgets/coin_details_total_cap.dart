import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'coin_details_card_header_text.dart';

class CoinDetailsTotalCap extends StatelessWidget {
  final double volume;
  final dynamic coin;
  final double cap;
  final String currencySymbol;

  CoinDetailsTotalCap(this.volume, this.coin, this.cap, this.currencySymbol);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTotalCap("24 Hrs Volume", volume, currencySymbol),
        Divider(
          color: Colors.blue[800],
          thickness: 2,
        ),
        _buildTotalCap("Total Coins", coin, currencySymbol),
        Divider(
          color: Colors.blue[800],
          thickness: 2,
        ),
        _buildTotalCap("Market Cap", cap, currencySymbol),
      ],
    );
  }
}


Widget _buildTotalCap(String name, dynamic volume, dynamic currencySymbol) {
    var _formattedValue = NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: '$currencySymbol',
    ).format(volume);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           CoindetailsCardHeaderText(title: name,color: Colors.black54,fontSize: 16),
           CoindetailsCardHeaderText(title: _formattedValue,color: Colors.blue[800],fontSize: 16),  
        ],
      ),
    );
  }


