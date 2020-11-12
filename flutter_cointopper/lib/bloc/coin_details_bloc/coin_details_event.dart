import 'package:equatable/equatable.dart';
import 'package:flutter_cointopper/model/coin_details_model.dart';

abstract class CoinDetailsEvent extends Equatable {
  const CoinDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadCoinDetails extends CoinDetailsEvent {
  final String symbol;
  const LoadCoinDetails(this.symbol);
  @override
  List<String> get props => [symbol];
  
}

class UpdateCoinDetails extends CoinDetailsEvent {
  final List<CoinDetailsModel> coinDetailsList; 
  const UpdateCoinDetails(this.coinDetailsList);

  @override
  List<Object> get props => [coinDetailsList];
}
