import 'package:equatable/equatable.dart'; 
import 'package:flutter_cointopper/model/news_search_model.dart';

abstract class NewsSearchEvent extends Equatable {
  const NewsSearchEvent();

  @override
  List<Object> get props => [];
}

class LoadNewsSearch extends NewsSearchEvent {
  final String keyword;
  const LoadNewsSearch(this.keyword);
  @override
  List<String> get props => [keyword];
}

class UpdateNewsSearch extends NewsSearchEvent {
  final List<NewsSearchModel> newsSearchList;

  const UpdateNewsSearch(this.newsSearchList);

  @override
  List<Object> get props => [newsSearchList];
}
