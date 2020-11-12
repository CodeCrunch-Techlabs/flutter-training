import 'package:flutter_cointopper/api/api_client.dart';
import 'package:flutter_cointopper/model/coin_details_model.dart';
import 'package:flutter_cointopper/model/coin_list_all.dart';
import 'package:flutter_cointopper/model/currency.dart';
import 'package:flutter_cointopper/model/global_data.dart';
import 'package:flutter_cointopper/model/top_coin.dart';

class CoinTopperRepository {
  ApiClient apiClient;

  CoinTopperRepository() {
    this.apiClient = ApiClient(baseUrl: "https://api.cointopper.com/api/v3/");
  }

  Stream<List<Currency>> loadCurrencyList() async* {
    yield* apiClient.fetchCurrencyList();
  }

  Stream<List<TopCoins>> loadTopCoinsList() async* {
    yield* apiClient.fetchTopCoinsList();
  }

  Stream<List<CoinList>> loadAllCoinsList() async* {
    yield* apiClient.fetchAllCoinsList();
  }

  Stream<List<GlobalData>> loadGlobalData() async* {
    yield* apiClient.fetchGlobalData();
  }

  Stream<List<CoinDetailsModel>> loadCoinDetailsList(symbol) async* {
    yield* apiClient.fetchCoinDetails(symbol);
  }
}
