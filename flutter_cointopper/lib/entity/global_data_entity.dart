import 'package:equatable/equatable.dart';

class GlobalDataEntity extends Equatable {
  final double total_coins;
  final double total_volume;
  final double total_market_cap;

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
      json['total_coins'] as double,
      json['total_volume'] as double,
      json['total_market_cap'] as double,
    );
  }
}
