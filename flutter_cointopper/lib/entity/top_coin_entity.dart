import 'package:equatable/equatable.dart';

class TopCoinsEntity extends Equatable {
  final double percent_change24h;
  final String logo;
  final double price_btc;
  final double price;
  final String symbol;
  final String name;

  TopCoinsEntity(this.percent_change24h, this.logo, this.price_btc, this.price,
      this.symbol, this.name);

  @override
  List<Object> get props =>
      [percent_change24h, logo, price_btc, price, symbol, name];

  Map<String, Object> toJson() {
    return {
      'percent_change24h': percent_change24h,
      'logo': logo,
      'price_btc': price_btc,
      'price': price,
      'symbol': symbol,
      'name': name,
    };
  }

  static TopCoinsEntity fromJson(Map<String, Object> json) {
    return TopCoinsEntity(
        json['percent_change24h'] as double,
        json['logo'] as String,
        json['price_btc'] as double,
        json['price'] as double,
        json['symbol'] as String,
        json['name'] as String);
  }
}
