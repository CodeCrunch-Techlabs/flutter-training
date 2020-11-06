import 'dart:async';
import 'package:flutter_cointopper/repository/coin_topper_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'coin_list_event.dart';
import 'coin_list_state.dart';
 
class CoinListBloc extends Bloc<CoinListEvent, CoinListState> {
  final CoinTopperRepository coinRepository;
  StreamSubscription _coinSubscription;

  CoinListBloc({@required this.coinRepository})
      : super(CoinListLoadInProgress());

  @override
  Stream<CoinListState> mapEventToState(CoinListEvent event) async* {
    if (event is LoadCoinList) {
      yield* _mapLoadCoinListState();
    }
    {
      if (event is UpdateCoinList) {
        yield* _mapUpdateCoinListState(event);
      }
    }
  }

  Stream<CoinListState> _mapLoadCoinListState() async* {
    print("bloc enterred");
    _coinSubscription?.cancel();
    _coinSubscription = coinRepository.loadAllCoinsList().listen(
          (list) => add(UpdateCoinList(list)),
        );
  }

  Stream<CoinListState> _mapUpdateCoinListState(
      UpdateCoinList event) async* {
    yield CoinListLoadSuccess(event.coinListList);
  }

  @override
  Future<void> close() {
    _coinSubscription?.cancel();
    return super.close();
  }
}
