import 'package:flutter_cointopper/entity/graph_week_entity.dart';
import 'package:meta/meta.dart';

@immutable
class GraphWeekModel {
  final double marketCap;
  final  dynamic btcPrice;
  final double percentChange7d;
  final double price;
  final double percentChange24h;
  final double totalSupply;
  final  dynamic maxSupply;
  final double volume24h;
  final double circulatingSupply;
  final int time;
  final double percentChange1h;

  GraphWeekModel(
      this.marketCap,
      this.btcPrice,
      this.percentChange7d,
      this.price,
      this.percentChange24h,
      this.totalSupply,
      this.maxSupply,
      this.volume24h,
      this.circulatingSupply,
      this.time,
      this.percentChange1h);

  GraphWeekModelEntity toEntity() {
    return GraphWeekModelEntity(
        marketCap,
        btcPrice,
        percentChange7d,
        price,
        percentChange24h,
        totalSupply,
        maxSupply,
        volume24h,
        circulatingSupply,
        time,
        percentChange1h);
  }

  static GraphWeekModel fromEntity(GraphWeekModelEntity entity) {
    return GraphWeekModel(
        entity.marketCap,
        entity.btcPrice,
        entity.percentChange7d,
        entity.price,
        entity.percentChange24h,
        entity.totalSupply,
        entity.maxSupply,
        entity.volume24h,
        entity.circulatingSupply,
        entity.time,
        entity.percentChange1h);
  }
}
