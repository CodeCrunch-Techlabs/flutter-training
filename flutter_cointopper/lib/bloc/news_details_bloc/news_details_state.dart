import 'package:equatable/equatable.dart';
import 'package:flutter_cointopper/model/news_details_model.dart';

abstract class NewsDetailsState extends Equatable {
  const NewsDetailsState();

  @override
  List<Object> get props => [];
}

class NewsDetailsLoadInProgress extends NewsDetailsState {}

class NewsDetailsLoadSuccess extends NewsDetailsState {
  final List<NewsDetailsModel> newsDetailsList;

  const NewsDetailsLoadSuccess([this.newsDetailsList = const []]);

  @override
  List<Object> get props => [newsDetailsList];
}

class NewsDetailsLoadFailure extends NewsDetailsState {}
