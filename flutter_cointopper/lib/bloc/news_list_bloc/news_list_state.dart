import 'package:equatable/equatable.dart';
import 'package:flutter_cointopper/model/news_list_model.dart';

abstract class NewsListState extends Equatable {
  const NewsListState();

  @override
  List<Object> get props => [];
}

class NewsListLoadInProgress extends NewsListState {}

class NewsListLoadSuccess extends NewsListState {
  final List<NewsListModel> newsList;

  const NewsListLoadSuccess([this.newsList = const []]);

  @override
  List<Object> get props => [newsList];
}

class NewsListLoadFailure extends NewsListState {}
