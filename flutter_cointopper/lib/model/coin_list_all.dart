import 'package:flutter_cointopper/entity/coin_list_entity.dart';
import 'package:meta/meta.dart';

@immutable
class CoinList {
  final double percent_change24h;
  final String logo;
  final double price_btc;
  final double price;
  final String symbol;
  final String name;
  final String color1;
  final String color2;
  final double market_cap_usd;

  CoinList(this.percent_change24h, this.logo, this.price_btc, this.price,
      this.symbol, this.name, this.color1, this.color2, this.market_cap_usd);

  CoinListEntity toEntity() {
    return CoinListEntity(percent_change24h, logo, price_btc, price, symbol,
        name, color1, color2, market_cap_usd);
  }

  static CoinList fromEntity(CoinListEntity entity) {
    return CoinList(
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
