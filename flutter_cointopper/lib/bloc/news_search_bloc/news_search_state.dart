import 'package:equatable/equatable.dart'; 
import 'package:flutter_cointopper/model/news_search_model.dart';

abstract class NewsSearchState extends Equatable {
  const NewsSearchState();

  @override
  List<Object> get props => [];
}

class NewsSearchLoadInProgress extends NewsSearchState {
  
}

class NewsSearchLoadSuccess extends NewsSearchState {
  final List<NewsSearchModel> newsSearchList;

  const NewsSearchLoadSuccess([this.newsSearchList = const []]);

  @override
  List<Object> get props => [newsSearchList];
}

class NewsSearchLoadFailure extends NewsSearchState {}
