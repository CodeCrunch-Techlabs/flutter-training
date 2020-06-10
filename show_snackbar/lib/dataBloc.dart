import 'package:bloc/bloc.dart'; 
import 'dataEvent.dart';
import 'dataState.dart';

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
       yield Fail();
     
    }else{
      yield Success();
    }
  }
}
