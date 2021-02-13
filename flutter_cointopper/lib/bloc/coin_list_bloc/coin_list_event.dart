import 'package:equatable/equatable.dart';
import 'package:flutter_cointopper/model/coin_list_all.dart';

abstract class CoinListEvent extends Equatable {
  const CoinListEvent();

  @override
  List<Object> get props => [];
}

class LoadCoinList extends CoinListEvent {
  final dynamic offset;
  final dynamic limit;
  const LoadCoinList(this.offset,this.limit);
  @override
  List<dynamic> get props => ([offset,limit]);
   
  
}

class UpdateCoinList extends CoinListEvent {
  final List<CoinList> coinListList;

  const UpdateCoinList(this.coinListList);

  @override
  List<Object> get props => [coinListList];
}
