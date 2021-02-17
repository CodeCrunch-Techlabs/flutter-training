import 'package:flutter/material.dart';
import 'package:flutter_cointopper/widgets/coin_details_widgets/coin_details_card_header_text.dart';
import 'package:hexcolor/hexcolor.dart';

class CoinlistBodyChange extends StatelessWidget {
  final dynamic item;
  CoinlistBodyChange(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.30,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            width: 12,
            height: 12,
            image: AssetImage(item.percentChange24h > 0
                ? "assets/images/up_arrow_green.png"
                : "assets/images/down_arrow_red.png"),
          ),
          SizedBox(
            width: 5,
          ),
          CoindetailsCardHeaderText(
            title: '${item.percentChange24h.toStringAsFixed(2)}%',
            color: item.percentChange24h > 0
                ? Colors.green[600]
                : HexColor("#a94442"),fontSize: 12
          ),
        ],
      ),
    );
  }
}
