import 'package:flutter_cointopper/entity/coin_details_entity.dart';
import 'package:meta/meta.dart';

@immutable
class CoinDetailsModel {
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
  final List<dynamic> guides;

  CoinDetailsModel(
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
      this.available_supply,
      this.guides);

  CoinDetailsEntity toEntity() {
    return CoinDetailsEntity(
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
        guides);
  }

  static CoinDetailsModel fromEntity(CoinDetailsEntity entity) {
    return CoinDetailsModel(
        entity.percent_change24h,
        entity.logo,
        entity.price_btc,
        entity.price,
        entity.symbol,
        entity.name,
        entity.color1,
        entity.color2,
        entity.market_cap_usd,
        entity.intro,
        entity.volume24h_usd,
        entity.low24_usd,
        entity.high24_usd,
        entity.website,
        entity.explorer,
        entity.forum,
        entity.github,
        entity.facebook,
        entity.raddit,
        entity.blog,
        entity.slack,
        entity.paper,
        entity.youtube,
        entity.available_supply,
        entity.guides);
  }
}
