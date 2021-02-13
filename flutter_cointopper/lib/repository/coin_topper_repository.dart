import 'package:flutter_cointopper/api/api_client.dart';
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

class CoinTopperRepository {
  ApiClient apiClient;

  CoinTopperRepository() {
    this.apiClient = ApiClient(baseUrl: "https://api.cointopper.com/api/v3/");
  }

  Stream<List<Currency>> loadCurrencyList() async* {
    yield* apiClient.fetchCurrencyList();
  }

  Stream<List<TopCoins>> loadTopCoinsList(String currencyCode) async* {
    yield* apiClient.fetchTopCoinsList(currencyCode);
  }

  Stream<List<CoinList>> loadAllCoinsList(offset, limit) async* {
    yield* apiClient.fetchAllCoinsList(offset, limit);
  }

  Stream<List<GlobalData>> loadGlobalData() async* {
    yield* apiClient.fetchGlobalData();
  }

  Stream<List<CoinDetailsModel>> loadCoinDetailsList(symbol,String currencyCode) async* {
    yield* apiClient.fetchCoinDetails(symbol,currencyCode);
  }

  Stream<List<SearchCoinModel>> loadSearchCoinsList() async* {
    yield* apiClient.fetchSearchCoinsList();
  }

  Stream<List<FeaturedNews>> loadFeaturedNewsList() async* {
    yield* apiClient.fetchFeaturedNewsList();
  }

  Stream<List<NewsListModel>> loadNewsList() async* {
    yield* apiClient.fetchNewsList();
  }

  Stream<List<NewsSearchModel>> loadSearchNewsList(keyword) async* {
    yield* apiClient.fetchSearchNewsList(keyword);
  }

  Stream<List<NewsDetailsModel>> loadNewsDetails(id) async* {
    yield* apiClient.fetchNewsDetails(id);
  }

  Stream<List<GraphWeekModel>> loadGraphWeekList(marketId) async* {
    yield* apiClient.fetchGraphWeekList(marketId);
  }
}
