import 'package:flutter_cointopper/entity/search_coin_entity.dart';
import 'package:meta/meta.dart';

@immutable
class SearchCoinModel {
  final String value;
  final String id;
  final String color1;
  final String color2;
  final String logo;
  final String url;
  final int coinid;
  final int marketId;

  SearchCoinModel(this.value, this.id, this.color1, this.color2, this.logo,
      this.url, this.coinid, this.marketId);

  SearchCoinEntity toEntity() {
    return SearchCoinEntity(
        value, id, color1, color2, logo, url, coinid, marketId);
  }

  static SearchCoinModel fromEntity(SearchCoinEntity entity) {
    return SearchCoinModel(
        entity.value,
        entity.id,
        entity.color1,
        entity.color2,
        entity.logo,
        entity.url,
        entity.coinid,
        entity.marketId);
  }
}
