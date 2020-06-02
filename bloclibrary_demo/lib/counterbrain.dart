import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {//async* is used for calling continually
    switch (event) {
      case CounterEvent.decrement:
        yield state - 1; //Return is terminated after returning and yield is not terminated after giving value.
        break;
      case CounterEvent.increment:
        yield state + 1;
        break;
    }
  }
}