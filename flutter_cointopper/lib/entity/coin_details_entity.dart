import 'package:equatable/equatable.dart';

class CoinDetailsEntity extends Equatable {
  final double percent_change24h;
  final String logo;
  final double price_btc;
  final double price;
  final String symbol;
  final String name;
  final String color1;
  final String color2;
  final double market_cap_usd;
  final String intro;
  final double volume24h_usd;
  final double low24_usd;
  final double high24_usd;
  final String website;
  final String explorer;
  final String forum;
  final String github;
  final String facebook;
  final String raddit;
  final String blog;
  final String slack;
  final String paper;
  final String youtube;
  final double available_supply;

  CoinDetailsEntity(
      this.percent_change24h,
      this.logo,
      this.price_btc,
      this.price,
      this.symbol,
      this.name,
      this.color1,
      this.color2,
      this.market_cap_usd,
      this.intro,
      this.volume24h_usd,
      this.low24_usd,
      this.high24_usd,
      this.website,
      this.explorer,
      this.forum,
      this.github,
      this.facebook,
      this.raddit,
      this.blog,
      this.slack,
      this.paper,
      this.youtube,
      this.available_supply);

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
        market_cap_usd,
        intro,
        volume24h_usd,
        low24_usd,
        high24_usd,
        website,
        explorer,
        forum,
        github,
        facebook,
        raddit,
        blog,
        slack,
        paper,
        youtube,
        available_supply,
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
      'intro': intro,
      'volume24h_usd': volume24h_usd,
      'low24_usd': low24_usd,
      'high24_usd': high24_usd,
      'website': website,
      'explorer': explorer,
      'forum': forum,
      'github': github,
      'facebook': facebook,
      'raddit': raddit,
      'blog': blog,
      'slack': slack,
      'paper': paper,
      'youtube;': youtube,
      'available_supply': available_supply
    };
  }

  static CoinDetailsEntity fromJson(Map<String, Object> json) {
    return CoinDetailsEntity(
      json['percent_change24h'] as double,
      json['logo'] as String,
      json['price_btc'] as double,
      json['price'] as double,
      json['symbol'] as String,
      json['name'] as String,
      json['color1'] as String,
      json['color2'] as String,
      json['market_cap_usd'] as double,
      json['intro'] as String,
      json['volume24h_usd'] as double,
      json['low24_usd'] as double,
      json['high24_usd'] as double,
      json['website'] as String,
      json['explorer'] as String,
      json['forum'] as String,
      json['github'] as String,
      json['facebook'] as String,
      json['raddit'] as String,
      json['blog'] as String,
      json['slack'] as String,
      json['paper'] as String,
      json['youtube'] as String,
      json['available_supply'] as double,
    );
  }
}