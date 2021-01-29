import 'package:equatable/equatable.dart'; 
import 'package:flutter_cointopper/model/graph_week_model.dart';

abstract class GraphWeekEvent extends Equatable {
  const GraphWeekEvent();

  @override
  List<Object> get props => [];
}

class LoadGraphWeek extends GraphWeekEvent {
  final int marketId;
  const LoadGraphWeek(this.marketId);
  @override
  List<int> get props => [marketId];
  
}

class UpdateGraphWeek extends GraphWeekEvent {
  final List<GraphWeekModel> graphWeekList; 
  const UpdateGraphWeek(this.graphWeekList);

  @override
  List<Object> get props => [graphWeekList];
}
