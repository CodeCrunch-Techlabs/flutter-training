import 'package:equatable/equatable.dart';

class Data {
  final String title;
  final String photo;

  Data({this.title, this.photo});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      title: json['title_en'],
      photo: json['photo_file'],
    );
  }
}

class CoinDetailsEntity extends Equatable {
  final double percentChange24h;
  final String logo;
  final dynamic priceBtc;
  final double price;
  final String symbol;
  final String name;
  final String color1;
  final String color2;
  final dynamic marketCapUsd;
  final String intro;
  final double volume24hUsd;
  final double low24Usd;
  final double high24Usd;
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
  final dynamic availableSupply;
  final List<dynamic> guides;
  final int marketId;

  CoinDetailsEntity(
      this.percentChange24h,
      this.logo,
      this.priceBtc,
      this.price,
      this.symbol,
      this.name,
      this.color1,
      this.color2,
      this.marketCapUsd,
      this.intro,
      this.volume24hUsd,
      this.low24Usd,
      this.high24Usd,
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
      this.availableSupply,
      this.guides,
      this.marketId);

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
        marketCapUsd,
        intro,
        volume24hUsd,
        low24Usd,
        high24Usd,
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
        availableSupply,
        guides,
        marketId,
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
      'intro': intro,
      'volume24h_usd': volume24hUsd,
      'low24_usd': low24Usd,
      'high24_usd': high24Usd,
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
      'available_supply': availableSupply,
      'guides': guides,
      'market_id': marketCapUsd,
    };
  }

  static CoinDetailsEntity fromJson(Map<String, Object> json) {
    var list = json['guides'] as List;
    List<Data> _dataList = list.map((i) => Data.fromJson(i)).toList();
    return CoinDetailsEntity(
      json['percent_change24h'] as double,
      json['logo'] as String,
      json['price_btc'] as dynamic,
      json['price'] as double,
      json['symbol'] as String,
      json['name'] as String,
      json['color1'] as String,
      json['color2'] as String,
      json['market_cap_usd'] as dynamic,
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
      json['available_supply'] as dynamic,
      _dataList,
      json['market_id'] as int,
    );
  }
}
