import 'dart:convert';
import 'package:flutter_cointopper/entity/coin_details_entity.dart';
import 'package:flutter_cointopper/entity/coin_list_entity.dart';
import 'package:flutter_cointopper/entity/currency_entity.dart';
import 'package:flutter_cointopper/entity/featured_news_entity.dart';
import 'package:flutter_cointopper/entity/global_data_entity.dart';
import 'package:flutter_cointopper/entity/graph_week_entity.dart';
import 'package:flutter_cointopper/entity/news_details_entity.dart';
import 'package:flutter_cointopper/entity/news_list_entity.dart';
import 'package:flutter_cointopper/entity/news_search_entity.dart';
import 'package:flutter_cointopper/entity/top_coin_entity.dart';
import 'package:flutter_cointopper/entity/search_coin_entity.dart';
import 'package:flutter_cointopper/model/coin_details_model.dart';
import 'package:flutter_cointopper/model/coin_list_all.dart';
import 'package:flutter_cointopper/model/currency.dart';
import 'package:flutter_cointopper/model/featured_news.dart';
import 'package:flutter_cointopper/model/global_data.dart';
import 'package:flutter_cointopper/model/graph_week_model.dart';
import 'package:flutter_cointopper/model/news_details_model.dart';
import 'package:flutter_cointopper/model/news_list_model.dart';
import 'package:flutter_cointopper/model/news_search_model.dart';
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

  Stream<List<TopCoins>> fetchTopCoinsList(String currencyCode) async* {
    final response = await httpClient
        .get(Uri.encodeFull('${this.baseUrl + "topsearched?currency=$currencyCode"}'), headers: {
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

  Stream<List<CoinList>> fetchAllCoinsList(
      dynamic offset, dynamic limit) async* { 
     final response = await httpClient.get(
        Uri.encodeFull('${this.baseUrl + "ticker?offset=$offset&limit=20"}'),
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

  Stream<List<CoinDetailsModel>> fetchCoinDetails(String symbol,String currencyCode) async* {
    final response = await httpClient.get(
        Uri.encodeFull('${this.baseUrl + "ticker/$symbol?currency=$currencyCode"}'),
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

  Stream<List<FeaturedNews>> fetchFeaturedNewsList() async* {
    final response = await httpClient
        .get(Uri.encodeFull('${this.baseUrl + "featured"}'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });

    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> results = map["data"];
    yield results
        .map((dynamic item) => FeaturedNews.fromEntity(
            FeaturedNewsEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }

  Stream<List<NewsListModel>> fetchNewsList() async* {
    final response = await httpClient
        .get(Uri.encodeFull('${this.baseUrl + "news"}'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });

    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> results = map["data"];
    yield results
        .map((dynamic item) => NewsListModel.fromEntity(
            NewsListEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }

  Stream<List<NewsSearchModel>> fetchSearchNewsList(String keyword) async* {
    final response = await httpClient.get(
        Uri.encodeFull('${this.baseUrl + "search/news?keyword=" + "$keyword"}'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        });

    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> results = map["data"];
    yield results
        .map((dynamic item) => NewsSearchModel.fromEntity(
            NewsSearchEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }

  Stream<List<NewsDetailsModel>> fetchNewsDetails(int id) async* {
    final response = await httpClient
        .get(Uri.encodeFull('${this.baseUrl + "news/" + "$id"}'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    });
    var convertInArray = [];
    Map<String, dynamic> map = json.decode(response.body);
    var results = map["data"];
    convertInArray.add(results);
    yield convertInArray
        .map((dynamic item) => NewsDetailsModel.fromEntity(
            NewsDetailsEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }

  Stream<List<GraphWeekModel>> fetchGraphWeekList(int marketId) async* { 
    final String graphUrl = "https://graph.cointopper.com/";
    final response = await httpClient.get(
        Uri.encodeFull('${graphUrl + "historyweekhours/" + "$marketId"}'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        });

    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> results = map["data"]; 
    yield results
        .map((dynamic item) => GraphWeekModel.fromEntity(
            GraphWeekModelEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }
}
