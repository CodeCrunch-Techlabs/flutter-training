import 'package:flutter_cointopper/api/api_client.dart';
import 'package:flutter_cointopper/model/currency.dart';

class CoinTopperRepository {
  ApiClient apiClient;

  CoinTopperRepository() {
    this.apiClient = ApiClient(
        baseUrl: "https://api.cointopper.com/api/v3/");
  }

  Stream<List<Currency>> loadCurrencyList() async* {
    yield* apiClient.fetchCurrencyList();
  }
}
