import 'package:flutter_cointopper/entity/news_search_entity.dart';
import 'package:meta/meta.dart';

@immutable
class NewsSearchModel {
  final int id;
  final String titleEn;
  final String date;
  final String postLink;
  final String photoFile;
  final int visits;
  final String seoDescriptionEn;
  final String createdAt;

  NewsSearchModel(this.id, this.titleEn, this.date, this.postLink,
      this.photoFile, this.visits, this.seoDescriptionEn, this.createdAt);

  NewsSearchEntity toEntity() {
    return NewsSearchEntity(id, titleEn, date, postLink, photoFile, visits,
        seoDescriptionEn, createdAt);
  }

  static NewsSearchModel fromEntity(NewsSearchEntity entity) {
    return NewsSearchModel(
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
