import 'package:flutter_cointopper/entity/coin_list_entity.dart';
import 'package:meta/meta.dart';

@immutable
class CoinList {
  final dynamic percentChange24h;
  final String logo;
  final dynamic priceBtc;
  final dynamic price;
  final String symbol;
  final String name;
  final String color1;
  final String color2;
  final dynamic marketCapUsd;

  CoinList(this.percentChange24h, this.logo, this.priceBtc, this.price,
      this.symbol, this.name, this.color1, this.color2, this.marketCapUsd);

  CoinListEntity toEntity() {
    return CoinListEntity(percentChange24h, logo, priceBtc, price, symbol,
        name, color1, color2, marketCapUsd);
  }

  static CoinList fromEntity(CoinListEntity entity) {
    return CoinList(
        entity.percentChange24h,
        entity.logo,
        entity.priceBtc,
        entity.price,
        entity.symbol,
        entity.name,
        entity.color1,
        entity.color2,
        entity.marketCapUsd);
  }
}
