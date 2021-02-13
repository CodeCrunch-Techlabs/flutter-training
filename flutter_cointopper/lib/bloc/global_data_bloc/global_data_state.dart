import 'package:equatable/equatable.dart';
import 'package:flutter_cointopper/model/global_data.dart';

abstract class GlobalDataState extends Equatable {
  const GlobalDataState();

  @override
  List<Object> get props => [];
}

class GlobalDataLoadInProgress extends GlobalDataState {}

class GlobalDataLoadSuccess extends GlobalDataState {
  final List<GlobalData> globalDataList;

  const GlobalDataLoadSuccess([this.globalDataList = const []]);

  @override
  List<Object> get props => [globalDataList];
}

class GlobalDataLoadFailure extends GlobalDataState {}
