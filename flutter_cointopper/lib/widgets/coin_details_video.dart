import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cointopper/bloc/graph_week_bloc/graph_week_bloc.dart';
import 'package:flutter_cointopper/bloc/graph_week_bloc/graph_week_event.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:sticky_headers/sticky_headers.dart';  

import 'coin_details_widgets/coin_important_links.dart';
import 'coin_details_widgets/details_img_carousel.dart';
import 'coin_details_widgets/details_youtube_player.dart';
import 'coin_graph.dart';

class CoinDetailsVideo extends StatefulWidget {
  final double volume;
  final double coin;
  final double cap;
  final String intro;
  final String youtube;
  final String website;
  final String explorer;
  final String facebook;
  final String blog;
  final String forum;
  final String github;
  final String raddit;
  final String slack;
  final String paper;
  final title;
  final int marketId;
  final String color1;
  final String color2;
  final String currencySymbol;
  CoinDetailsVideo(
      this.volume,
      this.coin,
      this.cap,
      this.intro,
      this.youtube,
      this.website,
      this.explorer,
      this.facebook,
      this.blog,
      this.forum,
      this.github,
      this.raddit,
      this.slack,
      this.paper,
      this.title,
      this.marketId,
      this.color1,
      this.color2,
      this.currencySymbol);
  @override
  _CoinDetailsVideoState createState() => _CoinDetailsVideoState();
}

class _CoinDetailsVideoState extends State<CoinDetailsVideo> { 

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  } 
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GraphWeekBloc>(context)
        .add(LoadGraphWeek(widget.marketId)); 
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Card(
              elevation: 3,
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child:
                    CoinGraph(widget.marketId, widget.color1, widget.color2, true, true), 
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Card(
              elevation: 3,
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    _buildTotalCap(
                        "24 Hrs Volume", widget.volume, widget.currencySymbol),
                    Divider(
                      color: Colors.blue[800],
                      thickness: 2,
                    ),
                    _buildTotalCap(
                        "Total Coins", widget.coin, widget.currencySymbol),
                    Divider(
                      color: Colors.blue[800],
                      thickness: 2,
                    ),
                    _buildTotalCap(
                        "Market Cap", widget.cap, widget.currencySymbol),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              elevation: 3,
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ReadMoreText(
                      removeAllHtmlTags(widget.intro),
                      trimLines: 1,
                      colorClickableText: Colors.blue,
                      trimCollapsedText: '...Show more',
                      trimExpandedText: ' show less',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                   DetailsYoutubePlayer(widget.youtube),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Card(
              elevation: 3,
              child: Container(
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StickyHeader(
                      header: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Text(
                          "Important Links",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      content: CoinImportantLinks(
                        widget.youtube,
                        widget.website,
                        widget.explorer,
                        widget.facebook,
                        widget.blog,
                        widget.forum,
                        widget.github,
                        widget.raddit,
                        widget.slack,
                        widget.paper,
                      ),
                    ), 
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: Card(
              elevation: 3,
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Important Articles",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DetailsImageCarousel(widget.title), 
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalCap(String name, dynamic volume, dynamic currencySymbol) {
    var _formattedValue = NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: '$currencySymbol',
    ).format(volume);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          Text(
            _formattedValue,
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue[800],
            ),
          ),
        ],
      ),
    );
  }
}
