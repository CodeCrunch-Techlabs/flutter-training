import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_cointopper/model/coin_list_model.dart'; 
import 'coin_detail.dart';

class CoinList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(),
        width: MediaQuery.of(context).size.width,
        child: 
        DataTable(
          columnSpacing: 8.0,
          horizontalMargin: 4.0,
          dataRowHeight: MediaQuery.of(context).size.height * 0.07,
          sortAscending: true,
          sortColumnIndex: 0, 
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
            ),
          ],
          rows: CoinListModel.getList().length != 0
              ? CoinListModel.getList()
                  .map(
                    (coins) => DataRow( 
                        cells: [
                          DataCell(
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => CoinDetails(),
                                ));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image(
                                    width: 40,
                                    height: 40,
                                    image: AssetImage(
                                        "assets/images/${coins.logo}"),
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
                                        "${coins.symbol}/166.50 B",
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                  "B ${coins.price_btc}",
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
        ),
      ),
    );
  }
}
