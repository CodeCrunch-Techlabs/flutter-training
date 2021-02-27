import 'package:flutter/material.dart';
import 'package:flutter_cointopper/screens/coin_detail.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import 'coin_details_widgets/coin_details_card_header_text.dart';
import 'coin_text_fontweight_widget.dart';

class CoinCardSliderWdget extends StatelessWidget {
  final String symbol;
  final String name;
  final dynamic price;
  final dynamic percentChange24h;
  final String logo;
  final String color1;
  final String color2;
  final String currencyCode;
  final dynamic currencySymbol;

  CoinCardSliderWdget({
    Key key,
    @required this.symbol,
    @required this.name,
    @required this.price,
    @required this.percentChange24h,
    @required this.logo,
    @required this.color1,
    @required this.color2,
    @required this.currencyCode,
    @required this.currencySymbol,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _formattedPrice = NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: '$currencySymbol',
    ).format(price);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => CoinDetails(symbol, currencyCode, currencySymbol)));
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 10, right: 5, bottom: 5),
          width: 160,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [HexColor("$color1"), HexColor("$color2")],
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CoindetailsCardHeaderText(
                      title: name, color: Colors.white60, fontSize: 12),
                  CoindetailsTextwidget(
                    data:
                        "${price > 99999 ? _formattedPrice : '$currencySymbol' + price.toStringAsFixed(2)}",
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  Row(
                    children: [
                      Image(
                        width: 10,
                        height: 10,
                        image: AssetImage("assets/images/up_arrow.png"),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      CoindetailsCardHeaderText(
                          title:
                              "${double.parse((percentChange24h).toStringAsFixed(2))}%",
                          color: Colors.white60,
                          fontSize: 12),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white30,
                                ),
                                child: Image(
                                  width: 25,
                                  height: 25,
                                  image: NetworkImage(logo),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
