import 'package:equatable/equatable.dart';

class GlobalDataEntity extends Equatable {
  final dynamic totalCoins;
  final dynamic totalVolume;
  final dynamic totalMarketCap;

  GlobalDataEntity(this.totalCoins, this.totalVolume, this.totalMarketCap);

  @override
  List<Object> get props => [
        totalCoins,
        totalVolume,
        totalMarketCap,
      ];

  Map<String, Object> toJson() {
    return {
      'total_coins': totalCoins,
      'total_volume': totalVolume,
      'total_market_cap': totalMarketCap,
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
