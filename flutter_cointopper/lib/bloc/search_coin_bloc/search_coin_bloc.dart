import 'dart:async';
import 'package:flutter_cointopper/bloc/search_coin_bloc/search_coin_event.dart';
import 'package:flutter_cointopper/bloc/search_coin_bloc/search_coin_state.dart';
import 'package:flutter_cointopper/repository/coin_topper_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
 
class SearchCoinBloc extends Bloc<SearchCoinEvent, SearchCoinState> {
  final CoinTopperRepository coinRepository;
  StreamSubscription _coinSubscription;

  SearchCoinBloc({@required this.coinRepository})
      : super(SearchCoinLoadInProgress());

  @override
  Stream<SearchCoinState> mapEventToState(SearchCoinEvent event) async* {
    if (event is LoadSearchCoin) {
      yield* _mapLoadSearchCoinState();
    }
    {
      if (event is UpdateSearchCoin) {
        yield* _mapUpdateSearchCoinState(event);
      }
    }
  }

  Stream<SearchCoinState> _mapLoadSearchCoinState() async* { 
    _coinSubscription?.cancel();
    _coinSubscription = coinRepository.loadSearchCoinsList().listen(
          (list) => add(UpdateSearchCoin(list)),
        );
  }

  Stream<SearchCoinState> _mapUpdateSearchCoinState(
      UpdateSearchCoin event) async* {
    yield SearchCoinLoadSuccess(event.searchCoinList);
  }

  @override
  Future<void> close() {
    _coinSubscription?.cancel();
    return super.close();
  }
}
