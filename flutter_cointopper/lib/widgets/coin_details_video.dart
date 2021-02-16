import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cointopper/bloc/graph_week_bloc/graph_week_bloc.dart';
import 'package:flutter_cointopper/bloc/graph_week_bloc/graph_week_event.dart';
import 'coin_details_widgets/coin_details_Intro.dart';
import 'coin_details_widgets/coin_details_important_article.dart';
import 'coin_details_widgets/coin_details_important_link.dart';
import 'coin_details_widgets/coin_details_total_cap.dart';
import 'coin_graph.dart';

class CoinDetailsVideo extends StatefulWidget {
  final double volume;
  final dynamic coin;
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
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GraphWeekBloc>(context).add(LoadGraphWeek(widget.marketId));
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
                child: CoinGraph(
                    widget.marketId, widget.color1, widget.color2, true, true),
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
                child: CoinDetailsTotalCap(widget.volume, widget.coin,
                    widget.cap, widget.currencySymbol),
              ),
            ),
          ),
          CoindetailsIntro(
            widget.intro,
            widget.youtube,
          ),
          CoindetailsImpotantlink(
              widget.youtube,
              widget.website,
              widget.explorer,
              widget.facebook,
              widget.blog,
              widget.forum,
              widget.github,
              widget.raddit,
              widget.slack,
              widget.paper),
          CoindetailsImportantarticles(widget.title),
        ],
      ),
    );
  }
}
