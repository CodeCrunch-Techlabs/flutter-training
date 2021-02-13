import 'package:flutter_cointopper/entity/top_coin_entity.dart';
import 'package:meta/meta.dart';

@immutable
class TopCoins {
  final dynamic percentChange24h;
  final String logo;
  final dynamic priceBtc;
  final dynamic price;
  final String symbol;
  final String name;
  final String color1;
  final String color2;
  final dynamic marketCapUsd;

  TopCoins(this.percentChange24h, this.logo, this.priceBtc, this.price,
      this.symbol, this.name, this.color1, this.color2, this.marketCapUsd);

  TopCoinsEntity toEntity() {
    return TopCoinsEntity(percentChange24h, logo, priceBtc, price, symbol,
        name, color1, color2, marketCapUsd);
  }

  static TopCoins fromEntity(TopCoinsEntity entity) {
    return TopCoins(
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
