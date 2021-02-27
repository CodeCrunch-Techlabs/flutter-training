import 'package:flutter/material.dart';
import 'package:flutter_cointopper/widgets/coin_details_widgets/coin_details_total_cap_widget.dart';
 

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
        BuildTotalCapWidget(
            name: "24 Hrs Volume",
            volume: volume,
            currencySymbol: currencySymbol),
        Divider(
          color: Colors.blue[800],
          thickness: 2,
        ),
        BuildTotalCapWidget(
            name: "Total Coins", volume: coin, currencySymbol: currencySymbol),
        Divider(
          color: Colors.blue[800],
          thickness: 2,
        ),
        BuildTotalCapWidget(
            name: "Market Cap", volume: cap, currencySymbol: currencySymbol),
      ],
    );
  }
} 
