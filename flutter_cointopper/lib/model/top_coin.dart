import 'package:flutter_cointopper/entity/top_coin_entity.dart';
import 'package:meta/meta.dart';

@immutable
class TopCoins {
  final dynamic percent_change24h;
  final String logo;
  final dynamic price_btc;
  final dynamic price;
  final String symbol;
  final String name;
  final String color1;
  final String color2;
  final dynamic market_cap_usd;

  TopCoins(this.percent_change24h, this.logo, this.price_btc, this.price,
      this.symbol, this.name, this.color1, this.color2, this.market_cap_usd);

  TopCoinsEntity toEntity() {
    return TopCoinsEntity(percent_change24h, logo, price_btc, price, symbol,
        name, color1, color2, market_cap_usd);
  }

  static TopCoins fromEntity(TopCoinsEntity entity) {
    return TopCoins(
        entity.percent_change24h,
        entity.logo,
        entity.price_btc,
        entity.price,
        entity.symbol,
        entity.name,
        entity.color1,
        entity.color2,
        entity.market_cap_usd);
  }
}
