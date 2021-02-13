import 'package:equatable/equatable.dart';
import 'package:flutter_cointopper/model/global_data.dart';

abstract class GlobalDataEvent extends Equatable {
  const GlobalDataEvent();

  @override
  List<Object> get props => [];
}

class LoadGlobalData extends GlobalDataEvent {}

class UpdateGlobalData extends GlobalDataEvent {
  final List<GlobalData> globalDataList;

  const UpdateGlobalData(this.globalDataList);

  @override
  List<Object> get props => [globalDataList];
}
