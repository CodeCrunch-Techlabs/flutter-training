import 'dart:async';
import 'package:flutter_cointopper/repository/coin_topper_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'top_coin_event.dart';
import 'top_coin_state.dart';

class TopCoinsBloc extends Bloc<TopCoinsEvent, TopCoinsState> {
  final CoinTopperRepository coinRepository;
  StreamSubscription _coinSubscription;

  TopCoinsBloc({@required this.coinRepository})
      : super(TopCoinsLoadInProgress());

  @override
  Stream<TopCoinsState> mapEventToState(TopCoinsEvent event) async* {
    if (event is LoadTopCoins) {
      yield* _mapLoadTopCoinsListState(event.currencyCode);
    }
    {
      if (event is UpdateTopCoins) {
        yield* _mapUpdateTopCoinsListState(event);
      }
    }
  }

  Stream<TopCoinsState> _mapLoadTopCoinsListState(currencyCode) async* {
    print("bloc enterred");
    _coinSubscription?.cancel();
    _coinSubscription = coinRepository.loadTopCoinsList(currencyCode).listen(
          (list) => add(UpdateTopCoins(list)),
        );
  }

  Stream<TopCoinsState> _mapUpdateTopCoinsListState(
      UpdateTopCoins event) async* {
    yield TopCoinsLoadSuccess(event.topCoinsList);
  }

  @override
  Future<void> close() {
    _coinSubscription?.cancel();
    return super.close();
  }
}
