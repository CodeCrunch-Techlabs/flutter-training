import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'coin_details_widgets/coin_details_card_header_text.dart';

class CoinCardSlider extends StatefulWidget {
  final coinCard;

  CoinCardSlider(this.coinCard);

  @override
  _CoinCardSliderState createState() => _CoinCardSliderState(this.coinCard);
}

class _CoinCardSliderState extends State<CoinCardSlider> {
  final coinCard;

  _CoinCardSliderState(this.coinCard);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget carousel = coinCard == null
        ? Container(
            child: Center(
              child: Text(
                "No Data Available",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          )
        : CarouselSlider(
            options: CarouselOptions(
              height: 300,
              autoPlay: true,
              viewportFraction: 1,
              aspectRatio: 1.5,
              enlargeCenterPage: true,
            ),
            items: coinCard.map<Widget>((data) {
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
                                data.photo,
                                height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.fill,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CoindetailsCardHeaderText(
                                            title: data.title,
                                            color: Colors.white,
                                            fontSize: 14),
                                      ],
                                    )),
                              ),
                            ],
                          )),
                    ),
                  ));
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
