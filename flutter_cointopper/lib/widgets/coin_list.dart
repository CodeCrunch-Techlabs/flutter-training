import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cointopper/bloc/coin_list_bloc/coin_list_bloc.dart';
import 'package:flutter_cointopper/bloc/coin_list_bloc/coin_list_event.dart';
import 'package:flutter_cointopper/bloc/coin_list_bloc/coin_list_state.dart';
import 'package:flutter_cointopper/screens/coin_detail.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class CoinList extends StatefulWidget {
  @override
  _CoinListState createState() => _CoinListState();
}

class _CoinListState extends State<CoinList> {
  bool isSort = true;
  bool isSortChange = true;
  bool isSortPrice = true;
  var _sortColumnIndex;

  int _maxItems = 10;
  int _numItemsPage = 0;
  int page = -10; 
  ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() { 
    super.dispose();
    controller.removeListener(_scrollListener);
  }

  void _scrollListener() {
    print(controller.position.extentAfter);
    if (controller.position.extentAfter ==
            controller.position.maxScrollExtent ||
        controller.position.extentAfter > 0) {
      setState(() {
        Future.delayed(const Duration(seconds: 0), () {
          return BlocProvider.of<CoinListBloc>(context)
              .add(LoadCoinList(_numItemsPage, _numItemsPage + _maxItems));
        });
      });
      if (_numItemsPage < 1500) {
        _numItemsPage = _numItemsPage + _maxItems;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Container(
          padding: EdgeInsets.only(),
          width: MediaQuery.of(context).size.width,
          child: BlocBuilder<CoinListBloc, CoinListState>(
              builder: (context, state) {
            if (state is CoinListLoadSuccess) { 
              return DataTable(
                columnSpacing: 8.0,
                horizontalMargin: 4.0,
                dataRowHeight: MediaQuery.of(context).size.height * 0.08,
                headingRowHeight: MediaQuery.of(context).size.height * 0.06,
                sortColumnIndex: _sortColumnIndex,
                sortAscending: isSort,
                columns: [
                  DataColumn(
                    label: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'NAME/  M.CAP',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
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
                            state.coinListList
                                .sort((a, b) => b.name.compareTo(a.name));
                            isSort = false;
                          } else {
                            state.coinListList
                                .sort((a, b) => a.name.compareTo(b.name));
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
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF005580),
                      ),
                    ),
                    onSort: (i, b) {
                      setState(() {
                        if (i == 1) {
                          _sortColumnIndex = i;
                          if (isSortChange) {
                            state.coinListList.sort((a, b) => b
                                .percent_change24h
                                .compareTo(a.percent_change24h));
                            isSortChange = false;
                          } else {
                            state.coinListList.sort((a, b) => a
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
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF005580),
                      ),
                    ),
                    onSort: (i, b) {
                      setState(() {
                        if (i == 2) {
                          _sortColumnIndex = i;
                          if (isSortPrice) {
                            state.coinListList
                                .sort((a, b) => b.price.compareTo(a.price));
                            isSortPrice = false;
                          } else {
                            state.coinListList
                                .sort((a, b) => a.price.compareTo(b.price));
                            isSortPrice = true;
                          }
                        }
                      });
                    },
                    numeric: false,
                    tooltip: "PRICE",
                  ),
                ],
                rows: state.coinListList.length != 0
                    ? state.coinListList
                        .map(
                          (coins) => DataRow(cells: [
                            DataCell(
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => CoinDetails(coins.symbol),
                                  ));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(
                                      width: 30,
                                      height: 30,
                                      image: NetworkImage("${coins.logo}"),
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
                                          (coins.market_cap_usd >= 1000000 &&
                                                  coins.market_cap_usd <
                                                      (1000000 * 10 * 100))
                                              ? "${coins.symbol}" +
                                                  " / " +
                                                  (coins.market_cap_usd /
                                                          1000000)
                                                      .toStringAsFixed(2) +
                                                  "M"
                                              : "${coins.symbol}" +
                                                  " / " +
                                                  (coins.market_cap_usd /
                                                          (1000000 * 10 * 100))
                                                      .toStringAsFixed(2) +
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image(
                                    width: 12,
                                    height: 12,
                                    image: AssetImage(coins.percent_change24h >
                                            0
                                        ? "assets/images/up_arrow_green.png"
                                        : "assets/images/down_arrow_red.png"),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '${coins.percent_change24h.toStringAsFixed(2)}%',
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "\$${coins.price.toStringAsFixed(8)}",
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
                    : Center(child: CircularProgressIndicator()),
              );
            }
            return Center(child: CircularProgressIndicator());
          })),
    );
  }
}
// https://medium.com/@jun.chenying/flutter-tutorial-part-5-listview-pagination-scroll-up-to-load-more-ed132f6a06be
// https://github.com/MaikuB/incrementally_loading_listview/blob/master/example/lib/main.dart
// https://www.initpals.com/flutter/how-to-lazy-load-large-list-from-http-rest-api-with-pagination-in-flutter/
