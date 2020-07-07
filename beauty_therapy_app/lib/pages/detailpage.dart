import 'package:beauty_therapy_app/pages/food.dart';
import 'package:beauty_therapy_app/pages/splash.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Food data;
  DetailPage(this.data);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amberAccent[200],
      body: Column(
        children: [
          SizedBox(
            height: 0,
          ),
          _customeAppBar(),
          Container(
            height: 190,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Hero(
                    tag: "image${widget.data.imgPath}",
                    child: Image(
                      image: AssetImage("images/${widget.data.imgPath}"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${widget.data.size}",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    "\$${widget.data.price.toInt()}",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.amberAccent[200],
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              )),
                          child: Text(
                            "S",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          )),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              )),
                          child: Text(
                            "M",
                            style: TextStyle(
                                fontSize: 20, color: Colors.grey[400]),
                          )),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              )),
                          child: Text(
                            "L",
                            style: TextStyle(
                                fontSize: 20, color: Colors.grey[400]),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildCounter(),
                    ],
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => Addtocart(),
                              ),
                            );
                          },
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.amberAccent[200],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                child: Icon(Icons.shopping_basket),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Add to Cart",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCounter() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.remove,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "1",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.amberAccent[200],
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _customeAppBar() {
    return Container(
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
                      "${widget.data.name}",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("${widget.data.item}",
                        style:
                            TextStyle(fontSize: 20, color: Colors.grey[400])),
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
              Icons.shopping_basket,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
