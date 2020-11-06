import 'package:flutter_cointopper/api/api_client.dart';
import 'package:flutter_cointopper/model/coin_list_all.dart';
import 'package:flutter_cointopper/model/currency.dart';
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
}
