import 'dart:async';
import 'package:flutter_cointopper/bloc/dashboard_event.dart';
import 'package:flutter_cointopper/bloc/dashboard_state.dart';
import 'package:flutter_cointopper/repository/coin_topper_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final CoinTopperRepository coinRepository;
  StreamSubscription _coinSubscription;

  CurrencyBloc({@required this.coinRepository})
      : super(CurrencyListLoadInProgress());

  @override
  Stream<CurrencyState> mapEventToState(CurrencyEvent event) async* {
    if (event is LoadCurrencyList) {
      yield* _mapLoadCurrencyListState();
    }
    {
      if (event is UpdateCurrencyList) {
        yield* _mapUpdateCurrencyListState(event);
      }
    }
  }

  Stream<CurrencyState> _mapLoadCurrencyListState() async* {
    print("bloc enterred");
    _coinSubscription?.cancel();
    _coinSubscription = coinRepository.loadCurrencyList().listen(
          (list) => add(UpdateCurrencyList(list)),
        );
  }

  Stream<CurrencyState> _mapUpdateCurrencyListState(
      UpdateCurrencyList event) async* {
        print("11==> ${event.currencyList}");
    yield CurrencyListLoadSuccess(event.currencyList);
  }

  @override
  Future<void> close() {
    _coinSubscription?.cancel();
    return super.close();
  }
}