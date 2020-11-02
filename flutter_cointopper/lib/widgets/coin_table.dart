import 'package:flutter/material.dart';
import 'package:flutter_cointopper/screens/coin_detail.dart';

class CoinList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: MediaQuery.of(context).size.height * 0.3,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: FittedBox( 
            child: DataTable(
              columnSpacing:100 / 2,
              columns: [
                DataColumn(
                    label: Container(
                  child: Text('NAME/  M.CAP',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                      )),
                )),
                DataColumn(
                    label: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text('CHANGE',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                      )),
                )),
                DataColumn(
                    label: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text('PRICE',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                      )),
                )),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(
                    GestureDetector(
                      // onTap: () {
                      //   Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (_) => CoinDetails(),
                      //   ));
                      // },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            width: 40,
                            height: 40,
                            image: AssetImage("assets/images/bitcoin.png"),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Bitcoin",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[800],
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "BTC/166.50 B",
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
                          image: AssetImage("assets/images/up_arrow_green.png"),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '4.46%',
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
                          "\$${9120.78}",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "B1.00000000",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}