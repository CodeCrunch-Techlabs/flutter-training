import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

@immutable
abstract class DataEvent {}

class FetchData extends DataEvent {}


@immutable
abstract class DataState {}

class Initial extends DataState {}

class Loading extends DataState {}

class Success extends DataState {}


class DataBloc extends Bloc<DataEvent, DataState> {
  @override
  DataState get initialState => Initial();

  @override
  Stream<DataState> mapEventToState(
      DataEvent event,
      ) async* {
    if (event is FetchData) {
      yield Loading();
      await Future.delayed(Duration(seconds: 2));
      yield Success();
    }
  }
}