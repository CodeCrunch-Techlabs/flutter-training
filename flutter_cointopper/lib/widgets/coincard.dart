import 'package:flutter/material.dart';
import 'package:flutter_cointopper/widgets/coin_detail.dart';
import 'package:flutter_cointopper/widgets/top_coin.dart';
import 'package:hexcolor/hexcolor.dart';

class CoinCard extends StatefulWidget {
  
  @override
  _CoinCardState createState() => _CoinCardState( );
}

class _CoinCardState extends State<CoinCard> { 
    dynamic dummyData = [
    {
      "logo": "bitcoin.png",
      "price": 9120.78,
      "name": "Bitcoin ",
      "percent_change24h": 4.46,
      "color1": 0xFFF8A040,
      "color2": 0xFFF8A008,
    },
    {
      "logo": "eth.png",
      "price": 0.001233,
      "name": "Dogecoin ",
      "percent_change24h": 4.66,
      "color1": 0xFFB8A030,
      "color2": 0xFFB8A028,
    },
    {
      "logo": "ltc.png",
      "price": 0.01,
      "name": "TRON ",
      "percent_change24h": 4.17,
      "color1": 0xFFE70814,
      "color2": 0xFFDE4546,
    },
    {
      "logo": "ripple.png",
      "price": 0.23,
      "name": "Ripple ",
      "percent_change24h": 2.61,
      "color1": 0xFF818181,
      "color2": 0xFF0e0e0e,
    },
    {
      "logo": "tether.png",
      "price": 336.62,
      "name": "Bitcoin Cash ",
      "percent_change24h": 5.77,
      "color1": 0xFFF09018,
      "color2": 0xFFF89828,
    },
    {
      "logo": "bitcoin.jpg",
      "price": 336.62,
      "name": "Bitcoin",
      "percent_change24h": 5.77,
      "color1": 0xFFF09018,
      "color2": 0xFFF89828,
    },
  ];
  
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
                color: HexColor("#005580"),
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          height: 80.0,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dummyData.length,
            itemBuilder: (context, index) {
              return index == 5
                  ? GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => TopCoin()));
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
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : _cardSlider(
                      context,
                      dummyData[index]['name'],
                      dummyData[index]['price'],
                      dummyData[index]['percent_change24h'],
                      dummyData[index]['logo'],
                      dummyData[index]['color1'],
                      dummyData[index]['color2'],
                    );
            },
          ),
        ),
      ],
    );
  }
}

Widget _cardSlider(BuildContext context, String coin, double rate, double price,
    String imageUrl, int lcolor, int rcolor) {
      
  return GestureDetector(
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => CoinDetails(coin,rate,price,imageUrl,lcolor,rcolor)));
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
              colors: [Color(lcolor), Color(rcolor)],
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coin,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "\$$rate",
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
                      "\$$price%",
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
                              padding: EdgeInsets.all(0.5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white30,
                              ),
                              child: Image(
                                width: 30,
                                height: 30,
                                image: AssetImage("assets/images/$imageUrl"),
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
