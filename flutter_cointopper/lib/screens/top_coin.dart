import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cointopper/bloc/top_coin_bloc/top_coin_bloc.dart';
import 'package:flutter_cointopper/bloc/top_coin_bloc/top_coin_event.dart';
import 'package:flutter_cointopper/bloc/top_coin_bloc/top_coin_state.dart';
import 'package:flutter_cointopper/widgets/coin_list_body_widget/coinlist_body_change.dart';
import 'package:flutter_cointopper/widgets/coin_list_body_widget/coinlist_body_name.dart';
import 'package:flutter_cointopper/widgets/coin_list_body_widget/coinlist_body_price.dart';
import 'package:flutter_cointopper/widgets/coin_list_widgets/top_coins_header.dart';
import 'package:flutter_cointopper/widgets/custom_safearea_widget.dart'; 
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
  bool ascending = false;
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
                          sortAscending: ascending,
                          columns: [
                            DataColumn(
                              numeric: false,
                              label:
                                  ListHeaderWidget(headerName: 'NAME / M.CAP'),
                              onSort: (i, b) {
                                setState(() {
                                  if (i == 0) {
                                    _sortColumnIndex = i;
                                    if (isSort) {
                                      state.topCoinsList.sort(
                                          (a, b) => b.name.compareTo(a.name));
                                      isSort = false;
                                      ascending = true;
                                    } else {
                                      state.topCoinsList.sort(
                                          (a, b) => a.name.compareTo(b.name));
                                      isSort = true;
                                      ascending = false;
                                    }
                                  }
                                });
                              },
                            ),
                            DataColumn(
                              label: ListHeaderWidget(headerName: 'CHANGE'),
                              numeric: false,
                              onSort: (i, b) {
                                setState(() {
                                  if (i == 1) {
                                    _sortColumnIndex = i;
                                    if (isSortChange) {
                                      state.topCoinsList.sort((a, b) => b
                                          .percentChange24h
                                          .compareTo(a.percentChange24h));
                                      isSortChange = false;
                                      ascending = true;
                                    } else {
                                      state.topCoinsList.sort((a, b) => a
                                          .percentChange24h
                                          .compareTo(b.percentChange24h));
                                      isSortChange = true;
                                      ascending = false;
                                    }
                                  }
                                });
                              },
                            ),
                            DataColumn(
                              numeric: false,
                              label: ListHeaderWidget(headerName: 'PRICE'),
                              onSort: (i, b) {
                                setState(() {
                                  if (i == 2) {
                                    _sortColumnIndex = i;
                                    if (isSortPrice) {
                                      state.topCoinsList.sort(
                                          (a, b) => b.price.compareTo(a.price));
                                      isSortPrice = false;
                                      ascending = true;
                                    } else {
                                      state.topCoinsList.sort(
                                          (a, b) => a.price.compareTo(b.price));
                                      isSortPrice = true;
                                      ascending = false;
                                    }
                                  }
                                });
                              },
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
                                          child: CoinlistBodyName(
                                              coins, widget.currencySymbol),
                                        ),
                                      ),
                                      DataCell(
                                        CoinlistBodyChange(coins),
                                      ),
                                      DataCell(
                                        CoinlistBodyPrice(
                                            widget.currencySymbol, coins),
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
