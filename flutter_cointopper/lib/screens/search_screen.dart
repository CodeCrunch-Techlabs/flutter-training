import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_cointopper/widgets/coin_close_icon_button.dart';
import 'package:flutter_cointopper/widgets/custom_safearea_widget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'coin_detail.dart';

List<SearchCoinModel> _searchResult = [];
List<SearchCoinModel> _searchCoins = [];
final String url = 'https://api.cointopper.com/api/v3/search';

class SearchCoinModel {
  final String value;
  final String id;
  final String color1;
  final String color2;
  final String logo;
  final String url;
  final int coinid;
  final int marketId;

  SearchCoinModel(
      {this.value,
      this.id,
      this.color1,
      this.color2,
      this.logo,
      this.url,
      this.coinid,
      this.marketId});

  factory SearchCoinModel.fromJson(Map<String, dynamic> json) {
    return new SearchCoinModel(
      value: json['value'],
      id: json['id'],
      color1: json['color1'],
      color2: json['color2'],
      logo: json['logo'],
      url: json['url'],
      coinid: json['coinid'],
      marketId: json['market_id'],
    );
  }
}

class SearchScreen extends StatefulWidget {
  final String currencyCode;
  final dynamic currencySymbol;
  SearchScreen(this.currencyCode,this.currencySymbol);
  @override
  _SearchScreenState createState() => new _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = new TextEditingController();

  Future<Null> getUserDetails() async {
    final response = await http.get(url);

    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> results = map["data"];
    setState(() {
      for (Map coinlist in results) {
        _searchCoins.add(SearchCoinModel.fromJson(coinlist));
      }
    });
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _searchCoins.forEach((coin) {
      if (coin.value.toLowerCase().contains(text.toLowerCase()))
        _searchResult.add(coin);
    });

    setState(() {});
  }

  @override
  void initState() {
    super.initState(); 
    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return CustomSafeAreaWidget(
      color1: Colors.blue[800],
      color2: Colors.blue[400],
          child: new Scaffold(
        body: new Column( 
          children: <Widget>[
            Container(
               height: MediaQuery.of(context).size.height * 0.15,
              padding: EdgeInsets.only(left: 10, right: 10, ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.blue[800], Colors.blue[400]],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Color(0xFF00e00),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: new Icon(
                            Icons.search,
                            color: Colors.white60,
                          ),
                          title: new TextField(
                            cursorColor: Colors.white60,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            controller: controller,
                            decoration: new InputDecoration(
                                hintText: "Search",
                                hintStyle: TextStyle(color: Colors.white60),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(12))),
                            onChanged: onSearchTextChanged,
                          ),
                          trailing: new IconButton(
                            icon: new Icon(
                              Icons.cancel,
                              color: Colors.white60,
                            ),
                            onPressed: () {
                              controller.clear();
                              onSearchTextChanged('');
                            },
                          ),
                        ),
                      ),
                       CloseButtonWidget(context:context), 
                    ],
                  ),
                ],
              ),
            ),
            new Expanded(
                child: _searchResult.length != 0 || controller.text.isNotEmpty
                    ? new ListView.builder(
                        itemCount: _searchResult.length,
                        itemBuilder: (context, i) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) =>
                                          CoinDetails(_searchResult[i].id, widget.currencyCode,
                                                  widget.currencySymbol)));
                                },
                                child: new ListTile(
                                  leading: new CircleAvatar(
                                    backgroundColor: Colors.black12,
                                    backgroundImage: new NetworkImage(
                                      _searchResult[i].logo,
                                    ),
                                  ),
                                  title: new Text(_searchResult[i].value),
                                ),
                              ),
                              Divider(
                                color: Colors.grey[400],
                                thickness: 1,
                              )
                            ],
                          );
                        },
                      )
                    : Scaffold(
                      backgroundColor: Colors.transparent,
                        body: Center(
                          child: Text("Please search the Keyword"),
                        ),
                      )),
          ],
        ),
      ),
    );
  }
}
