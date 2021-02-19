import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cointopper/bloc/coin_details_bloc/coin_details_bloc.dart';
import 'package:flutter_cointopper/bloc/coin_details_bloc/coin_details_event.dart';
import 'package:flutter_cointopper/bloc/coin_details_bloc/coin_details_state.dart';
import 'package:flutter_cointopper/widgets/coin_details_video.dart';
import 'package:flutter_cointopper/widgets/coin_details_widgets/coin_logo_and_name_widget.dart';
import 'package:flutter_cointopper/widgets/coin_details_widgets/coin_price_change_widget.dart';
import 'package:flutter_cointopper/widgets/coin_text_fontweight_widget.dart';
import 'package:flutter_cointopper/widgets/custom_safearea_widget.dart';
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
    return BlocBuilder<CoinDetailsBloc, CoinDetailsState>(
        builder: (context, state) {
      if (state is CoinDetailsLoadSuccess) {
        var data = state.coinDetailsList[0];
        final title = data.guides;
        return CustomSafeAreaWidget(
          color1: HexColor(data.color1),
          color2: HexColor(data.color2),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [HexColor(data.color1), HexColor(data.color2)],
                    ),
                  ),
                  child: Column(
                    children: [
                      CoinLogoAndNameWidget(
                        widget: data,
                        context: context,
                        closeBtn: true,
                      ),
                      CoinPriceAndChangeWidget(
                          price: data.price > 99999
                              ? NumberFormat.compactCurrency(
                                  decimalDigits: 2,
                                  symbol: '${widget.currencySymbol}',
                                ).format(data.price)
                              : '${widget.currencySymbol}' +
                                  data.price.toStringAsFixed(2),
                          change: data.percentChange24h,
                          fontSize1: 26,
                          fontSize2: 14),
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
                                CoinPriceAndChangeWidget(
                                  price: data.high24Usd > 99999
                                      ? NumberFormat.compactCurrency(
                                          decimalDigits: 2,
                                          symbol: '${widget.currencySymbol}',
                                        ).format(data.high24Usd)
                                      : '${widget.currencySymbol}' +
                                          data.high24Usd.toStringAsFixed(2),
                                  title: "24 HRS HIGH",
                                  fontSize1: 20,
                                  fontSize2: 10,
                                ),
                                CoinPriceAndChangeWidget(
                                  price: data.low24Usd > 99999
                                      ? NumberFormat.compactCurrency(
                                          decimalDigits: 2,
                                          symbol: '${widget.currencySymbol}',
                                        ).format(data.low24Usd)
                                      : '${widget.currencySymbol}' +
                                          data.low24Usd.toStringAsFixed(2),
                                  title: "24 HRS LOW",
                                  fontSize1: 20,
                                  fontSize2: 10,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.12,
                                  height: 40,
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
            ),
          ),
        );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
