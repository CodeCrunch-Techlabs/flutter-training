import 'package:flutter/material.dart';
import 'package:flutter_cointopper/widgets/coin_details_widgets/coin_details_card_header_text.dart';
import 'package:intl/intl.dart';

class BuildTotalCapWidget extends StatelessWidget {
  final String name;
  final dynamic volume;
  final dynamic currencySymbol;
  BuildTotalCapWidget({
    Key key,
    @required this.name,
    @required this.volume,
    @required this.currencySymbol,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _formattedValue = NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: '$currencySymbol',
    ).format(volume);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CoindetailsCardHeaderText(
              title: name, color: Colors.black54, fontSize: 16),
          CoindetailsCardHeaderText(
              title: _formattedValue, color: Colors.blue[800], fontSize: 16),
        ],
      ),
    );
  }
}
