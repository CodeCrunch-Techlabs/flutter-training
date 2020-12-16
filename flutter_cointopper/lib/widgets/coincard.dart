import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cointopper/bloc/top_coin_bloc/top_coin_bloc.dart'; 
import 'package:flutter_cointopper/bloc/top_coin_bloc/top_coin_state.dart';
import 'package:flutter_cointopper/screens/coin_detail.dart';
import 'package:flutter_cointopper/screens/top_coin.dart';
import 'package:hexcolor/hexcolor.dart'; 

class CoinCard extends StatefulWidget {
  @override
  _CoinCardState createState() => _CoinCardState();
}

class _CoinCardState extends State<CoinCard> {
  @override
  Widget build(BuildContext context) {
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
                                MaterialPageRoute(builder: (_) => TopCoin()));
                          },
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              // width: MediaQuery.of(context).size.width * 0.4,
                              width: 160,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue[800],
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(15)),
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
                      : _cardSlider(
                          context,
                          state.topCoinsList[index].name,
                          state.topCoinsList[index].price,
                          state.topCoinsList[index].percent_change24h,
                          state.topCoinsList[index].logo,
                          state.topCoinsList[index].color1,
                          state.topCoinsList[index].color2,
                          state.topCoinsList[index].symbol);
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

Widget _cardSlider(
    BuildContext context,
    String name,
    double price,
    double percentChange24h,
    String logo,
    String color1,
    String color2,
    String symbol) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => CoinDetails(symbol)));
    },
    child: Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: EdgeInsets.only(top: 10, left: 10, right: 5, bottom: 5),
        width: 160,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [HexColor("$color1"), HexColor("$color2")],
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "\$${price.toStringAsFixed(4)}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
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
                    Text(
                      "\$$percentChange24h%",
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 12,
                      ),
                    ),
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
 