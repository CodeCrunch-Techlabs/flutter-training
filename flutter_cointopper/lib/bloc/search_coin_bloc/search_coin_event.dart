import 'package:equatable/equatable.dart';
import 'package:flutter_cointopper/model/search_coin_model.dart';

abstract class SearchCoinEvent extends Equatable {
  const SearchCoinEvent();

  @override
  List<Object> get props => [];
}

class LoadSearchCoin extends SearchCoinEvent {}

class UpdateSearchCoin extends SearchCoinEvent {
  final List<SearchCoinModel> searchCoinList;

  const UpdateSearchCoin(this.searchCoinList);

  @override
  List<Object> get props => [searchCoinList];
}
