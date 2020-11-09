import 'package:flutter_cointopper/entity/global_data_entity.dart';
import 'package:meta/meta.dart';

@immutable
class GlobalData {
  final double total_coins;
  final double total_volume;
  final double total_market_cap;

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
