import 'package:flutter/material.dart';
import 'package:flutter_cointopper/screens/coin_detail.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class DataList extends StatefulWidget {
  final List<dynamic> data;
  DataList(this.data);

  @override
  _DataListState createState() => new _DataListState(this.data);
}

class _DataListState extends State<DataList> {
  final List<dynamic> data;
  _DataListState(this.data);
  int present = 0;
  int perPage = 20;
  var originalItems;

  var items = List<dynamic>();

  @override
  void initState() {
    super.initState();
    originalItems = data;
    setState(() {
      items.addAll(originalItems.getRange(present, present + perPage));
      present = present + perPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.builder(
        itemCount:
            (present <= originalItems.length) ? items.length + 1 : items.length,
        itemBuilder: (context, index) {
          return (index == items.length)
              ? Container(
                  child: FlatButton(
                    child: CircularProgressIndicator(),
                    onPressed: () {
                      setState(() {
                        if ((present + perPage) > originalItems.length) {
                          items.addAll(originalItems.getRange(
                              present, originalItems.length));
                        } else {
                          items.addAll(originalItems.getRange(
                              present, present + perPage));
                        }
                        present = present + perPage;
                      });
                    },
                  ),
                )
              :  Expanded(child: DataTableCoinList(items));
        },
      ),
    );
  }
}

class DataTableCoinList extends StatefulWidget {
  final List<dynamic> items;
  DataTableCoinList(this.items);
  @override
  _DataTableCoinListState createState() => _DataTableCoinListState(this.items);
}

class _DataTableCoinListState extends State<DataTableCoinList> {
  final List<dynamic> items;
  _DataTableCoinListState(this.items);

  bool isSort = true;
  bool isSortChange = true;
  bool isSortPrice = true;
  var _sortColumnIndex;

  @override
  Widget build(BuildContext context) {
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
                  items.sort((a, b) => b.name.compareTo(a.name));
                  isSort = false;
                } else {
                  items.sort((a, b) => a.name.compareTo(b.name));
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
                  items.sort((a, b) =>
                      b.percent_change24h.compareTo(a.percent_change24h));
                  isSortChange = false;
                } else {
                  items.sort((a, b) =>
                      a.percent_change24h.compareTo(b.percent_change24h));
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
                  items.sort((a, b) => b.price.compareTo(a.price));
                  isSortPrice = false;
                } else {
                  items.sort((a, b) => a.price.compareTo(b.price));
                  isSortPrice = true;
                }
              }
            });
          },
          numeric: false,
          tooltip: "PRICE",
        ),
      ],
      rows: items.length != 0
          ? items
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                        (coins.market_cap_usd / 1000000)
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
                          image: AssetImage(coins.percent_change24h > 0
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
}
