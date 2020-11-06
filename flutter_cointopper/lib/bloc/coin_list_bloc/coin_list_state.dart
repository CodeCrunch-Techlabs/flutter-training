import 'package:equatable/equatable.dart';
import 'package:flutter_cointopper/model/coin_list_all.dart';

abstract class CoinListState extends Equatable {
  const CoinListState();

  @override
  List<Object> get props => [];
}

class CoinListLoadInProgress extends CoinListState {}

class CoinListLoadSuccess extends CoinListState {
  final List<CoinList> coinListList;

  const CoinListLoadSuccess([this.coinListList = const []]);

  @override
  List<Object> get props => [coinListList];
}

class CoinListLoadFailure extends CoinListState {}
