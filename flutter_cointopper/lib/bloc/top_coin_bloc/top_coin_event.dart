import 'package:equatable/equatable.dart';
import 'package:flutter_cointopper/model/top_coin.dart';

abstract class TopCoinsEvent extends Equatable {
  const TopCoinsEvent();

  @override
  List<Object> get props => [];
}

class LoadTopCoins extends TopCoinsEvent {}

class UpdateTopCoins extends TopCoinsEvent {
  final List<TopCoins> topCoinsList;

  const UpdateTopCoins(this.topCoinsList);

  @override
  List<Object> get props => [topCoinsList];
}
