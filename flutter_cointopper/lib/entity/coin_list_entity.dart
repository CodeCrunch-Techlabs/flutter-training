import 'package:equatable/equatable.dart';

class CoinListEntity extends Equatable {
  final dynamic percentChange24h;
  final String logo;
  final dynamic priceBtc;
  final dynamic price;
  final String symbol;
  final String name;
  final String color1;
  final String color2;
  final dynamic marketCapUsd;

  CoinListEntity(this.percentChange24h, this.logo, this.priceBtc, this.price,
      this.symbol, this.name, this.color1, this.color2, this.marketCapUsd);

  @override
  List<Object> get props => [
        percentChange24h,
        logo,
        priceBtc,
        price,
        symbol,
        name,
        color1,
        color2,
        marketCapUsd
      ];

  Map<String, Object> toJson() {
    return {
      'percent_change24h': percentChange24h,
      'logo': logo,
      'price_btc': priceBtc,
      'price': price,
      'symbol': symbol,
      'name': name,
      'color1': color1,
      'color2': color2,
      'market_cap_usd': marketCapUsd,
    };
  }

  static CoinListEntity fromJson(Map<String, Object> json) {
    return CoinListEntity(
      json['percent_change24h'] as dynamic,
      json['logo'] as String,
      json['price_btc'] as dynamic,
      json['price'] as dynamic,
      json['symbol'] as String,
      json['name'] as String,
      json['color1'] as String,
      json['color2'] as String,
      json['market_cap_usd'] as dynamic,
    );
  }
}
