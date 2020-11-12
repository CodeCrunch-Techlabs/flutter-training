import 'package:equatable/equatable.dart';
import 'package:flutter_cointopper/model/coin_details_model.dart';

abstract class CoinDetailsState extends Equatable {
  const CoinDetailsState();

  @override
  List<Object> get props => [];
}

class CoinDetailsLoadInProgress extends CoinDetailsState { 
}

class CoinDetailsLoadSuccess extends CoinDetailsState {
  final List<CoinDetailsModel> coinDetailsList; 
  const CoinDetailsLoadSuccess([this.coinDetailsList = const []]);

  @override
  List<Object> get props => [coinDetailsList];
}

class CoinDetailsLoadFailure extends CoinDetailsState {}
