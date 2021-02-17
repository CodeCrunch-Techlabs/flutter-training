import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cointopper/bloc/coin_details_bloc/coin_details_bloc.dart';
import 'package:flutter_cointopper/bloc/coin_details_bloc/coin_details_event.dart';
import 'package:flutter_cointopper/bloc/coin_details_bloc/coin_details_state.dart'; 
import 'package:flutter_cointopper/widgets/coin_details_video.dart';
import 'package:flutter_cointopper/widgets/icon_button_widget.dart';
import 'package:flutter_cointopper/widgets/screenshot_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class CoinDetails extends StatefulWidget {
  final String symbol;
  final String currencyCode;
  final dynamic currencySymbol;
  CoinDetails(this.symbol, this.currencyCode, this.currencySymbol);

  @override
  _CoinDetailsState createState() => _CoinDetailsState();
}

class _CoinDetailsState extends State<CoinDetails> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CoinDetailsBloc>(context)
        .add(LoadCoinDetails(widget.symbol, widget.currencyCode));
    return Scaffold(
      body: BlocBuilder<CoinDetailsBloc, CoinDetailsState>(
          builder: (context, state) {
        if (state is CoinDetailsLoadSuccess) {
          var data = state.coinDetailsList[0];
          final title = data.guides;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [HexColor(data.color1), HexColor(data.color2)],
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white30,
                              ),
                              child: Image(
                                width: 30,
                                height: 30,
                                image: NetworkImage(data.logo),
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            CoindetailsTextwidget(
                              data: '${data.name}/ ${data.symbol}',
                              fontSize: 18,
                              color: Colors.white60,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white30,
                            ),
                            child: Icon(
                              Icons.close,
                              color: Colors.white60,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CoindetailsTextwidget(
                          data: data.price > 99999
                              ? NumberFormat.compactCurrency(
                                  decimalDigits: 2,
                                  symbol: '${widget.currencySymbol}',
                                ).format(data.price)
                              : '${widget.currencySymbol}' +
                                  data.price.toStringAsFixed(2),
                          fontSize: 26,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image(
                          height: 10,
                          width: 10,
                          image: AssetImage(data.percentChange24h > 0
                              ? "assets/images/up_arrow.png"
                              : "assets/images/down_arrow.png"),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CoindetailsTextwidget(
                          data:
                              '${double.parse((data.percentChange24h).toStringAsFixed(2))}%',
                          fontSize: 14,
                          color: Colors.white60,
                        ),
                        
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.btc,
                          color: Colors.white60,
                          size: 14,
                        ),
                        CoindetailsTextwidget(
                          data: "${data.priceBtc.toStringAsFixed(8)}",
                          fontSize: 14,
                          color: Colors.white60,
                        ),
                         
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CoindetailsTextwidget(
                                    data: data.high24Usd > 99999
                                        ? NumberFormat.compactCurrency(
                                            decimalDigits: 2,
                                            symbol: '${widget.currencySymbol}',
                                          ).format(data.high24Usd)
                                        : '${widget.currencySymbol}' +
                                            data.high24Usd.toStringAsFixed(2),
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                  
                                  SizedBox(
                                    width: 8,
                                  ),
                                  CoindetailsTextwidget(
                                    data: "24 HOUR HIGH",
                                    fontSize: 10,
                                    color: Colors.white60,
                                  ),
                                 
                                ],
                              ),
                              Row(
                                children: [
                                  CoindetailsTextwidget(
                                    data: data.low24Usd > 99999
                                        ? NumberFormat.compactCurrency(
                                            decimalDigits: 2,
                                            symbol: '${widget.currencySymbol}',
                                          ).format(data.low24Usd)
                                        : '${widget.currencySymbol}' +
                                            data.low24Usd.toStringAsFixed(2),
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                  
                                  SizedBox(
                                    width: 8,
                                  ),
                                  CoindetailsTextwidget(
                                    data: "24 HOUR LOW",
                                    fontSize: 10,
                                    color: Colors.white60,
                                  ),
                                  
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // width: MediaQuery.of(context).size.width * 0.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButtonWidget(
                                  iconName: Icons.alarm,
                                  onPress: null,
                                  iconColor: Colors.white,
                                  iconBackgroundColor: Colors.white24),
                              SizedBox(
                                width: 6,
                              ),
                              IconButtonWidget(
                                  iconName: Icons.star_border,
                                  onPress: null,
                                  iconColor: Colors.white,
                                  iconBackgroundColor: Colors.white24),
                              SizedBox(
                                width: 6,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.12,
                                decoration: BoxDecoration(
                                  color: Colors.white24,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ScreenShotWidget(
                                    data, widget.currencySymbol),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CoinDetailsVideo(
                  data.volume24hUsd,
                  data.availableSupply,
                  data.marketCapUsd,
                  data.intro,
                  data.youtube,
                  data.website,
                  data.explorer,
                  data.facebook,
                  data.blog,
                  data.forum,
                  data.github,
                  data.raddit,
                  data.slack,
                  data.paper,
                  title,
                  data.marketId,
                  data.color1,
                  data.color2,
                  widget.currencySymbol,
                ),
              )
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}

class CoindetailsTextwidget extends StatelessWidget {
  const CoindetailsTextwidget({
    Key key,
    @required this.data,
    @required this.fontSize,
    @required this.color,
  }) : super(key: key);

  final String data;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
          fontSize: fontSize, color: color, fontWeight: FontWeight.bold),
    );
  }
}
