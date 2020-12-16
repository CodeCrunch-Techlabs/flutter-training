import 'package:flutter_cointopper/entity/featured_news_entity.dart';
import 'package:meta/meta.dart';

@immutable
class FeaturedNews {
  final int id;
  final String titleEn;
  final String date;
  final String postLink;
  final String photoFile;
  final int visits;
  final String seoDescriptionEn;
  final String createdAt;

  FeaturedNews(this.id, this.titleEn, this.date, this.postLink, this.photoFile,
      this.visits, this.seoDescriptionEn, this.createdAt);

  FeaturedNewsEntity toEntity() {
    return FeaturedNewsEntity(id, titleEn, date, postLink, photoFile, visits,
        seoDescriptionEn, createdAt);
  }

  static FeaturedNews fromEntity(FeaturedNewsEntity entity) {
    return FeaturedNews(
        entity.id,
        entity.titleEn,
        entity.date,
        entity.postLink,
        entity.photoFile,
        entity.visits,
        entity.seoDescriptionEn,
        entity.createdAt);
  }
}
