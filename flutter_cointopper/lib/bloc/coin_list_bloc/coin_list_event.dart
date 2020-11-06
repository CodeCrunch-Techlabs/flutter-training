import 'package:equatable/equatable.dart';
import 'package:flutter_cointopper/model/coin_list_all.dart';

abstract class CoinListEvent extends Equatable {
  const CoinListEvent();

  @override
  List<Object> get props => [];
}

class LoadCoinList extends CoinListEvent {}

class UpdateCoinList extends CoinListEvent {
  final List<CoinList> coinListList;

  const UpdateCoinList(this.coinListList);

  @override
  List<Object> get props => [coinListList];
}
