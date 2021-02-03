import 'package:equatable/equatable.dart';

class CurrencyEntity extends Equatable {
  final dynamic id;
  final String name;
  final String code;
  final String symbol;
  final String format;
  final String exchangeRate;
  final dynamic active;

  CurrencyEntity(this.id, this.name, this.code, this.symbol, this.format,
      this.exchangeRate, this.active);

  @override
  List<Object> get props => [
        id,
        name,
        code,
        symbol,
        format,
        exchangeRate,
        active,
      ];

  Map<String, Object> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'symbol': symbol,
      'format': format,
      'exchange_rate': exchangeRate,
      'active': active
    };
  }

  static CurrencyEntity fromJson(Map<String, Object> json) {
    return CurrencyEntity(
        json['id'] as dynamic,
        json['name'] as String,
        json['code'] as String,
        json['symbol'] as String,
        json['format'] as String,
        json['exchange_rate'] as String,
        json['active'] as dynamic);
  }
}
