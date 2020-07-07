import 'package:beauty_therapy_app/pages/home.dart';
import 'package:beauty_therapy_app/pages/payment.dart';
import 'package:beauty_therapy_app/pages/rating.dart';
import 'package:flutter/material.dart';

class TrackOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            _customeAppBar(context),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              width: 300,
              height: 300,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("images/travel.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("images/location.png"),
                    backgroundColor: Colors.transparent,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Congratulations !",
                  style: TextStyle(
                      color: Colors.amberAccent[200],
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your Order is Placed and it's\n         on it's way to you!",
                  style: TextStyle(color: Colors.grey[400], fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              width: size.width * 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  color: Colors.amberAccent[400],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return  Rating();
                      }),
                    );
                  },
                  child: Text(
                    "Track Order",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: size.width * 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: OutlineButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  borderSide: BorderSide(color: Colors.amberAccent, width: 5),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  color: Colors.amberAccent[400],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return  HomePage();
                      }),
                    );
                  },
                  child: Text(
                    "Back Home",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amberAccent,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _customeAppBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amberAccent,
      ),
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return HomePage();
                }),
              );
            },
            child: Container(
              padding: EdgeInsets.all(14),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Options",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
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
              Icons.menu,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
