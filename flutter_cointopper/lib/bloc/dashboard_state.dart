import 'package:equatable/equatable.dart';
import 'package:flutter_cointopper/model/currency.dart';

abstract class CurrencyState extends Equatable {
  const  CurrencyState();

  @override
  List<Object> get props => [];
}

class CurrencyListLoadInProgress extends CurrencyState {}

class CurrencyListLoadSuccess extends CurrencyState {
  final List<Currency> currencyList;

  const CurrencyListLoadSuccess([this.currencyList = const []]);

  @override
  List<Object> get props => [currencyList];
}

class CurrencyLoadFailure extends CurrencyState {}
