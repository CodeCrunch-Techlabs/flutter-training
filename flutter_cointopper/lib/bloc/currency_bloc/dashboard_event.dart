import 'package:equatable/equatable.dart';
import 'package:flutter_cointopper/model/currency.dart';

abstract class CurrencyEvent extends Equatable {
  const CurrencyEvent();

  @override
  List<Object> get props => [];
}

class LoadCurrencyList extends CurrencyEvent {}

class UpdateCurrencyList extends CurrencyEvent {
  final List<Currency> currencyList;

  const UpdateCurrencyList(this.currencyList);

  @override
  List<Object> get props => [currencyList];
}
