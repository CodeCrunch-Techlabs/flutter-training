import 'package:equatable/equatable.dart';

class CurrencyEntity extends Equatable {
  final double id;
  final String name;
  final String code;
  final String symbol;
  final String format;
  final String exchange_rate;
  final double active;

  CurrencyEntity(this.id, this.name, this.code, this.symbol, this.format,
      this.exchange_rate, this.active);

  @override
  List<Object> get props => [
        id,
        name,
        code,
        symbol,
        format,
        exchange_rate,
        active,
      ];

  Map<String, Object> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'symbol': symbol,
      'format': format,
      'exchange_rate': exchange_rate,
      'active': active
    };
  }

  static CurrencyEntity fromJson(Map<String, Object> json) {
    return CurrencyEntity(
        json['id'] as double,
        json['name'] as String,
        json['code'] as String,
        json['symbol'] as String,
        json['format'] as String,
        json['exchange_rate'] as String,
        json['active'] as double);
  }
}
