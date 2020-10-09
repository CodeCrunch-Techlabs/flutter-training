import 'package:flutter/material.dart';

class BottomInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 2.0, color: Colors.green[200]),
                left: BorderSide(width: 2.0, color: Colors.green[200]),
                right: BorderSide(width: 2.0, color: Colors.green[200]),
              ),
            ),
            child: Text(
              "Upcoming Studies",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 30, top: 0, right: 30, bottom: 0),
              child: Divider()),
          Text(
            "Learn about and participate in upcoming studies on topics ranging from keto to intermittent fasting to learn what works for people like you",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Interested in runnng a study?",
            style: TextStyle(
              fontSize: 17,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Let's connect",
            style: TextStyle(fontSize: 14, color: Colors.green),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
