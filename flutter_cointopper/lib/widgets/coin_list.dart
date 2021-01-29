import 'package:flutter/material.dart';
import 'package:flutter_cointopper/entity/coin_list_entity.dart';
import 'package:flutter_cointopper/model/coin_list_all.dart';
import 'package:flutter_cointopper/screens/coin_detail.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';

Stream<List<CoinList>> getCharacterList(
    int offset, int limit, String currencyCode) async* {
  final response = await http.get(
      Uri.encodeFull(
          '${"https://api.cointopper.com/api/v3/" + "ticker?offset=$offset&limit=$limit&currency=$currencyCode"}'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      });
  Map<String, dynamic> map = json.decode(response.body);
  List<dynamic> results = map["data"];
  yield results
      .map((dynamic item) => CoinList.fromEntity(
          CoinListEntity.fromJson(item as Map<String, dynamic>)))
      .toList();
}

class CoinListScreen extends StatefulWidget {
  final String currencyCode;
  final dynamic currencySymbol;
  CoinListScreen(this.currencyCode, this.currencySymbol);
  @override
  _CoinListScreenState createState() => _CoinListScreenState();
}

class _CoinListScreenState extends State<CoinListScreen> {
  bool isSort = true;
  bool isSortChange = true;
  bool isSortPrice = true;
  static const _pageSize = 20;

  final PagingController<int, CoinList> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems =
          await getCharacterList(pageKey, _pageSize, widget.currencyCode)
              .single;

      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) => CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          backgroundColor: Colors.white,
          elevation: 3,
          toolbarHeight: 35,
          title: Container(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSort) {
                        _pagingController.itemList
                            .sort((a, b) => b.name.compareTo(a.name));
                        isSort = false;
                      } else {
                        _pagingController.itemList
                            .sort((a, b) => a.name.compareTo(b.name));
                        isSort = true;
                      }
                    });
                  },
                  child: Text(
                    'NAME/  M.CAP',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF005580),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSort) {
                        _pagingController.itemList.sort((a, b) =>
                            b.percent_change24h.compareTo(a.percent_change24h));
                        isSort = false;
                      } else {
                        _pagingController.itemList.sort((a, b) =>
                            a.percent_change24h.compareTo(b.percent_change24h));
                        isSort = true;
                      }
                    });
                  },
                  child: Text(
                    'CHANGE',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF005580),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSortPrice) {
                        _pagingController.itemList
                            .sort((a, b) => b.price.compareTo(a.price));
                        isSortPrice = false;
                      } else {
                        _pagingController.itemList
                            .sort((a, b) => a.price.compareTo(b.price));
                        isSortPrice = true;
                      }
                    });
                  },
                  child: Text(
                    'PRICE',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF005580),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        PagedSliverList<int, CoinList>.separated(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (context, item, index) => Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => CoinDetails(item.symbol,
                            widget.currencyCode, widget.currencySymbol),
                      ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          width: 30,
                          height: 30,
                          image: NetworkImage("${item.logo}"),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item.name,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[800],
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                                NumberFormat.compactCurrency(
                                decimalDigits: 2,
                                symbol: '${widget.currencySymbol}',
                              ).format(item.market_cap_usd),
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image(
                        width: 12,
                        height: 12,
                        image: AssetImage(item.percent_change24h > 0
                            ? "assets/images/up_arrow_green.png"
                            : "assets/images/down_arrow_red.png"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${item.percent_change24h.toStringAsFixed(2)}%',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: item.percent_change24h > 0
                              ? Colors.green[600]
                              : HexColor("#a94442"),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.price > 99999
                            ? NumberFormat.compactCurrency(
                                decimalDigits: 2,
                                symbol: '${widget.currencySymbol}',
                              ).format(item.price)
                            : '${widget.currencySymbol}' +
                                item.price.toStringAsFixed(2),
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
                            "${item.price_btc.toStringAsFixed(8)}",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          separatorBuilder: (context, index) => const Divider(
            color: Colors.black38,
          ),
        ),
      ]);

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
