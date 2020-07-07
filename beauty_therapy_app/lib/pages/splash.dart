import 'package:beauty_therapy_app/pages/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Addtocart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 0,
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        )),
                    child: Icon(
                      Icons.arrow_back,
                      size: 16,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(14),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "My Order",
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Mixed Pizza",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.grey[400])),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      )),
                  child: Icon(
                    Icons.delete,
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
          _buildList("images/1.png", "1", "Maxican Pizza", "\$120"),
          _buildList("images/5.png", "3", "Sicilian pizza", "\$300"),
          _buildList("images/3.png", "2", "Italian Pizza", "\$180"),
          Container(
            margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.amberAccent[100],
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      )),
                  child: Icon(
                    Icons.directions_bike,
                    size: 24,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 90,
                      ),
                      Text(
                        "\$0.00",
                        style: TextStyle(
                            fontSize: 18, color: Colors.amberAccent[200]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "Total:",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      SizedBox(
                        width: 90,
                      ),
                      Container(
                        child: Text(
                          "\$460.00",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.amberAccent[200]),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  width: size.width * 1,
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey[100],
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      color: Colors.amberAccent[400],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return Order();
                          }),
                        );
                      },
                      child: Text(
                        "Checkout",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(String image, String qty, String name, String total) {
    return AnimationLimiter(
      child: AnimationConfiguration.staggeredGrid(
        position: 1,
        duration: const Duration(milliseconds: 1000),
        delay: Duration(milliseconds: 200),
        columnCount: 1,
        child: ScaleAnimation(
          child: FadeInAnimation(
            child: Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.1),
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Row(
                children: [
                  Image(
                    width: 70,
                    image: AssetImage(image),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            qty,
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "x",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            name,
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            total,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.amberAccent[200]),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
