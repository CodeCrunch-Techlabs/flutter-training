import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cointopper/bloc/top_coin_bloc/top_coin_bloc.dart';
import 'package:flutter_cointopper/bloc/top_coin_bloc/top_coin_event.dart';
import 'package:flutter_cointopper/bloc/top_coin_bloc/top_coin_state.dart';
import 'package:flutter_cointopper/widgets/custom_safearea_widget.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'coin_detail.dart';

class TopCoin extends StatefulWidget {
  final String currencyCode;
  final dynamic currencySymbol;

  TopCoin(
    this.currencyCode,
    this.currencySymbol,
  );

  @override
  _TopCoinState createState() => _TopCoinState();
}

class _TopCoinState extends State<TopCoin> {
  bool isSort = true;
  bool isSortChange = true;
  bool isSortPrice = true;
  var _sortColumnIndex;
  var loadData = 20;

  void initState() {
    super.initState();
    BlocProvider.of<TopCoinsBloc>(context)
        .add(LoadTopCoins(widget.currencyCode));
  }

  @override
  Widget build(BuildContext context) {
    return CustomSafeAreaWidget(
      color1: Color(0xFFE70814),
      color2: Color(0xFFDE4546),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFFE70814), Color(0xFFDE4546)],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to Cointopper",
                        style: TextStyle(fontSize: 18, color: Colors.white60),
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
                    children: [
                      Text(
                        "Top Viewed Coins",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.only(),
                    width: MediaQuery.of(context).size.width,
                    child: BlocBuilder<TopCoinsBloc, TopCoinsState>(
                        builder: (context, state) {
                      if (state is TopCoinsLoadSuccess) {
                        return DataTable(
                          columnSpacing: 8.0,
                          horizontalMargin: 4.0,
                          dataRowHeight:
                              MediaQuery.of(context).size.height * 0.08,
                          headingRowHeight:
                              MediaQuery.of(context).size.height * 0.06,
                          sortColumnIndex: _sortColumnIndex,
                          sortAscending: isSort,
                          columns: [
                            DataColumn(
                              label: Container(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'NAME/  M.CAP',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.03,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF005580),
                                  ),
                                ),
                              ),
                              onSort: (i, b) {
                                setState(() {
                                  if (i == 0) {
                                    _sortColumnIndex = i;
                                    if (isSort) {
                                      state.topCoinsList.sort(
                                          (a, b) => b.name.compareTo(a.name));
                                      isSort = false;
                                    } else {
                                      state.topCoinsList.sort(
                                          (a, b) => a.name.compareTo(b.name));
                                      isSort = true;
                                    }
                                  }
                                });
                              },
                              numeric: false,
                              tooltip: "M.CAP",
                            ),
                            DataColumn(
                              label: Text(
                                'CHANGE',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF005580),
                                ),
                              ),
                              onSort: (i, b) {
                                setState(() {
                                  if (i == 1) {
                                    _sortColumnIndex = i;
                                    if (isSortChange) {
                                      state.topCoinsList.sort((a, b) => b
                                          .percentChange24h
                                          .compareTo(a.percentChange24h));
                                      isSortChange = false;
                                    } else {
                                      state.topCoinsList.sort((a, b) => a
                                          .percentChange24h
                                          .compareTo(b.percentChange24h));
                                      isSortChange = true;
                                    }
                                  }
                                });
                              },
                              numeric: false,
                              tooltip: "CHANGE",
                            ),
                            DataColumn(
                              label: Text(
                                'PRICE',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF005580),
                                ),
                              ),
                              onSort: (i, b) {
                                setState(() {
                                  if (i == 2) {
                                    _sortColumnIndex = i;
                                    if (isSortPrice) {
                                      state.topCoinsList.sort(
                                          (a, b) => b.price.compareTo(a.price));
                                      isSortPrice = false;
                                    } else {
                                      state.topCoinsList.sort(
                                          (a, b) => a.price.compareTo(b.price));
                                      isSortPrice = true;
                                    }
                                  }
                                });
                              },
                              numeric: false,
                              tooltip: "PRICE",
                            ),
                          ],
                          rows: state.topCoinsList.length != 0
                              ? state.topCoinsList
                                  .map(
                                    (coins) => DataRow(cells: [
                                      DataCell(
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (_) => CoinDetails(
                                                  coins.symbol,
                                                  widget.currencyCode,
                                                  widget.currencySymbol),
                                            ));
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image(
                                                width: 30,
                                                height: 30,
                                                image: NetworkImage(
                                                    "${coins.logo}"),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    coins.name,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey[800],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Text(
                                                    coins.symbol +
                                                        " / " +
                                                        NumberFormat.compactCurrency(
                                                                decimalDigits:
                                                                    2,
                                                                symbol:
                                                                    '${widget.currencySymbol}')
                                                            .format(coins
                                                                .marketCapUsd),
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey[500],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image(
                                              width: 12,
                                              height: 12,
                                              image: AssetImage(coins
                                                          .percentChange24h >
                                                      0
                                                  ? "assets/images/up_arrow_green.png"
                                                  : "assets/images/down_arrow_red.png"),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '${double.parse((coins.percentChange24h).toStringAsFixed(2))}%',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    coins.percentChange24h > 0
                                                        ? Colors.green[600]
                                                        : HexColor("#a94442"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      DataCell(
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              coins.price > 99999
                                                  ? NumberFormat
                                                      .compactCurrency(
                                                      decimalDigits: 2,
                                                      symbol:
                                                          '${widget.currencySymbol}',
                                                    ).format(coins.price)
                                                  : '${widget.currencySymbol}' +
                                                      coins.price
                                                          .toStringAsFixed(2),
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blue,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  FontAwesomeIcons.btc,
                                                  color: Colors.grey[500],
                                                  size: 12,
                                                ),
                                                Text(
                                                  "${coins.priceBtc.toStringAsFixed(8)}",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey[500],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                  )
                                  .toList()
                              : "Not an arry",
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
