 

import 'package:flutter/material.dart'; 

class CoinPriceAndChangeWidget extends StatelessWidget {
  final String price;
  final String title;
  final dynamic change;
  final double fontSize1;
  final double fontSize2;
  const CoinPriceAndChangeWidget(
      {Key key,
      this.price,
      this.title,
      this.change,
      this.fontSize1,
      this.fontSize2})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            price,
            style: TextStyle(
                fontSize: fontSize1,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          change != null
              ? Row(
                  children: [ 
                    SizedBox(
                      width: 10,
                    ),
                    Image(
                      height: 12,
                      width: 12,
                      image: AssetImage(change > 0
                          ? "assets/images/up_arrow.png"
                          : "assets/images/down_arrow.png"),
                    ),
                    SizedBox(
                      width: 5,
                    )
                  ],
                )
              : SizedBox(
                  width: 5,
                ),
          Text(
            change != null ? '${change.toStringAsFixed(2)}%' : title,
            style: TextStyle(
                fontSize: fontSize2,
                color: Colors.white60,
                fontWeight: FontWeight.bold),
          ), 
        ],
      ),
    );
  }
}
