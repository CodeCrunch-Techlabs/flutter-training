import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cointopper/bloc/top_coin_bloc/top_coin_bloc.dart';
import 'package:flutter_cointopper/bloc/top_coin_bloc/top_coin_state.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'coin_detail.dart';

class TopCoin extends StatefulWidget {
  @override
  _TopCoinState createState() => _TopCoinState();
}

class _TopCoinState extends State<TopCoin> {
  bool isSort = true;
  bool isSortChange = true;
  bool isSortPrice = true;
  var _sortColumnIndex;
  var loadData = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            padding: EdgeInsets.only(top: 30, left: 10, right: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFFE70814), Color(0xFFDE4546)],
              ),
            ),
            child: Column(
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
                                      MediaQuery.of(context).size.width * 0.03,
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
                                        .percent_change24h
                                        .compareTo(a.percent_change24h));
                                    isSortChange = false;
                                  } else {
                                    state.topCoinsList.sort((a, b) => a
                                        .percent_change24h
                                        .compareTo(b.percent_change24h));
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
                                            builder: (_) =>
                                                CoinDetails(coins.symbol),
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
                                              image:
                                                  NetworkImage("${coins.logo}"),
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
                                                  (coins.market_cap_usd >=
                                                              1000000 &&
                                                          coins.market_cap_usd <
                                                              (1000000 *
                                                                  10 *
                                                                  100))
                                                      ? "${coins.symbol}" +
                                                          " / " +
                                                          (coins.market_cap_usd /
                                                                  1000000)
                                                              .toStringAsFixed(
                                                                  2) +
                                                          "M"
                                                      : "${coins.symbol}" +
                                                          " / " +
                                                          (coins.market_cap_usd /
                                                                  (1000000 *
                                                                      10 *
                                                                      100))
                                                              .toStringAsFixed(
                                                                  2) +
                                                          "B",
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
                                                        .percent_change24h >
                                                    0
                                                ? "assets/images/up_arrow_green.png"
                                                : "assets/images/down_arrow_red.png"),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '${coins.percent_change24h}%',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: coins.percent_change24h > 0
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
                                            "\$${coins.price}",
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
                                                "${coins.price_btc.toStringAsFixed(8)}",
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
    );
  }
}
