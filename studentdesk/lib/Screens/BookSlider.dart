import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookSlider extends StatefulWidget {
  @override
  _BookSliderState createState() => _BookSliderState();
}

class _BookSliderState extends State<BookSlider> {
  List books;
  int index = 1;

  Future<void> loadJsonData() async {
    var response = await http
        .get("http://studentdesk.in/api/v1/newarrivals?&apiname=newArrivals");
    setState(() {
      books = jsonDecode(response.body)["data"];
    });
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    Widget carousel = books == null
        ? CircularProgressIndicator()
        : CarouselSlider(
            options: CarouselOptions(
              height: 300,
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: books.map((it) {
              return new Container(
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
                                fit: BoxFit.cover,
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
                                  child: Text(
                                    it["name"],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                              )),
                    ),
                  ));
            }).toList(),
          );

    return Container(
      child: Column(
        children: <Widget>[carousel],
      ),
    );
  }
}

//Column(children: <Widget>[
//CarouselSlider(
//options: CarouselOptions(
//height: 300,
//autoPlay: true,
//aspectRatio: 2.0,
//enlargeCenterPage: true,
//),
//items:books.map((it) {
//print(it);
//}).toList(),
//),
//],),
