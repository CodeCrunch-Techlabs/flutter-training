import 'package:flutter_cointopper/entity/global_data_entity.dart';
import 'package:meta/meta.dart';

@immutable
class GlobalData {
  final dynamic total_coins;
  final dynamic total_volume;
  final dynamic total_market_cap;

  GlobalData(
    this.total_coins,
    this.total_volume,
    this.total_market_cap,
  );

  GlobalDataEntity toEntity() {
    return GlobalDataEntity(total_coins, total_volume, total_market_cap);
  }

  static GlobalData fromEntity(GlobalDataEntity entity) {
    return GlobalData(
        entity.total_coins, entity.total_volume, entity.total_market_cap);
  }
}
