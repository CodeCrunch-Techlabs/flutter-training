import 'package:flutter/material.dart';

class CoinList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 0.3,
        child: DataTable(
          columns: [
            DataColumn(
                label: Text('NAME/ M.CAP',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ))),
            DataColumn(
                label: Text('CHANGE',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ))),
            DataColumn(
                label: Text('PRICE',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ))),
          ],
          rows: [
            DataRow(cells: [
              DataCell(
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            fontSize: 18,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "BTC/166.50 B",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              DataCell(
                Row(
                  children: [
                    Image(
                      width: 15,
                      height: 15,
                      image: AssetImage("assets/images/up_arrow_green.png"),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '4.46%',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[600],
                      ),
                    ),
                  ],
                ),
              ),
              DataCell(
                Text('Actor'),
              ),
            ]),
            DataRow(cells: [
              DataCell(Text('5')),
              DataCell(Text('John')),
              DataCell(Text('Student')),
            ]),
            DataRow(cells: [
              DataCell(Text('10')),
              DataCell(Text('Harry')),
              DataCell(Text('Leader')),
            ]),
            DataRow(cells: [
              DataCell(Text('15')),
              DataCell(Text('Peter')),
              DataCell(Text('Scientist')),
            ]),
          ],
        ),
      ),
    );
  }
}
