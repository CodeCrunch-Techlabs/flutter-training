import 'package:flutter_cointopper/entity/coin_details_entity.dart';
import 'package:meta/meta.dart';

@immutable
class CoinDetailsModel {
  final double percentChange24h;
  final String logo;
  final dynamic priceBtc;
  final double price;
  final String symbol;
  final String name;
  final String color1;
  final String color2;
  final double marketCapUsd;
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
  final double availableSupply;
  final List<dynamic> guides;
  final int marketId;

  CoinDetailsModel(
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

  CoinDetailsEntity toEntity() {
    return CoinDetailsEntity(
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
        marketId);
  }

  static CoinDetailsModel fromEntity(CoinDetailsEntity entity) {
    return CoinDetailsModel(
        entity.percentChange24h,
        entity.logo,
        entity.priceBtc,
        entity.price,
        entity.symbol,
        entity.name,
        entity.color1,
        entity.color2,
        entity.marketCapUsd,
        entity.intro,
        entity.volume24hUsd,
        entity.low24Usd,
        entity.high24Usd,
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
        entity.availableSupply,
        entity.guides,
        entity.marketId);
  }
}
