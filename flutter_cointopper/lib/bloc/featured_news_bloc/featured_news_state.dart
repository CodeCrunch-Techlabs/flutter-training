import 'package:equatable/equatable.dart';
import 'package:flutter_cointopper/model/featured_news.dart'; 

abstract class FeaturedNewsState extends Equatable {
  const  FeaturedNewsState();

  @override
  List<Object> get props => [];
}

class FeaturedNewsListLoadInProgress extends FeaturedNewsState {}

class FeaturedNewsListLoadSuccess extends FeaturedNewsState {
  final List<FeaturedNews> featuredNewsList;

  const FeaturedNewsListLoadSuccess([this.featuredNewsList = const []]);

  @override
  List<Object> get props => [featuredNewsList];
}

class FeaturedNewsLoadFailure extends FeaturedNewsState {}
