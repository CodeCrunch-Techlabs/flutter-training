import 'dart:async';
import 'package:flutter_cointopper/repository/coin_topper_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'graph_week_event.dart';
import 'graph_week_state.dart';

class GraphWeekBloc extends Bloc<GraphWeekEvent, GraphWeekState> {
  final CoinTopperRepository coinRepository;
  StreamSubscription _coinSubscription;

  GraphWeekBloc({@required this.coinRepository})
      : super(GraphWeekLoadInProgress());

  @override
  Stream<GraphWeekState> mapEventToState(GraphWeekEvent event) async* {
    if (event is LoadGraphWeek) {
      yield* _mapLoadGraphWeekState(event.marketId);
    }
    {
      if (event is UpdateGraphWeek) {
        yield* _mapUpdateGraphWeekState(event);
      }
    }
  }

  Stream<GraphWeekState> _mapLoadGraphWeekState(marketId) async* {
    _coinSubscription?.cancel();
    _coinSubscription = coinRepository.loadGraphWeekList(marketId).listen(
          (list) => add(UpdateGraphWeek(list)),
        );
  }

  Stream<GraphWeekState> _mapUpdateGraphWeekState(
      UpdateGraphWeek event) async* { 
    yield GraphWeekLoadSuccess(event.graphWeekList);
  }

  @override
  Future<void> close() {
    _coinSubscription?.cancel();
    return super.close();
  }
}
