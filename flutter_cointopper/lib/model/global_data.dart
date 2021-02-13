import 'package:flutter_cointopper/entity/global_data_entity.dart';
import 'package:meta/meta.dart';

@immutable
class GlobalData {
  final dynamic totalCoins;
  final dynamic totalVolume;
  final dynamic totalMarketCap;

  GlobalData(
    this.totalCoins,
    this.totalVolume,
    this.totalMarketCap,
  );

  GlobalDataEntity toEntity() {
    return GlobalDataEntity(totalCoins, totalVolume, totalMarketCap);
  }

  static GlobalData fromEntity(GlobalDataEntity entity) {
    return GlobalData(
        entity.totalCoins, entity.totalVolume, entity.totalMarketCap);
  }
}
