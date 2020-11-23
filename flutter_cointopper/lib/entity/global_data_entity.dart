import 'package:equatable/equatable.dart';

class GlobalDataEntity extends Equatable {
  final dynamic total_coins;
  final dynamic total_volume;
  final dynamic total_market_cap;

  GlobalDataEntity(this.total_coins, this.total_volume, this.total_market_cap);

  @override
  List<Object> get props => [
        total_coins,
        total_volume,
        total_market_cap,
      ];

  Map<String, Object> toJson() {
    return {
      'total_coins': total_coins,
      'total_volume': total_volume,
      'total_market_cap': total_market_cap,
    };
  }

  static GlobalDataEntity fromJson(Map<String, Object> json) {
    return GlobalDataEntity(
      json['total_coins'] as  dynamic,
      json['total_volume'] as dynamic,
      json['total_market_cap'] as dynamic,
    );
  }
}
