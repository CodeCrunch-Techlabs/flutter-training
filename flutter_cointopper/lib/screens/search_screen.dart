// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_cointopper/bloc/search_coin_bloc/search_coin_bloc.dart';
// import 'package:flutter_cointopper/bloc/search_coin_bloc/search_coin_state.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';

// import 'coin_detail.dart';

// class SearchScreen extends StatelessWidget {
//   final TextEditingController _searchController = TextEditingController();
//   var userDetails = {};
//   var i;
//   List returnTicketDetails = [] ;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: 80,
//             padding: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 0),
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight,
//                 colors: [Colors.blue[800], Colors.blue[400]],
//               ),
//             ),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     BlocBuilder<SearchCoinBloc, SearchCoinState>(
//                       builder: (context, state) {
//                         if (state is SearchCoinLoadSuccess) {
//                           return Container(
//                             height: 40,
//                             width: MediaQuery.of(context).size.width * 0.8,
//                             child: TypeAheadField(
//                               textFieldConfiguration: TextFieldConfiguration(
//                                 autofocus: false,
//                                 decoration: InputDecoration(
//                                   border: OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                       borderRadius: BorderRadius.circular(12)),
//                                   filled: true,
//                                   hintText: 'Search Coin',
//                                   suffixText: 'Clear',
//                                   suffixStyle: TextStyle(
//                                     color: Colors.white60,
//                                     fontSize: 18,
//                                   ),
//                                   hintStyle: TextStyle(
//                                     color: Colors.white60,
//                                     fontSize: 18,
//                                   ),
//                                   contentPadding: EdgeInsets.only(
//                                     left: 14.0,right: 14.0
//                                   ),
//                                 ),
//                               ),
//                               suggestionsCallback: (pattern) async {
//                                 var result = state.searchCoinList.where(
//                                     (coin) => coin.value
//                                         .toLowerCase()
//                                         .contains(pattern.toLowerCase()));
//                                 var mappedData =
//                                     result.map((data) => data.value).toList();
//                                 if (pattern.length > 0) {
//                                   return mappedData.map((coinName) => coinName);
//                                 }
//                                 return null;
//                               },
//                               itemBuilder: (context, suggestion) {
//                                 return ListTile(
//                                   title:
//                                       GestureDetector(child: Text(suggestion)),
//                                 );
//                               },
//                               transitionBuilder: (context, suggestionsBox,
//                                       animationController) =>
//                                   FadeTransition(
//                                 child: suggestionsBox,
//                                 opacity: CurvedAnimation(
//                                     parent: animationController,
//                                     curve: Curves.fastOutSlowIn),
//                               ),
//                               onSuggestionSelected: (suggestion) {
//                                 this._searchController.text = suggestion;
//                                 var data = state.searchCoinList
//                                     .where((e) => e.value == suggestion);
//                                 var cid = data.map((e) => e.id);
//                                 Navigator.of(context).push(MaterialPageRoute(
//                                   builder: (_) => CoinDetails("${cid.single}"),
//                                 ));
//                               },
//                             ),
//                           );
//                         } else {
//                           return CircularProgressIndicator();
//                         }
//                       },
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(4),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           color: Colors.white30,
//                         ),
//                         child: Icon(
//                           Icons.close,
//                           color: Colors.white60,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// // https://medium.com/flutter-community/implementing-auto-complete-search-list-a8dd192bd5f6
// // https://stackoverflow.com/questions/59643010/autocomplete-suggestion-and-search-using-json-data-in-flutter

import 'dart:async';

import 'package:flutter/material.dart';
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
  final int market_id;

  SearchCoinModel(
      {this.value,
      this.id,
      this.color1,
      this.color2,
      this.logo,
      this.url,
      this.coinid,
      this.market_id});

  factory SearchCoinModel.fromJson(Map<String, dynamic> json) {
    return new SearchCoinModel(
      value: json['value'],
      id: json['id'],
      color1: json['color1'],
      color2: json['color2'],
      logo: json['logo'],
      url: json['url'],
      coinid: json['coinid'],
      market_id: json['market_id'],
    );
  }
}

class SearchScreen extends StatefulWidget {
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
    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 90,
            padding: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.blue[800], Colors.blue[400]],
              ),
            ),
            child: Column(
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
                          cursorColor: Colors.white,
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
                                        CoinDetails(_searchResult[i].id)));
                              },
                              child: new ListTile(
                                leading: new CircleAvatar(
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
                  : Center(
                      child: Text("Please search the Keyword"),
                    )),
        ],
      ),
    );
  }
}
