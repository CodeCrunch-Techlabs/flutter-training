import 'package:equatable/equatable.dart';
import 'package:flutter_cointopper/model/news_details_model.dart'; 

abstract class NewsDetailsEvent extends Equatable {
  const NewsDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadNewsDetails extends NewsDetailsEvent {
  final int id;
  const LoadNewsDetails(this.id);
  @override
  List<int> get props => [id];
}

class UpdateNewsDetails extends NewsDetailsEvent {
  final List<NewsDetailsModel> newsDetailsList;

  const UpdateNewsDetails(this.newsDetailsList);

  @override
  List<Object> get props => [newsDetailsList];
}
