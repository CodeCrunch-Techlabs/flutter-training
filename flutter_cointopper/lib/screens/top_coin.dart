import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cointopper/bloc/top_coin_bloc/top_coin_bloc.dart';
import 'package:flutter_cointopper/bloc/top_coin_bloc/top_coin_state.dart';

class TopCoin extends StatelessWidget {
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
                        sortAscending: true,
                        sortColumnIndex: 0,
                        headingRowHeight: 30,
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
                          ),
                        ],
                        rows: state.topCoinsList.length != 0
                            ? state.topCoinsList
                                .map(
                                  (coins) => DataRow(cells: [
                                    DataCell(
                                      GestureDetector(
                                        // onTap: () {
                                        //   Navigator.of(context).push(MaterialPageRoute(
                                        //     builder: (_) => CoinDetails(),
                                        //   ));
                                        // },
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
                                            image: AssetImage(
                                                "assets/images/up_arrow_green.png"),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '${coins.percent_change24h}%',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green[600],
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
                                          Text(
                                            "B ${coins.price_btc.toStringAsFixed(8)}",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[500],
                                            ),
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
                    return CircularProgressIndicator();
                  })),
            ),
          ),
        ],
      ),
    );
  }
}
