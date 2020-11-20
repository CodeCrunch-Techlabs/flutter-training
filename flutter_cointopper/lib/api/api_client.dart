import 'dart:convert';
import 'package:flutter_cointopper/entity/coin_details_entity.dart';
import 'package:flutter_cointopper/entity/coin_list_entity.dart';
import 'package:flutter_cointopper/entity/currency_entity.dart';
import 'package:flutter_cointopper/entity/global_data_entity.dart';
import 'package:flutter_cointopper/entity/top_coin_entity.dart';
import 'package:flutter_cointopper/entity/search_coin_entity.dart';
import 'package:flutter_cointopper/model/coin_details_model.dart';
import 'package:flutter_cointopper/model/coin_list_all.dart';
import 'package:flutter_cointopper/model/currency.dart';
import 'package:flutter_cointopper/model/global_data.dart';
import 'package:flutter_cointopper/model/search_coin_model.dart';
import 'package:flutter_cointopper/model/top_coin.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  String baseUrl;
  String token;
  final http.Client httpClient;

  ApiClient({
    http.Client httpClient,
    this.baseUrl,
  }) : this.httpClient = httpClient ?? http.Client();

  Stream<List<Currency>> fetchCurrencyList() async* {
    final response = await httpClient
        .get(Uri.encodeFull('${this.baseUrl + "currency"}'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });

    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> results = map["data"];
    yield results
        .map((dynamic item) => Currency.fromEntity(
            CurrencyEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }

  Stream<List<TopCoins>> fetchTopCoinsList() async* {
    final response = await httpClient
        .get(Uri.encodeFull('${this.baseUrl + "topsearched"}'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });

    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> results = map["data"];
    yield results
        .map((dynamic item) => TopCoins.fromEntity(
            TopCoinsEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }

  Stream<List<CoinList>> fetchAllCoinsList() async* {
    final response = await httpClient
        .get(Uri.encodeFull('${this.baseUrl + "ticker"}'), headers: {
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

  Stream<List<GlobalData>> fetchGlobalData() async* {
    var gData = [];
    final response = await httpClient
        .get(Uri.encodeFull('${this.baseUrl + "globaldata"}'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    });

    Map<String, dynamic> map = json.decode(response.body);
    var result = map['data'];
    gData.add(result);
    yield gData
        .map((dynamic item) => GlobalData.fromEntity(
            GlobalDataEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }

  Stream<List<CoinDetailsModel>> fetchCoinDetails(String symbol) async* {
    final response = await httpClient.get(
        Uri.encodeFull('${this.baseUrl + "ticker/" + "$symbol"}'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        });
    var convertInArray = [];
    Map<String, dynamic> map = json.decode(response.body);
    var result = map['data'];
    convertInArray.add(result);  
    yield convertInArray
        .map((dynamic item) => CoinDetailsModel.fromEntity(
            CoinDetailsEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }

  Stream<List<SearchCoinModel>> fetchSearchCoinsList() async* {
    final response = await httpClient
        .get(Uri.encodeFull('${this.baseUrl + "search"}'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });

    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> results = map["data"];
    yield results
        .map((dynamic item) => SearchCoinModel.fromEntity(
              SearchCoinEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }
}
