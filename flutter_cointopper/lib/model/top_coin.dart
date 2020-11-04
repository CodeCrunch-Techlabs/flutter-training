import 'package:flutter_cointopper/entity/top_coin_entity.dart';
import 'package:meta/meta.dart';

@immutable
class TopCoins {
  final double percent_change24h;
  final String logo;
  final double price_btc;
  final double price;
  final String symbol;
  final String name;

  TopCoins(this.percent_change24h, this.logo, this.price_btc, this.price,
      this.symbol, this.name);

  TopCoinsEntity toEntity() {
    return TopCoinsEntity(
        percent_change24h, logo, price_btc, price, symbol, name);
  }

  static TopCoins fromEntity(TopCoinsEntity entity) {
    return TopCoins(entity.percent_change24h, entity.logo, entity.price_btc,
        entity.price, entity.symbol, entity.name);
  }
}
