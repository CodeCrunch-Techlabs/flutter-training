import 'package:flutter_cointopper/entity/currency_entity.dart';
import 'package:meta/meta.dart';

@immutable
class Currency {
  final dynamic id;
  final String name;
  final String code;
  final String symbol;
  final String format;
  final String exchange_rate;
  final dynamic active;

  Currency(this.id, this.name, this.code, this.symbol, this.format, this.exchange_rate,
  this.active);

  CurrencyEntity toEntity() {
    return CurrencyEntity(id, name, code, symbol, format,exchange_rate,active);
  }

  static Currency fromEntity(CurrencyEntity entity) {
    return Currency(entity.id, entity.name, entity.code,entity.symbol,
        entity.format,entity.exchange_rate,entity.active);
  }
}
