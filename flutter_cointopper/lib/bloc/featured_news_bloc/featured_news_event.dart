import 'package:equatable/equatable.dart';
import 'package:flutter_cointopper/model/featured_news.dart';

abstract class FeaturedNewsEvent extends Equatable {
  const FeaturedNewsEvent();

  @override
  List<Object> get props => [];
}

class LoadFeaturedNewsList extends FeaturedNewsEvent {}

class UpdateFeaturedNewsList extends FeaturedNewsEvent {
  final List<FeaturedNews> featuredNewsList;

  const UpdateFeaturedNewsList(this.featuredNewsList);

  @override
  List<Object> get props => [featuredNewsList];
}
