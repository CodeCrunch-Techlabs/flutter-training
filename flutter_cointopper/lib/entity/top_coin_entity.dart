import 'package:equatable/equatable.dart';

class TopCoinsEntity extends Equatable {
  final dynamic percent_change24h;
  final String logo;
  final dynamic price_btc;
  final dynamic price;
  final String symbol;
  final String name;
  final String color1;
  final String color2;
  final dynamic market_cap_usd;

  TopCoinsEntity(this.percent_change24h, this.logo, this.price_btc, this.price,
      this.symbol, this.name, this.color1, this.color2, this.market_cap_usd);

  @override
  List<Object> get props => [
        percent_change24h,
        logo,
        price_btc,
        price,
        symbol,
        name,
        color1,
        color2,
        market_cap_usd
      ];

  Map<String, Object> toJson() {
    return {
      'percent_change24h': percent_change24h,
      'logo': logo,
      'price_btc': price_btc,
      'price': price,
      'symbol': symbol,
      'name': name,
      'color1': color1,
      'color2': color2,
      'market_cap_usd': market_cap_usd,
    };
  }

  static TopCoinsEntity fromJson(Map<String, Object> json) {
    return TopCoinsEntity(
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
