import 'package:equatable/equatable.dart';
import 'package:flutter_cointopper/model/search_coin_model.dart';

abstract class SearchCoinState extends Equatable {
  const SearchCoinState();

  @override
  List<Object> get props => [];
}

class SearchCoinLoadInProgress extends SearchCoinState {}

class SearchCoinLoadSuccess extends SearchCoinState {
  final List<SearchCoinModel> searchCoinList;

  const SearchCoinLoadSuccess([this.searchCoinList = const []]);

  @override
  List<Object> get props => [searchCoinList];
}

class SearchCoinLoadFailure extends SearchCoinState {}
