import 'package:flutter/material.dart';
import 'package:flutter_cointopper/widgets/top_coin.dart';

class CoinCard extends StatefulWidget {
  @override
  _CoinCardState createState() => _CoinCardState();
}

class _CoinCardState extends State<CoinCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),
          width: MediaQuery.of(context).size.width * 1,
          child: Text(
            "Top Viewed",
            style: TextStyle(
              color: Colors.blue[800],
              fontSize: 16,
            ),
          ),
        ),
        // Center(
        //   child: SizedBox(
        //     height: 100, // card height
        //     child: PageView.builder(
        //       itemCount: 10,
        //       controller: PageController(viewportFraction: 0.5,initialPage: 1,),
        //       onPageChanged: (int index) => setState(() => _index = index),
        //       itemBuilder: (_, i) {
        //         return Card(
        //           elevation: 2,
        //           shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(20)),
        //           child: Center(
        //             child: Text(
        //               "Card ${i+1}",
        //               style: TextStyle(fontSize: 32),
        //             ),
        //           ),
        //         );
        //       },
        //     ),
        //   ),
        // )

        Container(
          height: 110.0,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _cardSlider(context, "Bitcoin", "9120.78", "4.46", "bitcoin.png",
                  0xFFF0B028, 0xFFF0B028),
              _cardSlider(context, "Ethereum", "230.91", "3.49", "eth.png",
                  0xFF505050, 0xFF282828),
              _cardSlider(context, "Litecoin", "62.19", "3.34", "ltc.png",
                  0xFFDE4546, 0xFFE70814),
              _cardSlider(context, "Ripple", "0.23978", "2.61", "ripple.png",
                  0xFF689898, 0xFF08F880),
              _cardSlider(context, "Tether", "1.00", "0.44", "tether.png",
                  0xFFF86800, 0xFF404040),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue[800],
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => TopCoin(),
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        "View All",
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

Widget _cardSlider(BuildContext context, String coin, String rate, String price,
    String imageUrl, int lcolor, int rcolor) {
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(lcolor), Color(rcolor)],
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            coin,
            style: TextStyle(
              color: Colors.white60,
            ),
          ),
          Text(
            "\$$rate",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image(
                    width: 15,
                    height: 15,
                    image: AssetImage("assets/images/up_arrow.png"),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "\$$price%",
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white30,
                ),
                child: Image(
                  width: 25,
                  height: 25,
                  image: AssetImage("assets/images/$imageUrl"),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
