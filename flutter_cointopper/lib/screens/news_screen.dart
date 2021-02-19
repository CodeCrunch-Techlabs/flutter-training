import 'package:flutter/material.dart';
import 'package:flutter_cointopper/screens/news_search.dart';
import 'package:flutter_cointopper/widgets/custom_safearea_widget.dart';
import 'package:flutter_cointopper/widgets/news_featured.dart';

import 'news_list_screen.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  var textInput;
  @override
  Widget build(BuildContext context) { 
    return  CustomSafeAreaWidget(
      color1: Color(0xFFdb1ec9),
      color2: Color(0xFFff005a),
          child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
             height: MediaQuery.of(context).size.height * 0.20,
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFFdb1ec9), Color(0xFFff005a)],
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CoinTopper",
                        style: TextStyle(fontSize: 18, color: Colors.white60),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "News",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => NewsSearch()));
                        },
                        child: Container(
                            padding:
                                EdgeInsets.only(top: 10, bottom: 10, left: 10),
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              // color: Color(0xFF00e00),
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "Search",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
            NewsFeatured(),
            Expanded(child: NewsList()),
          ],
        ),
      ),
    );
  }
}
