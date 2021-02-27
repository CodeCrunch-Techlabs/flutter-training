import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cointopper/bloc/top_coin_bloc/top_coin_bloc.dart';
import 'package:flutter_cointopper/bloc/top_coin_bloc/top_coin_event.dart'; 
import 'package:flutter_cointopper/bloc/top_coin_bloc/top_coin_state.dart'; 
import 'package:flutter_cointopper/screens/top_coin.dart';
import 'package:flutter_cointopper/widgets/coin_card_slider_widget.dart';
import 'package:hexcolor/hexcolor.dart'; 

class CoinCard extends StatefulWidget {
  final String currencyCode;
  final String currencySymbol;
  CoinCard(this.currencyCode,this.currencySymbol);

  @override
  _CoinCardState createState() => _CoinCardState();
}

class _CoinCardState extends State<CoinCard> {
  @override
  Widget build(BuildContext context) {
     BlocProvider.of<TopCoinsBloc>(context)
        .add(LoadTopCoins(widget.currencyCode));
    return BlocBuilder<TopCoinsBloc, TopCoinsState>(builder: (context, state) {
      if (state is TopCoinsLoadSuccess) {
        return Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),
              width: MediaQuery.of(context).size.width * 1,
              child: Text(
                "Top Viewed",
                style: TextStyle(
                    color: HexColor("#005580"),
                    fontSize: MediaQuery.of(context).size.width * 0.03,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              height: 80.0,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.topCoinsList.length - 4,
                itemBuilder: (context, index) {
                  return index == 5
                      ? GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => TopCoin(widget.currencyCode, widget.currencySymbol)));
                          },
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              // width: MediaQuery.of(context).size.width * 0.4,
                              width: 160,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue[800],
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "View All",
                                  style: TextStyle(
                                    color: Colors.blue[800],
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : CoinCardSliderWdget(
                            symbol: state.topCoinsList[index].symbol,
                            name: state.topCoinsList[index].name,
                            price: state.topCoinsList[index].price,
                            percentChange24h: state
                                .topCoinsList[index].percentChange24h,
                            logo: state.topCoinsList[index].logo,
                            color1: state.topCoinsList[index].color1,
                            color2: state.topCoinsList[index].color2,
                            currencyCode: widget.currencyCode,
                            currencySymbol: widget.currencySymbol,
                          );
                },
              ),
            ),
          ],
        );
      }

      return CircularProgressIndicator();
    });
  }
} 