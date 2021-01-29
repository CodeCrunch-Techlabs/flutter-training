import 'package:equatable/equatable.dart';
import 'package:flutter_cointopper/model/graph_week_model.dart';

abstract class GraphWeekState extends Equatable {
  const GraphWeekState();

  @override
  List<Object> get props => [];
}

class GraphWeekLoadInProgress extends GraphWeekState {}

class GraphWeekLoadSuccess extends GraphWeekState {
  final List<GraphWeekModel> graphWeekList;
  const GraphWeekLoadSuccess([this.graphWeekList = const []]);

  @override
  List<Object> get props => [graphWeekList];
}

class GraphWeekLoadFailure extends GraphWeekState {}
