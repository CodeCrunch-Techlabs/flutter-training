import 'package:equatable/equatable.dart';
import 'package:flutter_cointopper/model/news_list_model.dart';

abstract class NewsListEvent extends Equatable {
  const NewsListEvent();

  @override
  List<Object> get props => [];
}

class LoadNewsList extends NewsListEvent {}

class UpdateNewsList extends NewsListEvent {
  final List<NewsListModel> newsList;

  const UpdateNewsList(this.newsList);

  @override
  List<Object> get props => [newsList];
}
