import 'dart:async';
import 'package:flutter_cointopper/repository/coin_topper_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'global_data_event.dart';
import 'global_data_state.dart';
 
 
class GlobalDataBloc extends Bloc<GlobalDataEvent, GlobalDataState> {
  final CoinTopperRepository coinRepository;
  StreamSubscription _coinSubscription;

  GlobalDataBloc({@required this.coinRepository})
      : super(GlobalDataLoadInProgress());

  @override
  Stream<GlobalDataState> mapEventToState(GlobalDataEvent event) async* {
    if (event is LoadGlobalData) {
      yield* _mapLoadGlobalDataState();
    }
    {
      if (event is UpdateGlobalData) {
        yield* _mapUpdateGlobalDataState(event);
      }
    }
  }

  Stream<GlobalDataState> _mapLoadGlobalDataState() async* { 
    _coinSubscription?.cancel();
    _coinSubscription = coinRepository.loadGlobalData().listen(
          (list) => add(UpdateGlobalData(list)),
        );
  }

  Stream<GlobalDataState> _mapUpdateGlobalDataState(
      UpdateGlobalData event) async* {
    yield GlobalDataLoadSuccess(event.globalDataList);
  }

  @override
  Future<void> close() {
    _coinSubscription?.cancel();
    return super.close();
  }
}
