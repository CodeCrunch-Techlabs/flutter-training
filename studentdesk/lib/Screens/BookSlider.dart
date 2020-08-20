import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:studentdesk/Screens/BookDetails.dart';

class BookSlider extends StatefulWidget {
  final books;

  BookSlider(this.books);

  @override
  _BookSliderState createState() => _BookSliderState(this.books);
}

class _BookSliderState extends State<BookSlider> {
  final books;

  _BookSliderState(this.books);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget carousel = books == null
        ? Container()
        : CarouselSlider(
            options: CarouselOptions(
              height: 350,
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: books.map<Widget>((it) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute( builder: (context) => BookDetails(it["id"])) );
                },
                child: new Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: new BoxDecoration(),
                    child: Container(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            child: Stack(
                              children: <Widget>[
                                Image.network(
                                  it["photo"],
                                  fit: BoxFit.fill,
                                  width: 1000.0,
                                  height: 1000.0,
                                ),
                                Positioned(
                                  bottom: 0.0,
                                  left: 0.0,
                                  right: 0.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(200, 0, 0, 0),
                                          Color.fromARGB(0, 0, 0, 0)
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          it["name"],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          it["author"],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )
                                  ),
                                ),
                              ],
                                )),
                      ),
                    )),
              );
            }).toList(),
          );

    return Container(
      color: Colors.grey[100],
      child: Column(
        children: <Widget>[carousel],
      ),
    );
  }
}
