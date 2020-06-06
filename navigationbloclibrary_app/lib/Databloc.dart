import 'package:bloc/bloc.dart';

enum MyEvent { eventA, eventB }


abstract class MyState {}

class StateA extends MyState {}

class StateB extends MyState {}



class MyBloc extends Bloc<MyEvent, MyState> {
  @override
  MyState get initialState => StateA();

  @override
  Stream<MyState> mapEventToState(MyEvent event) async* {
    switch (event) {
      case MyEvent.eventA:
        yield StateA();
        break;
      case MyEvent.eventB:
        yield StateB();
        break;
    }
  }
}
