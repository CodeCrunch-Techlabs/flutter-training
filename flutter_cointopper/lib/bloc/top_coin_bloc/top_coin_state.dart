import 'package:equatable/equatable.dart'; 
import 'package:flutter_cointopper/model/top_coin.dart';

abstract class TopCoinsState extends Equatable {
  const  TopCoinsState();

  @override
  List<Object> get props => [];
}

class TopCoinsLoadInProgress extends TopCoinsState {}

class TopCoinsLoadSuccess extends TopCoinsState {
  final List<TopCoins> topCoinsList;

  const TopCoinsLoadSuccess([this.topCoinsList = const []]);

  @override
  List<Object> get props => [topCoinsList];
}

class  TopCoinsLoadFailure extends TopCoinsState {}
