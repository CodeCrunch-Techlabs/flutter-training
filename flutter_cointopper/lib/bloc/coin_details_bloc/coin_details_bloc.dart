import 'dart:async';
import 'package:flutter_cointopper/repository/coin_topper_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'coin_details_event.dart';
import 'coin_details_state.dart';

class CoinDetailsBloc extends Bloc<CoinDetailsEvent, CoinDetailsState> {
  final CoinTopperRepository coinRepository;
  StreamSubscription _coinSubscription;

  CoinDetailsBloc({@required this.coinRepository})
      : super(CoinDetailsLoadInProgress());

  @override
  Stream<CoinDetailsState> mapEventToState(CoinDetailsEvent event) async* {
    if (event is LoadCoinDetails) {
      yield* _mapLoadCoinDetailsState(event.symbol);
    }
    {
      if (event is UpdateCoinDetails) {
        yield* _mapUpdateCoinDetailsState(event);
      }
    }
  }

  Stream<CoinDetailsState> _mapLoadCoinDetailsState(symbol) async* {
    _coinSubscription?.cancel();
    _coinSubscription = coinRepository.loadCoinDetailsList(symbol).listen(
          (list) => add(UpdateCoinDetails(list)),
        );
  }

  Stream<CoinDetailsState> _mapUpdateCoinDetailsState(
      UpdateCoinDetails event) async* {
    yield CoinDetailsLoadSuccess(event.coinDetailsList);
  }

  @override
  Future<void> close() {
    _coinSubscription?.cancel();
    return super.close();
  }
}
