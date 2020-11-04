import 'dart:convert';
import 'package:flutter_cointopper/entity/currency_entity.dart';
import 'package:flutter_cointopper/model/currency.dart';
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
    final response =
        await httpClient.get(Uri.encodeFull('${this.baseUrl + "currency"}'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });

    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> results = map["data"];
    // print(results);

    yield results
        .map((dynamic item) => Currency.fromEntity(
            CurrencyEntity.fromJson(item as Map<String, dynamic>)))
        .toList();
  }
}
