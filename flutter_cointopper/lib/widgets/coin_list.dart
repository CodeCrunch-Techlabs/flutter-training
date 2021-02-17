import 'package:flutter/material.dart';
import 'package:flutter_cointopper/entity/coin_list_entity.dart';
import 'package:flutter_cointopper/model/coin_list_all.dart';
import 'package:flutter_cointopper/screens/coin_detail.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'coin_list_body_widget/coinlist_body_change.dart';
import 'coin_list_body_widget/coinlist_body_name.dart';
import 'coin_list_body_widget/coinlist_body_price.dart'; 
import 'coin_list_widgets/coin_list_header_name_widget.dart'; 

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
  String code = 'USD';

  final PagingController<int, CoinList> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey, widget.currencyCode);
    });

    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Stream<List<CoinList>> getCharacterList(
      int offset, int limit, String currencyCode) async* {
    final response = await http.get(
        Uri.encodeFull(
            '${"https://api.cointopper.com/api/v3/" + "ticker?offset=$offset&limit=$limit&currency=${widget.currencyCode}"}'),
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

  Future<void> _fetchPage(int pageKey, currencyCode) async {
    try {
      final newItems =
          await getCharacterList(pageKey, _pageSize, currencyCode).single;

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

  dynamic refreshControl() {
    if (widget.currencyCode != code) {
      code = widget.currencyCode;
      _pagingController.refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    refreshControl();
    return CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        pinned: true,
        backgroundColor: Colors.white,
        elevation: 3,
        primary: false,
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
                child: CoinlistHeaderName(
                    isSort: isSort, name: 'NAME / M.CAP', width: 0.45),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (isSortChange) {
                      _pagingController.itemList.sort((a, b) =>
                          b.percentChange24h.compareTo(a.percentChange24h));
                      isSortChange = false;
                    } else {
                      _pagingController.itemList.sort((a, b) =>
                          a.percentChange24h.compareTo(b.percentChange24h));
                      isSortChange = true;
                    }
                  });
                },
                child: CoinlistHeaderName(
                    isSort: isSortChange, name: 'CHANGE', width: 0.30),
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
                child: CoinlistHeaderName(
                    isSort: isSortChange, name: 'PRICE', width: 0.15),
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
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => CoinDetails(
                      item.symbol, widget.currencyCode, widget.currencySymbol),
                ));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CoinlistBodyName(item, widget.currencySymbol),
                  CoinlistBodyChange(item),
                  CoinlistBodyPrice(widget.currencySymbol, item),
                ],
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => const Divider(
          color: Colors.black38,
        ),
      ),
    ]);
  }
}
